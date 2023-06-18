SELECT zutat.name FROM zutat JOIN rezeptzutat ON zutat.id = zutatid JOIN rezept ON rezeptid = rezept.id WHERE rezept.name = 'Zitronenpasta';

SELECT zutat.name FROM zutat JOIN rezeptzutat ON zutat.id = zutatid JOIN rezept ON rezeptid = rezept.id WHERE rezept.name = 'Avocado-Hühnchen-Salat';