/*
   19 de julho de 201615:33:52
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
CREATE TABLE dbo.Tmp_IncomingRegisters
	(
	RegisterId int NOT NULL IDENTITY (1, 1),
	RegisterDate date NOT NULL,
	DocumentType varchar(25) NOT NULL,
	DocumentReference varchar(20) NOT NULL,
	DocumentEntity varchar(50) NOT NULL,
	DocumentDept varchar(50) NOT NULL,
	DocumentClass varchar(50) NOT NULL,
	DocumentDate date NOT NULL,
	Subject varchar(500) NOT NULL,
	SenderName varchar(50) NOT NULL,
	ReceptionDate date NOT NULL,
	RoutedTo varchar(50) NOT NULL,
	Notes varchar(500) NOT NULL,
	ArchiveLocation varchar(50) NOT NULL,
	CreateDate datetime2(7) NOT NULL,
	ChangeDate datetime2(7) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_IncomingRegisters SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_IncomingRegisters ON
GO
IF EXISTS(SELECT * FROM dbo.IncomingRegisters)
	 EXEC('INSERT INTO dbo.Tmp_IncomingRegisters (RegisterId, RegisterDate, DocumentType, DocumentReference, DocumentEntity, DocumentDept, DocumentClass, DocumentDate, Subject, SenderName, ReceptionDate, RoutedTo, Notes, ArchiveLocation, CreateDate, ChangeDate)
		SELECT RegisterId, RegisterDate, DocumentType, DocumentReference, CONVERT(varchar(50), DocumentEntity), CONVERT(varchar(50), DocumentDept), DocumentClass, DocumentDate, Subject, CONVERT(varchar(50), SenderName), ReceptionDate, RoutedTo, Notes, ArchiveLocation, CreateDate, ChangeDate FROM dbo.IncomingRegisters WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_IncomingRegisters OFF
GO
DROP TABLE dbo.IncomingRegisters
GO
EXECUTE sp_rename N'dbo.Tmp_IncomingRegisters', N'IncomingRegisters', 'OBJECT'
GO
ALTER TABLE dbo.IncomingRegisters ADD CONSTRAINT
	PK_IncomingRegisters PRIMARY KEY CLUSTERED
	(
	RegisterId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
CREATE NONCLUSTERED INDEX IX_IncomingRegisters ON dbo.IncomingRegisters
	(
	RegisterDate,
	DocumentDate,
	ReceptionDate,
	ArchiveLocation,
	DocumentType,
	DocumentReference,
	DocumentEntity,
	DocumentDept,
	DocumentClass,
	SenderName,
	RoutedTo
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX IX_IncomingRegisters_Notes ON dbo.IncomingRegisters
	(
	Notes
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX IX_IncomingRegisters_Subject ON dbo.IncomingRegisters
	(
	Subject
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
COMMIT
