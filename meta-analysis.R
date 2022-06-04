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
# ??? data upload
## Ejemplo 1: carga de la base de datos si tenemos cada Variable Dependiente (VD)
## en una hoja distinta de excel

baseMA <- read_excel('', 
                     # hay que cambiar en sheet cada hoja sobre la VD
                     sheet = 'Reincidencia', col_names = TRUE)
## Hacer lo mismo para cada pestaña

## Ejemplo 2: Carga de la base de datos si tenemos una sola hoja excel y una variable con 
## las VD del estudio
baseMA <- read_excel('')
baseMAreinci <- baseNA[baseMA$VD == 'Reincidencia',]

## se cargan varias columnas, pero interesa la D "Tamaño del efecto" y como la 
## variabilidad del tamaño del efecto

## Ejemplo aplicado
baseMAWoS <- baseMA[baseMA$Buscador=='WoS',]
## Ejemplo completa acá: http://www.simonqueenborough.info/R/specialist/meta-analysis
## Cálculo de d y variabilidad para comparación de medias estandarizadas
help(escalc)
escalc(measure = 'SMD', 
       m1i = baseMA$MControlPost,
       m2i = baseMA$MExperimentalPost,
       sd1i = baseMA$DTControlPost,
       sd2i = baseMA$DTExperimentalPost,
       n1i = baseMA$NControl,
       n2i = baseMA$NExperimental)
