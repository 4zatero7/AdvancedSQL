/************************
@Author: Azat Erol
Always happy coding!
************************/
/**
Möchte man eine Tabelle in der produktiven DB updaten und hat testweise in der test DB erfolgreich migriert bzw. geupdatet kann man mittels eines Skriptes dieses durchführen.
**/


UPDATE tibros138biz.dbo.VD_KURSKOPF SET HTML_TEXTTEIL02 = T.HTML_TEXTTEIL02
FROM tibros138biz.dbo.VD_KURSKOPF AS P
INNER JOIN [tibros138biz-test].dbo.VD_KURSKOPF AS T
ON P.KURS1_KURSNR = T.KURS1_KURSNR
WHERE P.KURS1_KURSNR = 'XXX'
