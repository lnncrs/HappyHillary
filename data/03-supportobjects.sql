SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--função simples de suporte para transformar meses de caracter único "x" em formato "0x"
if exists(select * from sys.objects where name = 'fn_month')
begin
	drop function fn_month
end
GO
CREATE FUNCTION [dbo].[fn_month]
(
	@month nvarchar(50)
)
RETURNS nvarchar(50)
AS
BEGIN
	
	if(len(@month) < 2)
	begin
		set @month = '0'+@month
	end

	return @month
END
GO

--função simples de suporte para adicionar um terminador a cada linha exportada
if exists(select * from sys.objects where name = 'fn_term')
begin
	drop function fn_term
end
GO
CREATE FUNCTION fn_term
(
	@i int = 0
)
RETURNS nvarchar(50)
AS
BEGIN

	RETURN (char(13) + char(10) + '---' + char(13) + char(10))
END
GO

--views de suporte para geração dos arquivos
if exists(select * from sys.objects where name = 'vw_leak_mail')
begin
	DROP VIEW [dbo].[vw_leak_mail]
end
GO
CREATE VIEW [dbo].[vw_leak_mail]
AS
SELECT        Id, DATEPART(year, MetadataDateReleased) AS year, DATEPART(month, MetadataDateReleased) AS month, ExtractedBodyText
FROM            dbo.Emails
GO

if exists(select * from sys.objects where name = 'vw_leak_subj')
begin
	DROP VIEW [dbo].[vw_leak_subj]
end
GO
CREATE VIEW [dbo].[vw_leak_subj]
AS
SELECT        Id, DATEPART(year, MetadataDateReleased) AS 'year', DATEPART(month, MetadataDateReleased) AS 'month', ExtractedSubject
FROM            dbo.Emails
GO

if exists(select * from sys.objects where name = 'vw_sent_mail')
begin
	DROP VIEW [dbo].[vw_sent_mail]
end
GO
CREATE VIEW [dbo].[vw_sent_mail]
AS
SELECT        Id, DATEPART(year, MetadataDateSent) AS year, DATEPART(month, MetadataDateSent) AS month, ExtractedBodyText
FROM            dbo.Emails
GO

if exists(select * from sys.objects where name = 'vw_sent_subj')
begin
	DROP VIEW [dbo].[vw_sent_subj]
end
GO
CREATE VIEW [dbo].[vw_sent_subj]
AS
SELECT        Id, DATEPART(year, MetadataDateSent) AS year, DATEPART(month, MetadataDateSent) AS month, ExtractedSubject
FROM            dbo.Emails

