package com.lpw.annuaire.controllers;

import com.lpw.annuaire.configs.Connect;
import com.lpw.annuaire.modals.Etudiant;
import com.lpw.annuaire.modals.Feliere;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "recherche_feliere", value = "/recherche_feliere")
public class SearchFeliere extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String query = req.getParameter("search");
        if (query == null){
            req.setAttribute("message", "Query non valid, Veuillez specifie le libelle de filiere.");
            req.getRequestDispatcher("/views/error.jsp").forward(req, resp);
        }
       // ArrayList<Feliere> felieres =  Connect.toFelieres(Connect.select("SELECT  F.id, F.libelle, D.libelle as 'departement', D.id as 'departementId' FROM feliere F INNER JOIN departements D on D.id = F.departement where F.libelle like '%"  + query + "%';"));
       ArrayList<Feliere> felieres = Connect.toFelieres(Connect.select("SELECT F.id, F.libelle, D.libelle AS 'departement', D.id AS 'departementId' FROM feliere F INNER JOIN departement D ON D.id = F.departement WHERE REPLACE(F.libelle, ' ', '') LIKE '%" + query.replaceAll("\\s+", "") + "%';"));



        req.setAttribute("felieres", felieres);
        req.getRequestDispatcher("views/felieres.jsp").forward(req, resp);

    }
}
