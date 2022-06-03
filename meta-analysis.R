# -----------------------------------------------------------------------------#
# --- Proyecto    :     Ejemplo Meta-analysis                               ---#
# --- Autor       :     Bruno Chaihuaque                                    ---#
# --- Fecha       :     03/06/2022                                          ---#
# -----------------------------------------------------------------------------#

# Lectura de paquetes
ipak <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[,"Package"])]
  if (length(new.pkg))
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
} 
packages <- c("metafor", "esc", "readxl")
ipak(packages)