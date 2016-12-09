
listPackages <- c(
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
	"DT",
	"RMySQL",
	"curl",
	"jsonlite",
	"session")

fullPackageInstall <- function(

	listPackages    = listPackages, 
	packagesPath     = NULL){

	# get general repo list
	repos <- "http://cran.rstudio.com"

	# set check if installed funciton
	is.installed <- function(mypkg) is.element(mypkg, installed.packages()[,1]) 

	# get list of packages
	list.of.packages <- listPackages

	# loop through and check package installs
	for (i in 1:length(list.of.packages)) {
		if(is.installed(list.of.packages[i]) == FALSE){

			install.packages(
				list.of.packages[i],
				repos        = repos,
				lib          = packagesPath,
				dependencies = TRUE)

			print(i)
		}
	}

	# update packages
	update.packages(
		repos        = repos,
		lib          = packagesPath,
		dependencies = TRUE, 
		ask          = FALSE)

	# load packages
	data.frame(

		Package        = list.of.packages,
		Loaded         = sapply(list.of.packages, require, 
		character.only = TRUE))

}

fullPackageInstall(listPackages, packagesPath = "/usr/local/lib/R/site-library")
