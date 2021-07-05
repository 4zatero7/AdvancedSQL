  /************************
@Author: Azat Erol
Always happy coding!
************************/
--LEN Anzahl Länge bestimmen


UPDATE 
TABELLE1
SET GESCHLECHT = 'X' 
FROM  TABELLE2,
	    TABELLE3
WHERE TABELLE1.NR = TABELLE2.NR
	    AND TABELLE3.NR = TABELLE2.NR
	    AND LEN(NAME) = 0 AND DATUM >'2021/01/01'
