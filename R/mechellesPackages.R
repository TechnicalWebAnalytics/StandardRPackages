repos <- "http://cran.rstudio.com"
lib.loc <- "/usr/local/lib/R/site-library"

is.installed <- function(mypkg) is.element(mypkg, installed.packages()[,1]) 

list.of.packages <- c(
	"rJava", # may need to update system java
	"RGoogleAnalytics", 
	"plyr",
	"dplyr", 
	"XLConnect", 
	"xlsx", 
	"RCurl", 
	"rJava", 
	"xlsxjars", 
	"xlsx",
	"googlesheets",
	"readr",
	"rematch",
	"RGA",
	"data.table",
	"XML",
	"RCurl",
	"httr",
	"differR",
	"DT",
	"RMySQL",
	"curl",
	"jsonlite")

for (i in 1:length(list.of.packages)) {
	if(is.installed(list.of.packages[i]) == FALSE){
		install.packages(list.of.packages[i],repos=repos,lib=lib.loc, dependencies=TRUE)
		print(i)
	}
}

update.packages(repos=repos,lib=lib.loc, dependencies=TRUE, ask=FALSE)
getPackages <- lapply(list.of.packages, require, character.only=TRUE)
