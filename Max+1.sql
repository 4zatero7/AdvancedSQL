/************************
@Author: Azat Erol
Always happy coding!
************************/
--Fortlaufende Nummern beginnend mit 1 hochnummeriert


UPDATE Mitglied
SET Nr =(SELECT MAX(Nr) +1 FROM Mitglied)
WHERE Mitgliedsnummer = '1234567890'
