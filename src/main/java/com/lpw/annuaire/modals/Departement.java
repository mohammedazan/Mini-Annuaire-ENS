package com.lpw.annuaire.modals;

public class Departement {

    private int id;
    private String libelle;

    public Departement(int id, String libelle) {
        this.id = id;
        this.libelle = libelle;
    }

    public Departement(String libelle) {
        this.libelle = libelle;
    }

    public Departement(int id) {
        this.id = id;
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
