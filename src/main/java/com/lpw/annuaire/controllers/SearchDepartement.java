package com.lpw.annuaire.controllers;

import com.lpw.annuaire.configs.Connect;
import com.lpw.annuaire.modals.Departement;
import com.lpw.annuaire.modals.Feliere;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;


@WebServlet(name = "recherche_departement", value = "/recherche_departement")
public class SearchDepartement extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String query = req.getParameter("search");
        if (query == null){
            req.setAttribute("message", "Query non valid, Veuillez specifie le libelle de departement.");
            req.getRequestDispatcher("/views/error.jsp").forward(req, resp);
        }
        ArrayList<Departement> departements =  Connect.toDepartements(Connect.select("SELECT * FROM  departements where libelle like '%"  + query + "%';"));

        req.setAttribute("departements", departements);
        req.getRequestDispatcher("views/departements.jsp").forward(req, resp);

    }
}
