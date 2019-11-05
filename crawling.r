library(treemap)
library(readxl)
library(dplyr)
library(xml2)
library(XML)

url0 <- "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnMesureSidoLIst"
type <- "type=xml"
key <- "ServiceKey=g3u9mtatQk1WgFWX422IbwkDnonkLeyMgAacog%2BdzYTWYlgqmmMILctpdfeM089nqtAZKlgmHsBuYewwDR0fmw%3D%3D"
sido <- "sidoName=서울"
cond <- "searchCondition=DAILY"
url <- paste0(url0, "?", type, "&", key, "&", sido, "&", cond)

res <- xmlParse(read_xml(url, encoding="ko_KR.UTF-8"), encoding="ko_KR.UTF-8")