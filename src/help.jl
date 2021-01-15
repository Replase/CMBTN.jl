

using InfoZIP,DataFrames,HTTP,CSVFiles,ZipFile,ExcelFiles,XLSX

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

#function DFXLX(xlx::String,sheet::Int64)::DataFrame
#    w=XLSX.readxlsx(xlx)
#    list=XLSX.sheetnames(w)                               intente abrir xlsx pero no pude
#    XLSX.close(w)
#    f=DataFrame(XLSX.readtable(xlx,list[sheet]))
#    return f
#end
