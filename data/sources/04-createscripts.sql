--==================================================
--Este script gera o conte�do de 4 scripts
--em formato bat que automatizam o processo de
--transformar as tabelas de email importadas em
--arquivos de texto para an�lise
--==================================================

use [happy]

--insira o nome do seu <servidor>\<inst�ncia> ou <servidor> para inst�ncia padr�o
declare @server nvarchar(100) = 'rigel\sql3'

--Nota: este script usa autentica��o integrada, caso queira usar
--nome e senha, substitua o "-T" abaixo por "-U <usu�rio> -P <senha>"
declare @auth nvarchar(100) = '-T'

--corpo de email dividido pelo m�s de vazamento
select 'bcp "select [ExtractedBodyText] from [dbo].[vw_leak_mail] where year = '+convert(nvarchar(50),datepart(year,[MetadataDateReleased]))+' and month = '+convert(nvarchar(50),datepart(month,[MetadataDateReleased]))+'" queryout "leak/leak_mail_'+convert(nvarchar(50),datepart(year,[MetadataDateReleased]))+dbo.fn_month(convert(nvarchar(50),datepart(month,[MetadataDateReleased])))+'.txt" -S '+@server+' '+@auth+' -d happy -w'
from [dbo].[Emails]
where datepart(year,[MetadataDateReleased]) >= 2008
group by datepart(year,[MetadataDateReleased]),datepart(month,[MetadataDateReleased])
order by datepart(year,[MetadataDateReleased]),datepart(month,[MetadataDateReleased])

--assunto de email dividido pelo m�s de vazamento
select 'bcp "select [ExtractedSubject] from [dbo].[vw_leak_subj] where year = '+convert(nvarchar(50),datepart(year,[MetadataDateReleased]))+' and month = '+convert(nvarchar(50),datepart(month,[MetadataDateReleased]))+'" queryout "leak/leak_subj_'+convert(nvarchar(50),datepart(year,[MetadataDateReleased]))+dbo.fn_month(convert(nvarchar(50),datepart(month,[MetadataDateReleased])))+'.txt" -S '+@server+' '+@auth+' -d happy -w'
from [dbo].[Emails]
where datepart(year,[MetadataDateReleased]) >= 2008
group by datepart(year,[MetadataDateReleased]),datepart(month,[MetadataDateReleased])
order by datepart(year,[MetadataDateReleased]),datepart(month,[MetadataDateReleased])

--corpo de email dividido pelo m�s de envio
select 'bcp "select [ExtractedBodyText] from [dbo].[vw_sent_mail] where year = '+convert(nvarchar(50),datepart(year,[MetadataDateSent]))+' and month = '+convert(nvarchar(50),datepart(month,[MetadataDateSent]))+'" queryout "sent/sent_mail_'+convert(nvarchar(50),datepart(year,[MetadataDateSent]))+dbo.fn_month(convert(nvarchar(50),datepart(month,[MetadataDateSent])))+'.txt" -S '+@server+' '+@auth+' -d happy -w'
from [dbo].[Emails]
where datepart(year,[MetadataDateSent]) >= 2008
group by datepart(year,[MetadataDateSent]),datepart(month,[MetadataDateSent])
order by datepart(year,[MetadataDateSent]),datepart(month,[MetadataDateSent])

--assunto de email dividido pelo m�s de envio
select 'bcp "select [ExtractedSubject] from [dbo].[vw_sent_subj] where year = '+convert(nvarchar(50),datepart(year,[MetadataDateSent]))+' and month = '+convert(nvarchar(50),datepart(month,[MetadataDateSent]))+'" queryout "sent/sent_subj_'+convert(nvarchar(50),datepart(year,[MetadataDateSent]))+dbo.fn_month(convert(nvarchar(50),datepart(month,[MetadataDateSent])))+'.txt" -S '+@server+' '+@auth+' -d happy -w'
from [dbo].[Emails]
where datepart(year,[MetadataDateSent]) >= 2008
group by datepart(year,[MetadataDateSent]),datepart(month,[MetadataDateSent])
order by datepart(year,[MetadataDateSent]),datepart(month,[MetadataDateSent])
