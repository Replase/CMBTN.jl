

using InfoZIP,DataFrames,HTTP,CSVFiles,ZipFile

function decompress(zipp::String,dir::String)  #Descomprime un .zip dando su direccion y donde cae
    InfoZIP.unzip(zipp,dir)
end
function decompress(zipp::String) #descomprime un .zip y lo guarda el la direccion actual
    InfoZIP.unzip(zipp,pwd())
end


function DFCSV(csvv::String,g::Bool)::DataFrame
    if g
        f=DataFrame(load(csvv,delim=';'))  #Lee un archivo csv si manda true esta divido por ; si no es ,
    else
        f=DataFrame(load(csvv))
    end
    return f
end
