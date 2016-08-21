--==================================================
--Este script gera o conteúdo de 4 scripts
--em formato bat que automatizam o processo de
--transformar as tabelas de email importadas em
--arquivos de texto para análise
--==================================================

use [happy]

--insira o nome do seu <servidor>\<instância> ou <servidor> para instância padrão
declare @server nvarchar(100) = 'rigel\sql3'

--Nota: este script usa autenticação integrada, caso queira usar
--nome e senha, substitua o "-T" abaixo por "-U <usuário> -P <senha>"
declare @auth nvarchar(100) = '-T'

--corpo de email dividido pelo mês de vazamento
select 'bcp "select [ExtractedBodyText] from [dbo].[vw_leak_mail] where year = '+convert(nvarchar(50),datepart(year,[MetadataDateReleased]))+' and month = '+convert(nvarchar(50),datepart(month,[MetadataDateReleased]))+'" queryout "leak/leak_mail_'+convert(nvarchar(50),datepart(year,[MetadataDateReleased]))+dbo.fn_month(convert(nvarchar(50),datepart(month,[MetadataDateReleased])))+'.txt" -S '+@server+' '+@auth+' -d happy -w'
from [dbo].[Emails]
where datepart(year,[MetadataDateReleased]) >= 2008
group by datepart(year,[MetadataDateReleased]),datepart(month,[MetadataDateReleased])
order by datepart(year,[MetadataDateReleased]),datepart(month,[MetadataDateReleased])

--assunto de email dividido pelo mês de vazamento
select 'bcp "select [ExtractedSubject] from [dbo].[vw_leak_subj] where year = '+convert(nvarchar(50),datepart(year,[MetadataDateReleased]))+' and month = '+convert(nvarchar(50),datepart(month,[MetadataDateReleased]))+'" queryout "leak/leak_subj_'+convert(nvarchar(50),datepart(year,[MetadataDateReleased]))+dbo.fn_month(convert(nvarchar(50),datepart(month,[MetadataDateReleased])))+'.txt" -S '+@server+' '+@auth+' -d happy -w'
from [dbo].[Emails]
where datepart(year,[MetadataDateReleased]) >= 2008
group by datepart(year,[MetadataDateReleased]),datepart(month,[MetadataDateReleased])
order by datepart(year,[MetadataDateReleased]),datepart(month,[MetadataDateReleased])

--corpo de email dividido pelo mês de envio
select 'bcp "select [ExtractedBodyText] from [dbo].[vw_sent_mail] where year = '+convert(nvarchar(50),datepart(year,[MetadataDateSent]))+' and month = '+convert(nvarchar(50),datepart(month,[MetadataDateSent]))+'" queryout "sent/sent_mail_'+convert(nvarchar(50),datepart(year,[MetadataDateSent]))+dbo.fn_month(convert(nvarchar(50),datepart(month,[MetadataDateSent])))+'.txt" -S '+@server+' '+@auth+' -d happy -w'
from [dbo].[Emails]
where datepart(year,[MetadataDateSent]) >= 2008
group by datepart(year,[MetadataDateSent]),datepart(month,[MetadataDateSent])
order by datepart(year,[MetadataDateSent]),datepart(month,[MetadataDateSent])

--assunto de email dividido pelo mês de envio
select 'bcp "select [ExtractedSubject] from [dbo].[vw_sent_subj] where year = '+convert(nvarchar(50),datepart(year,[MetadataDateSent]))+' and month = '+convert(nvarchar(50),datepart(month,[MetadataDateSent]))+'" queryout "sent/sent_subj_'+convert(nvarchar(50),datepart(year,[MetadataDateSent]))+dbo.fn_month(convert(nvarchar(50),datepart(month,[MetadataDateSent])))+'.txt" -S '+@server+' '+@auth+' -d happy -w'
from [dbo].[Emails]
where datepart(year,[MetadataDateSent]) >= 2008
group by datepart(year,[MetadataDateSent]),datepart(month,[MetadataDateSent])
order by datepart(year,[MetadataDateSent]),datepart(month,[MetadataDateSent])
