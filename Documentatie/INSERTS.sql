USE `ProefexamenDag3`;

INSERT INTO TypePersoon (Naam) VALUES ('Klant');
INSERT INTO TypePersoon (Naam) VALUES ('Medewerker');
INSERT INTO TypePersoon (Naam) VALUES ('Gast');

INSERT INTO Persoon (TypePersoonId, Voornaam, Tussenvoegsel, Achternaam, Roepnaam, IsVolwassen) 
	VALUES (1, 'Mazin', NULL, 'Jamil', 'Mazin', 1),
		   (1, 'Arjan', 'de', 'Ruijter', 'Arjan', 1),
           (1, 'Hans', NULL, 'Odij,', 'Hans', 1),
           (1, 'Dennis', 'van', 'Wakeren', 'Dennis', 1),
           (2, 'Wilco', 'Van de', 'Grift', 'Wilco', 1),
           (3, 'Tom', NULL, 'Sanders', 'Tom', 0),
           (3, 'Andrew', NULL, 'Sanders', 'Andrew', 0),
           (3, 'Julian', NULL, 'Kaldenheuvel', 'Jullian', 1);
           
INSERT INTO PakketOptie (Naam) 
	VALUES ('Snackpakketbasis'),
		   ('Snackpakketluxe'),
           ('Kinderpartij'),
           ('Vrijgezellenfeest');
           
INSERT INTO ReserveringStatus (Naam)
	VALUES ('Bevestigd'),
		   ('Geannuleerd'),
           ('Inbehandeling');
           
INSERT INTO Tarief (Eenheid, Prijs)
	VALUES ('Uur', 24.00),
		   ('Uur', 28.00),
           ('Uur', 33.50);
           
INSERT INTO Baan (Nummer, HeeftHek)
	VALUES (1, 0),
		   (2, 0),
           (3, 0),
           (4, 0),
           (5, 0),
           (6, 0),
           (7, 1),
           (8, 1);
           
INSERT INTO Openingstijd (Dagnaam, BeginTijd, EindTijd)
	VALUES ('Maandag', '14:00', '22:00'),
		   ('Dinsdag', '14:00', '22:00'),
           ('Woensdag', '14:00', '22:00'),
           ('Donderdag', '14:00', '22:00'),
           ('Vrijdagmiddag', '14:00', '18:00'),
           ('Vrijdagavond', '18:00', '24:00'),
           ('Zaterdagmiddag', '14:00', '28:00'),
           ('Zaterdagavond', '18:00', '24:00'),
           ('Zondagmiddag', '14:00', '18:00'),
           ('Zondagavond', '18:00', '24:00');
           
INSERT INTO Reservering (PersoonId, OpeningstijdId, TariefId, BaanId, PakketOptieId, ReserveringStatusId, Reserveringsnummer, Datum, AantalUren, BeginTijd, EindTijd, AantalVolwassen, AantalKinderen)
	VALUES (1, 2, 1, 8, 1, 1, 2022122000001, '2022-12-20', 1, '15:00', '16:00', 4, 2),
		   (2, 2, 1, 2, 3, 1, 2022122000002, '2022-12-20', 1, '17:00', '18:00', 4, NULL),
           (3, 7, 2, 3, 1, 1, 2022122400003, '2022-12-24', 2, '16:00', '18:00', 4, NULL),
           (1, 2, 1, 6, NULL, 1, 2022122700004, '2022-12-27', 2, '17:00', '19:00', 2, NULL),
           (4, 3, 1, 4, 4, 1, 2022122800005, '2022-12-28', 1, '14:00', '15:00', 3, NULL),
           (5, 10, 3, 5, 4, 1, 2022122800006, '2022-12-28', 2, '19:00', '21:00', 2, NULL);
           
           
INSERT INTO Spel (PersoonId, ReserveringId)
	VALUES (1, 1),
		   (2, 2),
           (3, 3),
           (4, 5),
           (6, 5),
           (7, 5),
           (8, 5); 
           
INSERT INTO Uitslag (SpelId, Aantalpunten)
	VALUES (1, 290),
		   (2, 300),
           (3, 120),
           (4, 34),
           (6, 234),
           (7, 299);