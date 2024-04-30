package com.lpw.annuaire.controllers;

import com.lpw.annuaire.configs.Connect;
import com.lpw.annuaire.modals.Etudiant;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "recherche", value = "/recherche")

public class SearchEtudaint extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String query = req.getParameter("search");
        System.out.println("this is query : " + query);
        if (query == null) {
            req.setAttribute("message", "Query non valid, Veuillez specifie un nom, prenom ou cne.");
            req.getRequestDispatcher("/views/error.jsp").forward(req, resp);
        }
        ArrayList<Etudiant> etudiants = Connect.toEtudiants(Connect.select(
                "SELECT e.CNE, e.nom, e.prenom, e.telephone, f.libelle AS feliere, d.libelle AS departement FROM etudiant e LEFT JOIN feliere f ON e.feliere = f.id LEFT JOIN departement d ON e.departement = d.id WHERE e.CNE LIKE '%"
                        + query + "%' OR e.nom LIKE '%" + query + "%'  OR e.prenom LIKE '%" + query
                        + "%' OR e.telephone LIKE '%" + query + "%'  OR f.libelle LIKE '%" + query
                        + "%'  OR d.libelle LIKE '%" + query + "%'; "));

        // ArrayList<Etudiant> etudiants = Connect.toEtudiants(Connect.select("SELECT
        // e.CNE, e.nom, e.prenom, e.telephone, f.libelle AS feliere, d.libelle AS
        // departement FROM etudiant e LEFT JOIN feliere f ON e.feliere = f.id LEFT JOIN
        // departement d ON e.departement = d.id WHERE e.CNE LIKE '%" + query + "%' OR
        // e.nom LIKE '%" + query + "%' OR e.prenom LIKE '%" + query + "%' OR f.libelle
        // LIKE '%" + query + "%' OR d.libelle LIKE '%" + query + "%';"));

        req.setAttribute("etudiants", etudiants);

        req.getRequestDispatcher("views/etudiants.jsp").forward(req, resp);

    }
}
