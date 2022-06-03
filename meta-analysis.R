# -----------------------------------------------------------------------------#
# --- Proyecto    :     Ejemplo Meta-analysis                               ---#
# --- Autor       :     Bruno Chaihuaque                                    ---#
# --- Fecha       :     03/06/2022                                          ---#
# -----------------------------------------------------------------------------#

# 1. CONFIGURACIÓN INICIAL ====
# ??? 1.1 Initial settings
rm(list = ls())
Sys.getenv("USERNAME")
# https://stackoverflow.com/questions/10164719/find-windows-user-name-within-r
if (Sys.getenv("USERNAME") == "bchai"){
  setwd("D:/Doctorado/Semestre I/Metodología de la Investigación/meta-analysis")
}
getwd()
# ??? packages installation
ipak <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[,"Package"])]
  if (length(new.pkg))
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
} 
packages <- c("metafor", "esc", "readxl")
ipak(packages)
# ipak no requiere llamar a las librerias
# Información complementaria: https://www.metafor-project.org/doku.php