

oisst <- raadfiles::oisst_daily_files()

## vrt suffix
vrtix <- "?a_srs=EPSG:4326&projwin=0,60,360,-60&sd_name=sst&unscale=true&ot=Float32"
oisst$dsn <- paste0(gsub("/rdsi/PUBLIC/raad/data/", "vrt:///vsicurl/https:///", oisst$fullname), vrtix, sep = "")
oisst$fullname <- NULL
oisst$root <- NULL

arrow::write_parquet(oisst, "oisstfiles.parquet")

