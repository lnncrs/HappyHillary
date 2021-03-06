
--mensagens por mês de envio
select datepart(year,[MetadataDateSent]) as 'year',datepart(month,[MetadataDateSent]) as 'month',count(*) as 'qtd'
from [dbo].[Emails]
where datepart(year,[MetadataDateSent]) >= 2008
group by datepart(year,[MetadataDateSent]),datepart(month,[MetadataDateSent])
order by datepart(year,[MetadataDateSent]),datepart(month,[MetadataDateSent])

--mensagens por mês de revelação
select datepart(year,[MetadataDateReleased]) as 'year',datepart(month,[MetadataDateReleased]) as 'month',count(*) as 'qtd'
from [dbo].[Emails]
where datepart(year,[MetadataDateReleased]) >= 2008
group by datepart(year,[MetadataDateReleased]),datepart(month,[MetadataDateReleased])
order by datepart(year,[MetadataDateReleased]),datepart(month,[MetadataDateReleased])
















