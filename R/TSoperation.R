#' @title TS Operation
#' @name TSoperation
#' @aliases TSoperation
#' @author Adeline Maciel
#'
#' @description Acquire time series tibble from service
#'
#' @usage TSoperation(name_service = "WTSS-INPE",
#' coverage = "MOD13Q1", longitude = NULL,
#' latitude = NULL, bands = c("ndvi", "evi", "nir", "mir", "blue", "red"),
#' start_date = NULL, end_date = NULL)
#'
#' @param name_service  information of service, like WTSS-INPE or SATVEG.
#' @param coverage      name of coverage from service.
#' @param longitude     longitude information.
#' @param latitude      latitude information.
#' @param bands         set of bands from coverage
#' @param start_date    first date of interval
#' @param end_date      last date of the interval
#' @return Data set with time series data
#' @export
#' @importFrom Rwtss time_series
#'

TSoperation <- function(name_service = "WTSS-INPE", coverage = "MOD13Q1", longitude = NULL, latitude = NULL, bands = c("ndvi", "evi", "nir", "mir", "blue", "red"), start_date = NULL, end_date = NULL){

  if(name_service == "WTSS-INPE"){
    wtss_inpe <-  "http://www.esensing.dpi.inpe.br/wtss/"
    # Rwtss::list_coverages(wtss_inpe)
    #desc <- Rwtss::describe_coverage(wtss_inpe, name = "MOD13Q1")
    point.tb   <- Rwtss::time_series(URL = wtss_inpe,
                                    name = coverage,
                                    attributes = c(bands),
                                    longitude = as.numeric(longitude),
                                    latitude  = as.numeric(latitude),
                                    start_date = start_date,
                                    end_date = end_date)

    return(point.tb)
  }

}

# library("terrabrasilisTimeSeries")
# wtss <- TSoperation(name_service = "WTSS-INPE", coverage = "MOD13Q1", longitude = -56.245043, latitude = -13.224772, bands = c("evi","ndvi"), start_date = "2004-02-14", end_date = "2018-05-12")
# plot.ts(wtss$time_series[[1]]$evi, type="l", col="black" )
#
# satveg <- TSoperation(name_service = "SATVEG", coverage = "terra", longitude = -56.245043, latitude = -13.224772)
# plot.ts(satveg$time_series[[1]]$EVI, type="l", col="blue" )

# as in ocpu documentation
# curl https://terrabrasilis.ocpu.io/terrabrasilisTimeSeries/R/TSoperation/json -H "Content-Type: application/json" -d '{"name_service":"WTSS-INPE", "coverage":"MOD13Q1", "bands":"EVI", "longitude":-56, "latitude":"-12", "start_date":"2001-01-01", "end_date":"2002-01-01"}'

# save file
# curl -o file.json https://terrabrasilis.ocpu.io/terrabrasilisTimeSeries/R/TSoperation/json -d 'name_service="WTSS-INPE"&coverage="MOD13Q1"&bands="EVI"&longitude="-56"&latitude="-12"&start_date="2001-01-01"&end_date="2002-01-01"'

# only json
# curl https://terrabrasilis.ocpu.io/terrabrasilisTimeSeries/R/TSoperation/json -d 'name_service="WTSS-INPE"&coverage="MOD13Q1"&bands="EVI"&longitude="-56"&latitude="-12"&start_date="2001-01-01"&end_date="2002-01-01"'

# information
# curl -v https://terrabrasilis.ocpu.io/terrabrasilisTimeSeries/R/TSoperation/json -d 'name_service="WTSS-INPE"&coverage="MOD13Q1"&bands="EVI"&longitude="-56"&latitude="-12"&start_date="2001-01-01"&end_date="2002-01-01"'

