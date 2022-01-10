/************************
@Author: Azat Erol
Always happy coding!
************************/
/*
## Neue DB vorbereiten auf Release, wenn aktuell aber noch die alte DB genutzt wird

/** Möchte man Tabellen die man zuvor migriert hat auf den aktuellen Stand updaten, empfehlt es sich vorerst eine temporäre Datei zu erstellen.
In Microsoft SQL Server Management Studio(SSMS) funktioniert dies indem man auf die entsprechenden Tabellen klickt und dann unter -> Skript für Tabelle als -> CREATE in
-> Neues Abfrage-Edtitor-Fenster.
Nun wurde ein Create-Skript erstellt die der bereits existierenden Tabelle übereinstimmt. Vor dem Tabellennamen empfiehlt es sich ein temp für die Lesbarkeit hinzuzufügen.
Jetzt bringt man die temp Tabelle auf den aktuellen Stand der usprünglichen Tabelle indem man alle Datensätze der produktiven Tabelle in die test Tabelle migriert. Anschließend
aktualisiert man dann mittels eines Update-Skriptes die produktive(echte) Tabelle.
Vorher sollte die temp Tabelle zum Beispiel nach einem bestimmten Datum Daten migriert haben. Beispiel alle Daten ab 01.01.2022 sollen von  der alten DB, in die temp Tabelle der neuen 
produktiven DB. 
Der zweite Schritt wäre, dass man nun alle Daten in die produktive DB Tabelle hinzufügt, die es zuvor nicht gab, weil man eventuell die alte DB nicht auf dem Stand der produktiven DB gehalten hat.
Nun sollte die produktive DB Tabelle auf dem neusten Stand sein.
**/

--DOZENTEN
BEGIN
UPDATE dbo.DOZENTEN
SET IDENT = b.IDENT
, FACH = b.FACH
, MANDANT = b.MANDANT
, VERANSTALTUNG = b.VERANSTALTUNG
, BEMERKUNG = b.BEMERKUNG
, STUNDEN = b.STUNDEN
FROM dbo.DOZENTEN a INNER JOIN temp_DOZENTEN b ON a.IDENT = b.IDENT AND a.VERANSTALTUNG = b.VERANSTALTUNG
END

BEGIN
INSERT INTO dbo.DOZENTEN
Select *
FROM dbo.temp_DOZENTEN
WHERE IDENT + VERANSTALTUNG NOT IN(
SELECT IDENT + VERANSTALTUNG
FROM DOZENTEN)
END


















