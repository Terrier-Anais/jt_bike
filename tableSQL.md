CREATE TABLE Utilisateur (
    id_utilisateur SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prénom VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    mot_de_passe VARCHAR(255) NOT NULL,
    rôle VARCHAR(20) CHECK (rôle IN ('client', 'admin')) NOT NULL,
    téléphone VARCHAR(20)
);


CREATE TABLE Creneau (
    id_creneau SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    heure_debut TIME NOT NULL,
    est_disponible BOOLEAN DEFAULT TRUE
);

CREATE TABLE RendezVous (
    id_rendezvous SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    heure TIME NOT NULL,
    statut VARCHAR(20) CHECK (statut IN ('en_attente', 'confirmé', 'annulé')) NOT NULL,
    id_utilisateur INT NOT NULL,
    id_creneau INT NOT NULL,
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateur(id_utilisateur) ON DELETE CASCADE,
    FOREIGN KEY (id_creneau) REFERENCES Creneau(id_creneau) ON DELETE CASCADE
);

