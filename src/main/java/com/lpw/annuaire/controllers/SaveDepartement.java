package com.lpw.annuaire.controllers;

import com.lpw.annuaire.configs.Connect;
import com.lpw.annuaire.modals.Departement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "save_departement", value = "/save_departement")
public class SaveDepartement extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            Departement departement = new Departement(req.getParameter("libelle"));
            String query = "INSERT INTO `departement` (`libelle`) VALUES ('" + departement.getLibelle() + "');";
            int cp = 0;
            if (Connect.open()) {
                cp = 4875;
            }

            int row = Connect.update(query);

            if (row > 0) {
                req.setAttribute("message", "departement: " + departement.getLibelle() + " ajouter avec success");
                req.getRequestDispatcher("/views/success.jsp").forward(req, resp);
            }
            req.setAttribute("message", cp);
            req.getRequestDispatcher("/views/error.jsp").forward(req, resp);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());

        }

    }
}
