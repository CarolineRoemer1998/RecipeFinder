/* Erstellen der Tables */ 
CREATE TABLE rezept ( id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, art TEXT NOT NULL , beschreibung TEXT NOT NULL); 

CREATE TABLE zutat ( id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL );

CREATE TABLE benutzer ( id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, passwort TEXT NOT NULL, email TEXT NOT NULL );

CREATE TABLE rezeptzutat ( rezeptzutatid INTEGER PRIMARY KEY AUTOINCREMENT, zutatid INTEGER NOT NULL, rezeptid INTEGER NOT NULL, 
    FOREIGN KEY(zutatid) REFERENCES zutat(id), FOREIGN KEY(rezeptid) REFERENCES rezept(id) );

CREATE TABLE benutzerzutat ( benutzerzutatid INTEGER PRIMARY KEY AUTOINCREMENT, zutatid INTEGER NOT NULL, benutzerid INTEGER NOT NULL, 
    FOREIGN KEY(zutatid) REFERENCES zutat(id), FOREIGN KEY(benutzerid) REFERENCES benutzer(id) );