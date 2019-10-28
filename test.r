# install.packages("readxl")
# install.packages("dplyr")
# install.packages("xml2")
# install.packages("treemap")
# install.packages("XML")
library(treemap)
library(readxl)
library(dplyr)
library(xml2)
library(XML)

budget <- data.frame()

for (i in 1:9)
{
  url0    = "http://openapi.openfiscaldata.go.kr/TotalExpenditure1?"
  api_key = "(인증키)"
  type    = "Type=xml&"
  pIndex  = paste("pIndex=", i, "&", sep = "")
  pSize   = "pSize=1000&"
  # OJ_YY   = "OJ_YY=2010"
  FSCL_YY    = "FSCL_YY=2019"
  OFFC_NM   = "OFFC_NM=기획재정부"
  url = paste0(url0, api_key, type, pIndex, pSize, FSCL_YY)
  temp <- read_xml(url)
  
  temp0 <- xmlParse(temp)
  ?xmlParse
  df <- xmlToDataFrame(getNodeSet(temp0, "//row"))
  
  budget <- budget %>% 
    rbind(df)
}

# unique
budget <- budget %>% unique()

budget %>%
  group_by(OFFC_NM, PGM_NM) %>%
  summarize(sum0 = round(sum(as.numeric(as.character(Y_YY_DFN_MEDI_KCUR_AMT))))*1e-9 ) %>%
  mutate(sum = round(sum0,2)) %>%
  treemap(index = c("OFFC_NM", "PGM_NM"), vSize = "sum", type = "index", palette="RdYlBu", fontsize.labels=c(14,7), border.col=c("black","black"), border.lwds=c(1,0.5) , title = "부처별 예산액")