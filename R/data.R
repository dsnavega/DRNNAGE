#' @title Coimbra Adult Macroscopic Skeletal Age Dataset
#' @description Macroscopic Skeletal Age-related Traits from Coimbra Identified Skeletal Collections.
#' @format A data frame with 500 rows and 67 variables:
#' \describe{
#'   \item{\code{ID}}{character Unique Identifier}
#'   \item{\code{SEX}}{character Biological Sex}
#'   \item{\code{AGE}}{double Chronological Age-at-Death}
#'   \item{\code{CRS01}}{double Suture: Palatine (posterior median)}
#'   \item{\code{CRS02L}}{double Suture: Palatine (transverse, left)}
#'   \item{\code{CRS02R}}{double Suture: Palatine (transverse, right)}
#'   \item{\code{CRS03}}{double Suture: Coronal - Sagittal (pars bregmatica)}
#'   \item{\code{CRS04L}}{double Suture: Coronal (pars pterica, left)}
#'   \item{\code{CRS04R}}{double Suture: Coronal (pars pterica, right)}
#'   \item{\code{CRS05}}{double Suture: Sagittal - Lambdoid (pars lambdica)}
#'   \item{\code{CRS06L}}{double Suture: Lambdoid (pars asterica, left)}
#'   \item{\code{CRS06R}}{double Suture: Lambdoid (pars asterica, right)}
#'   \item{\code{C3IS}}{double C3 body inferior surface and margin}
#'   \item{\code{C4SS}}{double C4 body superior surface and margin}
#'   \item{\code{C4IS}}{double C4 body inferior surface and margin}
#'   \item{\code{C5SS}}{double C5 body superior surface and margin}
#'   \item{\code{C5IS}}{double C5 body inferior surface and margin}
#'   \item{\code{C6SS}}{double C6 body superior surface and margin}
#'   \item{\code{C6IS}}{double C6 body inferior surface and margin}
#'   \item{\code{C7SS}}{double C7 body superior surface and margin}
#'   \item{\code{L1IS}}{double L1 body inferior surface and margin}
#'   \item{\code{L2SS}}{double L2 body superior surface and margin}
#'   \item{\code{L2IS}}{double L2 body inferior surface and margin}
#'   \item{\code{L3SS}}{double L3 body superior surface and margin}
#'   \item{\code{L3IS}}{double L3 body inferior surface and margin}
#'   \item{\code{L4SS}}{double L4 body superior surface and margin}
#'   \item{\code{L4IS}}{double L4 body inferior surface and margin}
#'   \item{\code{L5SS}}{double L5 body superior surface and margin}
#'   \item{\code{S1SS}}{double S1 body superior surface and margin}
#'   \item{\code{S1S2F}}{double S1-S2 Fusion}
#'   \item{\code{SC01}}{double Scapula (glenoid fossa)}
#'   \item{\code{HM01}}{double Proximal humerus (head)}
#'   \item{\code{HM02}}{double Proximal humerus (lesser tubercle)}
#'   \item{\code{HM03}}{double Proximal humerus (greater tubercle)}
#'   \item{\code{HM04}}{double Distal humerus (trochlea and capitulum)}
#'   \item{\code{HM05}}{double Distal humerus (medial epicondyle)}
#'   \item{\code{HM06}}{double Distal humerus (lateral epicondyle)}
#'   \item{\code{UL01}}{double Proximal ulna (articular facets)}
#'   \item{\code{UL02}}{double Proximal ulna (olecranon)}
#'   \item{\code{RD01}}{double Proximal radius (head)}
#'   \item{\code{RD02}}{double Proximal radius (radial tuberosity)}
#'   \item{\code{OC01}}{double Os coxa (iliac tuberosity)}
#'   \item{\code{OC02}}{double Os coxa (ischial tuberosity)}
#'   \item{\code{OC03}}{double Os coxa (acetabulum)}
#'   \item{\code{FM01}}{double Proximal femur (head)}
#'   \item{\code{FM02}}{double Proximal femur (trochanteric fossa)}
#'   \item{\code{FM03}}{double Proximal femur (lesser trochanter)}
#'   \item{\code{FM04}}{double Proximal femur (lesser trochanter)}
#'   \item{\code{FM05}}{double Distal femur (condyles)}
#'   \item{\code{TB01}}{double Proximal tibia (condyles)}
#'   \item{\code{PT01}}{double Patella (articular facets)}
#'   \item{\code{PT02}}{double Patella (base)}
#'   \item{\code{CLN01}}{double Patella (calcaneal tuberosity, superior)}
#'   \item{\code{CLV01}}{double Clavicle Sternal end}
#'   \item{\code{CLV02}}{double Clavicle Acromial end}
#'   \item{\code{RB101}}{double 1st rib costal face}
#'   \item{\code{RB102}}{double 1st rib tubercle}
#'   \item{\code{PSY01}}{double Pubic symphysis rim}
#'   \item{\code{PSY02}}{double Pubic symphysis topography}
#'   \item{\code{PSY03}}{double Pubic symphysis texture}
#'   \item{\code{IAS01}}{double Iliac auricular surface texture}
#'   \item{\code{IAS02}}{double Iliac auriuclar surface margin}
#'   \item{\code{SAS01}}{double Sacral auricular surface texture}
#'   \item{\code{SAS02}}{double Sacral auricular surface margin}
#'   \item{\code{ACT01}}{double Acetabulum rim}
#'   \item{\code{ACT02}}{double Acetabulum posterior horn}
#'   \item{\code{ACT03}}{double Acetabulum fossa}
#'}
#' @source \url{https://github.com/dsnavega/DRNNAGE}
"CAMSAD"
