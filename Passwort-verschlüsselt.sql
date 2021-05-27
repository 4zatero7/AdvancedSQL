/************************
@Author: Azat Erol
Always happy coding!
************************/

OPEN SYMMETRIC KEY SQLSymmetricKey
DECRYPTION BY CERTIFICATE SelfSignedCertificate;

INSERT INTO [DB].[dbo].[CREATE_User]
           ([NAME]
           ,[EMAIL]
           ,[PASSWORD]
           ,[USER_ROLE_ID]
           ,[CALLED]
           ,[CALLED_TIMES]
           ,[SUCCESSFUL]
           ,[CREATE_TIME]
           ,[CALL_TIME])
     VALUES (
             'Azat Erol',
             'azat.erol@email.com',
              ENCRYPTBYKEY(key_guid('SQLSymmetricKey'),'Admin'),                /*ONLINEDOZENT ist nur die ROLLE, sS geht auch z.B.: User*/
             3,                                                                 /*Von 1-3 Rechte die vergeben werden können, wobei 1 Admin ist*/
             'N',
             0,
             'N',
             GETDATE(),
           NULL)

CLOSE SYMMETRIC KEY SQLSymmetricKey
GO
