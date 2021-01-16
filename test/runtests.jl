using Test
using HTTP
#a="codigos-postales.csv"
#f=CMBTN.DFCSV(a,true)  #true porque es un archivo divido por ;
#size(f)
#@testset "CMBTN.jl" begin

#end
#@test true
#a=DataFrame(a=[1,2,3,4],b=["agua","pasa","por","mi"],c=[4,3,2,1])
#CMBTN.filecsv(a)
a="http://datosabiertos.salud.gob.mx/gobmx/salud/datos_abiertos/datos_abiertos_covid19.zip"
b="C:\\Users\\Alan\\Documents\\GitHub"
c=CMBTN.downl(a,b)
#a=HTTP.download(a,b)
println("$c")
