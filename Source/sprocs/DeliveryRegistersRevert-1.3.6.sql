/*
   19 de julho de 201615:34:20
   User: sa
   Server: .\
   Database: InterwayDocs
   Application:
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_DeliveryRegisters
	(
	RegisterId int NOT NULL IDENTITY (1, 1),
	RegisterDate date NOT NULL,
	DocumentType varchar(25) NOT NULL,
	DocumentReference varchar(20) NOT NULL,
	DocumentEntity varchar(50) NOT NULL,
	DocumentDept varchar(50) NOT NULL,
	DocumentClass varchar(50) NOT NULL,
	DocumentDate date NOT NULL,
	RecipientName varchar(50) NOT NULL,
	ExpeditorName varchar(50) NULL,
	ReceptionName varchar(50) NULL,
	ReceptionDate date NULL,
	CreateDate datetime2(7) NOT NULL,
	ChangeDate datetime2(7) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_DeliveryRegisters SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_DeliveryRegisters ON
GO
IF EXISTS(SELECT * FROM dbo.DeliveryRegisters)
	 EXEC('INSERT INTO dbo.Tmp_DeliveryRegisters (RegisterId, RegisterDate, DocumentType, DocumentReference, DocumentEntity, DocumentDept, DocumentClass, DocumentDate, RecipientName, ExpeditorName, ReceptionName, ReceptionDate, CreateDate, ChangeDate)
		SELECT RegisterId, RegisterDate, DocumentType, DocumentReference, CONVERT(varchar(50), DocumentEntity), CONVERT(varchar(50), DocumentDept), DocumentClass, DocumentDate, CONVERT(varchar(50), RecipientName), ExpeditorName, ReceptionName, ReceptionDate, CreateDate, ChangeDate FROM dbo.DeliveryRegisters WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_DeliveryRegisters OFF
GO
DROP TABLE dbo.DeliveryRegisters
GO
EXECUTE sp_rename N'dbo.Tmp_DeliveryRegisters', N'DeliveryRegisters', 'OBJECT'
GO
ALTER TABLE dbo.DeliveryRegisters ADD CONSTRAINT
	PK_DeliveryRegisters PRIMARY KEY CLUSTERED
	(
	RegisterId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
CREATE NONCLUSTERED INDEX IX_DeliveryRegisters ON dbo.DeliveryRegisters
	(
	RegisterDate,
	DocumentDate,
	ReceptionDate,
	DocumentType,
	DocumentReference,
	DocumentEntity,
	DocumentDept,
	DocumentClass,
	RecipientName,
	ExpeditorName,
	ReceptionName
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
COMMIT
