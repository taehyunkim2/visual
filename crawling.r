temp <- read_xml("http://openapi.epost.go.kr:80/postal/retrieveNewAdressAreaCdService?_wadl&type=xml&srchwrd=주월동%20408-1")
temp0 <- xmlParse(temp)

yagu <- read_html("https://sports.news.naver.com/gameCenter/textRelay.nhn?category=mlb&gameId=20191028HOMO0")
yagu0 <- htmlParse(yagu)
summary(yagu0)
?read_html

read_html("<html><title>Hi<title></html>")
class(yagu0)
str(yagu0)
yagu0

url0 <- "http://apis.data.go.kr/B552061/frequentzoneBicycle?"
ServiceKey0 <- "ServiceKey=g3u9mtatQk1WgFWX422IbwkDnonkLeyMgAacog%2BdzYTWYlgqmmMILctpdfeM089nqtAZKlgmHsBuYewwDR0fmw%3D%3D"
layers0 <- "layers=frebicycle"
format0 <- "format=image/png"
transparent0 <- "transparent=TRUE"
service0 <- "service=WMS"
version0 <- "version=1.1.1"
request0 <- "request=GetMap"
srs0 <- "srs=EPSG:900913"
bbox0 <- "bbox=14132684.718103,4485504.1936344,14167576.687913,4530396.1634438"
width0 <- "width=1024"
height0 <- "height=1024"
searchYearCd0 <- "searchYearCd=2015"
siDo0 <- "siDo=11"
guGun0 <- "guGun=320"

var0 <- paste0(c(layers0,format0, transparent0, service0, version0, request0, srs0, bbox0, width0, height0, searchYearCd0, siDo0, guGun0, ServiceKey0), collapse="&")

url <- paste0(url0, var0)
read_xml(url)
