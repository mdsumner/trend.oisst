

oisst <- raadfiles::oisst_daily_files()
range(oisst$date)
## vrt suffix
vrtix <- "?a_srs=EPSG:4326&projwin=0,60,360,-60&sd_name=sst&unscale=true&ot=Float32"
url <- gsub("/rdsi/PUBLIC/raad/data/", "https://", oisst$fullname)
oisst$dsn <- paste0( "vrt:///vsicurl/", url, vrtix, sep = "")
oisst$fullname <- NULL
oisst$root <- NULL

arrow::write_parquet(oisst, "oisstfiles.parquet")

