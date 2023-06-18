/* Insert Befehle für die Zutaten */    

INSERT INTO zutat (name) VALUES ('Käse');
INSERT INTO zutat (name) VALUES ('Fetakäse');
INSERT INTO zutat (name) VALUES ('Mozzarella');
INSERT INTO zutat (name) VALUES ('Wasser');
INSERT INTO zutat (name) VALUES ('Honig');
INSERT INTO zutat (name) VALUES ('Knoblauch');
INSERT INTO zutat (name) VALUES ('Speck');
INSERT INTO zutat (name) VALUES ('Rinderfleisch');
INSERT INTO zutat (name) VALUES ('Ei');
INSERT INTO zutat (name) VALUES ('Weizenmehl');
INSERT INTO zutat (name) VALUES ('Tomate');
INSERT INTO zutat (name) VALUES ('Gurke');
INSERT INTO zutat (name) VALUES ('Kopfsalat');
INSERT INTO zutat (name) VALUES ('Hühnerfleisch');
INSERT INTO zutat (name) VALUES ('Schweinefleisch');
INSERT INTO zutat (name) VALUES ('Rinderhackfleisch');
INSERT INTO zutat (name) VALUES ('Schweinehackfleisch');
INSERT INTO zutat (name) VALUES ('Olivenöl');
INSERT INTO zutat (name) VALUES ('Vollkornmehl');
INSERT INTO zutat (name) VALUES ('Tomatenmark');
INSERT INTO zutat (name) VALUES ('Spaghetti');
INSERT INTO zutat (name) VALUES ('Ravioli');
INSERT INTO zutat (name) VALUES ('Tortellini');
INSERT INTO zutat (name) VALUES ('Nocken');
INSERT INTO zutat (name) VALUES ('Rigatoni');
INSERT INTO zutat (name) VALUES ('Tagliatelle');
INSERT INTO zutat (name) VALUES ('Zitrone');
INSERT INTO zutat (name) VALUES ('Parmesan');
INSERT INTO zutat (name) VALUES ('Zwiebel');
INSERT INTO zutat (name) VALUES ('Avocado');
INSERT INTO zutat (name) VALUES ('Hühnerbrustfilets');

/* Insert Befehle für die Rezepte */
INSERT INTO rezept (name, art, beschreibung) VALUES 
    ('Zitronenpasta', 'Mittagessen', '
    1. Koche die Pasta gemäß den Anweisungen auf der Verpackung al dente.\n
    2. Während die Pasta kocht, presse den Saft aus den Zitronen und reibe die Schale von einer Zitrone ab.\n
    3. In einer Pfanne das Olivenöl erhitzen und den fein gehackten Knoblauch darin anbraten, bis er leicht golden ist.\n
    4. Den Zitronensaft und die abgeriebene Zitronenschale zum Knoblauch in die Pfanne geben und für 1-2 Minuten köcheln lassen.\n
    5. Die gekochte Pasta abgießen und in die Pfanne geben. Gut vermischen, so dass die Pasta mit der Zitronen-Knoblauch-Mischung überzogen ist.\n
    6. Die Pasta auf Teller verteilen und nach Belieben mit geriebenem Parmesan-Käse bestreuen.\n
    7. Sofort servieren und genießen!');
INSERT INTO rezeptzutat (zutatid, rezeptid) VALUES ((SELECT zutat.id FROM zutat WHERE zutat.name = 'Spaghetti'), (SELECT rezept.id FROM rezept WHERE rezept.name = 'Zitronenpasta'));
INSERT INTO rezeptzutat (zutatid, rezeptid) VALUES ((SELECT zutat.id FROM zutat WHERE zutat.name = 'Zitrone'), (SELECT rezept.id FROM rezept WHERE rezept.name = 'Zitronenpasta'));
INSERT INTO rezeptzutat (zutatid, rezeptid) VALUES ((SELECT zutat.id FROM zutat WHERE zutat.name = 'Olivenöl'), (SELECT rezept.id FROM rezept WHERE rezept.name = 'Zitronenpasta'));
INSERT INTO rezeptzutat (zutatid, rezeptid) VALUES ((SELECT zutat.id FROM zutat WHERE zutat.name = 'Knoblauch'), (SELECT rezept.id FROM rezept WHERE rezept.name = 'Zitronenpasta'));
INSERT INTO rezeptzutat (zutatid, rezeptid) VALUES ((SELECT zutat.id FROM zutat WHERE zutat.name = 'Parmesan'), (SELECT rezept.id FROM rezept WHERE rezept.name = 'Zitronenpasta'));

INSERT INTO rezept (name, art, beschreibung) VALUES 
    ('Avocado-Hühnchen-Salat', 'Mittagessen', '
    1. In einer großen Schüssel die Hühnerbruststücke, Avocadowürfel und gehackte Zwiebeln vermengen.\n
    2. Den Zitronensaft über die Mischung gießen und vorsichtig umrühren, um die Avocado zu benetzen und das Anlaufen zu verhindern.\n
    3. Mit Salz und Pfeffer abschmecken und nochmals umrühren, um alle Zutaten gut zu kombinieren.\n
    4. Den Avocado-Hühnchen-Salat für mindestens 30 Minuten im Kühlschrank ziehen lassen, damit sich die Aromen gut entfalten.\n
    5. Vor dem Servieren nochmals abschmecken und bei Bedarf nachwürzen.\n
    6. Den Salat alleine genießen oder auf Sandwiches, Wraps oder Salatblättern servieren.');
INSERT INTO rezeptzutat (zutatid, rezeptid) VALUES ((SELECT zutat.id FROM zutat WHERE zutat.name = 'Hühnerbrustfilets'), (SELECT rezept.id FROM rezept WHERE rezept.name = 'Avocado-Hühnchen-Salat'));
INSERT INTO rezeptzutat (zutatid, rezeptid) VALUES ((SELECT zutat.id FROM zutat WHERE zutat.name = 'Avocado'), (SELECT rezept.id FROM rezept WHERE rezept.name = 'Avocado-Hühnchen-Salat'));
INSERT INTO rezeptzutat (zutatid, rezeptid) VALUES ((SELECT zutat.id FROM zutat WHERE zutat.name = 'Zwiebel'), (SELECT rezept.id FROM rezept WHERE rezept.name = 'Avocado-Hühnchen-Salat'));
INSERT INTO rezeptzutat (zutatid, rezeptid) VALUES ((SELECT zutat.id FROM zutat WHERE zutat.name = 'Zitrone'), (SELECT rezept.id FROM rezept WHERE rezept.name = 'Avocado-Hühnchen-Salat'));
