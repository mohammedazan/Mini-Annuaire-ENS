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
        if (query == null){
            req.setAttribute("message", "Query non valid, Veuillez specifie un nom, prenom ou cne.");
            req.getRequestDispatcher("/views/error.jsp").forward(req, resp);
        }
       ArrayList<Etudiant> etudiants =  Connect.toEtudiants(Connect.select("SELECT E.nom, E.prenom, E.CNE, E.telephone, F.libelle as 'feliere', E.feliere as 'feliereId', F.departement as 'departementId', F.departement  FROM  etudiant E INNER JOIN feliere F on E.feliere = F.id WHERE nom like '%" + query + "%' or prenom like '%" + query + "%' or cne like '%" + query + "%';"));

        req.setAttribute("etudiants", etudiants);
       req.getRequestDispatcher("views/etudiants.jsp").forward(req, resp);

    }
}
