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

@WebServlet(name = "save_etudiant", value = "/save_etudiant")
public class SaveEtudiant extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Etudiant etudiant = new Etudiant(req.getParameter("cne"),
                req.getParameter("nom"),
                req.getParameter("prenom"),
                req.getParameter("tele"),
                new Feliere(Integer.parseInt(req.getParameter("feliere")))
        );
        String query = "INSERT INTO `etudiant` (`CNE`, `nom`, `prenom`, `telephone`, `feliere`) VALUES ('"+ etudiant.getCNE() +"', '"+ etudiant.getNom() +"', '"+ etudiant.getPrenom() +"', '"+ etudiant.getTelephone() +"', '" + etudiant.getFeliere().getId() + "');";
        int row = Connect.update(query);

        if (row > 0){
            req.setAttribute("message", "etudiant: " + etudiant.getNom() + " " + etudiant.getPrenom() + " ajouter avec success");
            req.getRequestDispatcher("/views/success.jsp").forward(req, resp);
        }
        req.setAttribute("message", "etudiant non enregistrer");
        req.getRequestDispatcher("/views/error.jsp").forward(req, resp);
    }
}
