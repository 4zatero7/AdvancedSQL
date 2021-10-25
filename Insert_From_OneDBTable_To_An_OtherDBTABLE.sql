/************************
@Author: Azat Erol
Always happy coding!
************************/
-- Schnelle Migration von einer Datenbank(beispiel Testdatenbank) in die produktive Datenbank


Insert into [real_DB].dbo.Person(IDENT,	Vorname,Nachname, Gehalt)
select IDENT, Vorname, Nachname, Gehalt 
from [test_DB].dbo.Person
Where IDENT = 001





