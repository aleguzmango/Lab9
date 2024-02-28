####################
#                  #
# Copiar todo esto #
#                  #
####################
# Alumna: Alejandra Guzmán Dimas

# T1_03_ESPACIO PRODUCTO(2) - RELACIONAMIENTO "CASO REAL": EXPORTACIONES HIDALGUENSES

# Objetivo: Estimar el relacionamiento (relatedness, proximidad, mÈtrica de distancia entre productos)
# ------------------------------------------------------------------------------------------------------
# En este ejercicio vamos a:
# 1. Cargar nuestra matriz de datos
# 2. Calcular co ocurrencias entre lugares y productos 
# 3. Estimar el relacionamiento, teniendo como input las co ocurrencias
# 4. Graficar
# 5. Exportar los resultados para trabajarlos con cytoscape o gephi

#######################################
# practica 2: exportaciones hidalguenses #
#######################################

library (EconGeo)

#seleccionar archivo desde la ruta de su ordenador

M = as.matrix(
  read.csv("~/Documents/DOCTORADO/3er. semestre/Temas selectos I Estadística para las Ciencias Económico Administrativas/Labs/Lab 9/rca_2014.csv" , 
           sep = ",", 
           header = T, 
           row.names = 1))

head (M[,1:10])
dim (M)

co.occurrence(M)
# co-ocurrencia entre personas/paises/estados


c=co.occurrence(t(M))
# co-ocurrencia entre productos t es transpuesta
c

r=relatedness(c)
r
# estima el relacionamiento o proximidad pero normalizado, para asegurar que el numero de co ocurrencias que observamos
# es mayor al numero de co ocurrencias probables (probailidad condicional)
#tie and Surfboard puede que no esten tan relacionados, abajo de  1 no es relacionado mientras que mayor a 1 si es relacionado

write.csv(r, file="nonbinaryrelatedness.csv")
#exportar resultados del relacionamiento no binario


#opcional (sÛlo para trabajar con datos binarios)
r[r<1] = 0
r[r>1] = 1
r


library (igraph)
g1=graph_from_adjacency_matrix(r,mode="undirected")
plot(g1)



write.csv(c,file="relatedness.csv")
#exportar resultados del relacionamiento binario

write.csv(c,file="cocurrences.csv")
#exportar resultados de co ocurrencias
