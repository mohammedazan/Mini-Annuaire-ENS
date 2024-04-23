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

/**
 * This servlet responds to HTTP POST requests on the "/recherche_departement"
 * path.
 * Upon receiving a POST request, it retrieves the search query parameter from
 * the request.
 * If the search query parameter is null, it sets an error message indicating
 * that the query is not valid and forwards the request to the error page.
 * Otherwise, it uses the search query parameter to execute a SQL query to
 * search for departments whose names contain the specified search term.
 * The search results are converted into a list of Department objects using the
 * Connect.toDepartements() method.
 * The list of departments is then set as an attribute in the request and
 * forwarded to the "departements.jsp" view for display.
 */

@WebServlet(name = "recherche_departement", value = "/recherche_departement")
public class SearchDepartement extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String query = req.getParameter("searchDepartement");
        System.out.println("id = " + query);
        if (query == null) {
            req.setAttribute("message", "Query non valid, Veuillez specifie le libelle de departement.");
            req.getRequestDispatcher("/views/error.jsp").forward(req, resp);
        }
        ArrayList<Departement> departements = Connect
                .toDepartements(Connect.select("SELECT * FROM departement WHERE REPLACE(libelle, ' ', '') LIKE '%"
                        + query.replaceAll("\\s+", "") + "%';"));
        if (departements != null) {

        }
        req.setAttribute("departements", departements);
        req.getRequestDispatcher("views/departements.jsp").forward(req, resp);

    }
}
