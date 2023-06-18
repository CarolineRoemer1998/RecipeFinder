/* SELECT für alle Zutaten einers Rezepts */
SELECT zutat.name FROM zutat JOIN rezeptzutat ON zutat.id = zutatid JOIN rezept ON rezeptid = rezept.id WHERE rezept.name = 'Zitronenpasta';
SELECT zutat.name FROM zutat JOIN rezeptzutat ON zutat.id = zutatid JOIN rezept ON rezeptid = rezept.id WHERE rezept.name = 'Avocado-Hühnchen-Salat';

/* SELECT für alle Zutaten die ein User hat */
SELECT zutat.name FROM zutat JOIN benutzerzutat ON zutat.id = zutatid JOIN benutzer ON benutzerid = benutzer.id WHERE benutzer.id = 1;