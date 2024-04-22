package com.lpw.annuaire.configs;

import com.lpw.annuaire.modals.Departement;
import com.lpw.annuaire.modals.Etudiant;
import com.lpw.annuaire.modals.Feliere;
import org.jetbrains.annotations.NotNull;

import java.sql.*;
import java.util.ArrayList;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connect {

    public static Connection connection = null;
    public static Statement statement;

    public static boolean open() {
        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("MySQL JDBC driver not found: " + e.getMessage());
            return false;
        }

        try {
            // Establish connection
            connection = DriverManager
                    .getConnection("jdbc:mysql://127.0.0.1:3306/mini_annuaire?user=root&password=12345");
            if (connection != null) {
                System.out.println("Connection successful");
                return true;
            } else {
                System.out.println("Connection failed");
                return false;
            }
        } catch (SQLException ex) {
            System.out.println("Connection error: " + ex.getMessage());
            return false;
        }
        
    }

    @org.jetbrains.annotations.Nullable
    public static ResultSet select(String sql) {
        if (open()) {
            try {
                statement = connection.createStatement();
                return statement.executeQuery(sql);
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
                return null;
            }
        }
        return null;
    }

    public static int update(String sql) {
        if (open()) {
            try {
                statement = connection.createStatement();
                return statement.executeUpdate(sql);
            } catch (Exception ex) {
                // System.out.println(ex.getMessage());
                System.out.println("test");
                return 0;
            }
        }
        return 0;
    }

    public static ResultSet select(String sql, String filter, String field) {
        if (open()) {
            try {
                statement = connection.prepareStatement(sql + " where " + field + " like %" + filter + "%");
                return statement.executeQuery(sql + " where " + field + " like %" + filter + "%");
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
                return null;
            }
        }
        return null;
    }

    @NotNull
    public static ArrayList<Departement> toDepartements(ResultSet rs) {
        ArrayList<Departement> departements = new ArrayList<>();
        try {
            // System.err.println(rs);

            while (rs.next()) {
                departements.add(
                        new Departement(
                                rs.getInt("id"),
                                rs.getString("libelle")));
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return departements;
    }

    public static ArrayList<Feliere> toFelieres(ResultSet rs) {
        ArrayList<Feliere> felieres = new ArrayList<>();
        try {
            while (rs.next()) {
                felieres.add(
                        new Feliere(
                                rs.getInt("id"),
                                rs.getString("libelle"),
                                new Departement(rs.getInt("departementId"), rs.getString("departement"))));
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return felieres;
    }

    public static ArrayList<Etudiant> toEtudiants(ResultSet rs) {
        ArrayList<Etudiant> etudiants = new ArrayList<>();
        try {
            while (rs.next()) {
                etudiants.add(
                        new Etudiant(
                                rs.getString("CNE"),
                                rs.getString("nom"),
                                rs.getString("prenom"),
                                rs.getString("telephone"),
                                new Feliere(rs.getInt("feliereId"), rs.getString("feliere")),
                                new Departement(rs.getInt("departementId"), rs.getString("departement"))));
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return etudiants;
    }

}
