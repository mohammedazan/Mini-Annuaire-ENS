package com.lpw.annuaire.controllers;
import com.lpw.annuaire.configs.Connect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "delete_etudiant", value = "/delete_etudiant")

public class DeleteEtudiant extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int cne = Integer.parseInt(req.getParameter("cne"));
        System.out.println("this CNE :"+ cne);
        int rows = Connect.update("DELETE FROM etudiant WHERE CNE = '" +  cne   + "';");

        if (rows > 0){
            req.setAttribute("message", "Etudiant: " + cne + " suppremer avec success");
            req.getRequestDispatcher("/views/success.jsp").forward(req, resp);
        }
        req.setAttribute("message", "Etudiant non suppremer");
        req.getRequestDispatcher("/views/error.jsp").forward(req, resp);
    }
}
