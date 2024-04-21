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

@WebServlet(name = "save_feliere", value = "/save_feliere")
public class SaveFeliere extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Feliere feliere = new Feliere(req.getParameter("libelle"), new Departement(Integer.parseInt(req.getParameter("departement"))));

        int row = Connect.update("INSERT INTO `feliere` (`libelle`, `departement`) VALUES ('"+ feliere.getLibelle() +"', '"+ feliere.getDepartement().getId() +"');");

        if (row > 0){
            req.setAttribute("message", "feliere: " + feliere.getLibelle() + " ajouter avec success");
            req.getRequestDispatcher("/views/success.jsp").forward(req, resp);
        }
        req.setAttribute("message", "feliere non enregistrer");
        req.getRequestDispatcher("/views/error.jsp").forward(req, resp);
    }
}

