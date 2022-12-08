#' Load the 24 prices by hour of a node in a specific day
#'
#' @param node The node of the electric system; defaults to 01PLO-115
#' @param syst One of the three electrical systems of Mexico: SIN, BCA, or BCS; defaults to SIN
#' @param market One of the two markets in Mexico: MDA or MTR; defaults to MDA
#' @param fecha The date; defaults to 2017/07/11
#'
#' @return Dataframe with the 24 hours and a price for each hour
#' @export
#'
#' @examples PML()
PML<-function(node='01PLO-115',syst='SIN',market='MDA',fecha='2017/07/11'){
  http<-paste('https://ws01.cenace.gob.mx:8082/SWPML/SIM/',syst,'/',market,'/'
              ,node,'/',fecha,'/',fecha,'/XML',sep='')
  PML<-xml2::read_xml(http, warn = FALSE)
  baz <- xml2::xml_find_all(PML, ".//pml")
  pml<-xml2::xml_text(baz)
  x<-data.frame(Hora=1:(length(pml)))
  x$PML<-pml
  return(x)
}
