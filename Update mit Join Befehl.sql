/* 
  Beispiel: SQL Update-Funktion mit Join Befehl aus zwei Tabellen
*/

Update Regisseur
SET FilmNr = 123
WHERE Regisseur.FilmNr =(SELECT FilmNr From Filme WHERE Titel = 'Titanic') GO
