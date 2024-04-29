package com.lpw.annuaire.modals;

public class Feliere {
    private int id;
    private String libelle;
    private Departement departement;

    public Feliere(int id, String libelle) {
        this.id = id;
        this.libelle = libelle;
    }

    public Feliere(String libelle, Departement departement) {
        this.libelle = libelle;
        this.departement = departement;
    }

    public Feliere(int id) {
        this.id = id;
    }
    public Feliere(int id, String libelle, Departement departement) {
        this.id = id;
        this.libelle = libelle;
        this.departement = departement;
    }
    // setter getter
    
    public Departement getDepartement() {
        return departement;
    }

    public void setDepartement(Departement departement) {
        this.departement = departement;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }
}
