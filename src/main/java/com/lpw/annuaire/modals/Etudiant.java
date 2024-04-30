package com.lpw.annuaire.modals;

public class Etudiant {

    private String CNE;
    private String nom;
    private String prenom;
    private String telephone;
    private Feliere feliere; // تم تغيير النوع المرجعي للفلية إلى int
    private Departement departement; // تم تغيير النوع المرجعي للقسم إلى int

    public Etudiant(String CNE, String nom, String prenom, String telephone, Feliere feliere, Departement departement) {
        this.CNE = CNE;
        this.nom = nom;
        this.prenom = prenom;
        this.telephone = telephone;
        this.feliere = feliere;
        this.departement = departement;
        
    }

	public Etudiant(String CNE, String nom, String prenom, String telephone, Feliere feliere) {
        this.CNE = CNE;
        this.nom = nom;
        this.prenom = prenom;
        this.telephone = telephone;
        this.feliere = feliere;
    }

	public String getCNE() {
		return CNE;
	}

	public void setCNE(String cNE) {
		CNE = cNE;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public Feliere getFeliere() {
		return feliere;
	}

	public void setFeliere(Feliere feliere) {
		this.feliere = feliere;
	}

	public Departement getDepartement() {
		return departement;
	}

	public void setDepartement(Departement departement) {
		this.departement = departement;
	}


}

/*     public Etudiant(String CNE, String nom, String prenom, String telephone, Feliere feliere, Departement departement) {
        this.CNE = CNE;
        this.nom = nom;
        this.prenom = prenom;
        this.telephone = telephone;
        this.feliere = feliere;
        this.departement = departement;
    }

    public Etudiant(String CNE, String nom, String prenom, String telephone, Feliere feliere) {
        this.CNE = CNE;
        this.nom = nom;
        this.prenom = prenom;
        this.telephone = telephone;
        this.feliere = feliere;
    }
*/
