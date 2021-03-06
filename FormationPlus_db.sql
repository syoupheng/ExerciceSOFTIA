CREATE DATABASE FormationPlus_db;

CREATE TABLE Convention (
    idConvention INT,
    nom VARCHAR(30),
    nbHeur INT,
    PRIMARY KEY(idConvention)
);

CREATE TABLE Etudiant (
    idEtudiant INT,
    nom VARCHAR(20),
    prenom VARCHAR(20),
    mail VARCHAR(60),
    convention INT,
    PRIMARY KEY(idEtudiant),
    FOREIGN KEY(convention) REFERENCES Convention(idConvention) ON DELETE SET NULL
);

CREATE TABLE Attestation (
    idAttestation INT AUTO_INCREMENT,
    etudiant INT,
    convention INT,
    message VARCHAR(2000),
    PRIMARY KEY(idAttestation),
    FOREIGN KEY(etudiant) REFERENCES Etudiant(idEtudiant) ON DELETE SET NULL,
    FOREIGN KEY(convention) REFERENCES Convention(idConvention) ON DELETE SET NULL
);

INSERT INTO Convention 
    VALUES
    (1, "Anglais", 30),
    (2, "Maths", 20),
    (3, "Chimie", 40),
    (4, "Physique", 40),
    (5, "Espagnol", 20),
    (6, "Informatique", 50);

INSERT INTO Etudiant 
    VALUES
    (1, "Schrute", "Dwight", "dwight.schrute@gmail.com", 4),
    (2, "Halpert", "Jim", "jim.halpert@gmail.com", 6),
    (3, "Scott", "Michael", "michael.scott@gmail.com", 1),
    (4, "Beesly", "Pam", "pam.beesly@gmail.com", 3),
    (5, "Howard", "Ryan", "ryan.howard@gmail.com", 5),
    (6, "Kapoor", "Kelly", "kelly.kapoor@gmail.com", 1),
    (7, "Hudson", "Stanley", "stanley.hudson@gmail.com", 2),
    (8, "Levinson", "Jan", "jan.levinson@gmail.com", 4);