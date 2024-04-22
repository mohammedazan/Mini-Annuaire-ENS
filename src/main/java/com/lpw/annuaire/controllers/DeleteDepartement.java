package com.lpw.annuaire.controllers;

import com.lpw.annuaire.configs.Connect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "delete_departement", value = "/delete_departement")
public class DeleteDepartement extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        int rows = Connect.update("DELETE FROM departements WHERE id = " +  id   + ";");

        if (rows > 0){
            req.setAttribute("message", "departement " + id + " suppremer avec success");
            req.getRequestDispatcher("/views/success.jsp").forward(req, resp);
        }
        req.setAttribute("message", "departement non suppremer");
        req.getRequestDispatcher("/views/error.jsp").forward(req, resp);
    }
    
}


