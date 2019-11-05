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
nor <- "numOfRows=25"
url <- paste0(url0, "?", type, "&", key, "&", sido, "&", cond, "&", nor)

res <- read_xml(url) %>% xmlParse()

resdata <- getNodeSet(res,"//item") %>% xmlToDataFrame(stringsAsFactors = F)
resdata[resdata == "-"] <- NA
resdata[, 7] <- as.numeric(resdata[, 7])
resdata[, 9] <- 1:25
treemap(resdata, index="cityName", vSize="pm10Value", type="index",fontfamily.labels = "NanumBarunGothic")
treemap(resdata)
str(resdata)
