

using InfoZIP,DataFrames,HTTP,CSVFiles,ZipFile,ExcelFiles,XLSX

function decompress(zipp::String,dir::String)  #Descomprime un .zip dando su direccion y donde cae
    InfoZIP.unzip(zipp,dir)
end
function decompress(zipp::String)::String #descomprime un .zip y lo guarda el la direccion actual
    a=InfoZIP.unzip(zipp,pwd())
    return a
end

#this is a comment I added
function DFCSV(csvv::String,g::Bool)::DataFrame
    if g
        f=DataFrame(load(csvv,delim=';'))  #Lee un archivo csv si manda true esta divido por ; si no es ,
    else
        f=DataFrame(load(csvv))
    end
    return f
end
function filecsv(file::DataFrame)
    save("file.csv",file)                   #crea un arhchivo csv en el directorio base
end
function downl(url::String,dir::String)::String
        a=HTTP.download(url,dir)                            #Descarga un archivo y si es un zip lo descomprime
        b=sizeof(a)
        c=b-2
        tipo=a[c]*a[c+1]*a[c+2]
        if tipo == "zip"
            decompress(a,dir)
            return ""
        end
        return a
end
function downl(url::String)::String
    a=HTTP.download(url,pwd())
    b=sizeof(a)
    c=b-2
    tipo=a[c]*a[c+1]*a[c+2]
    if tipo == "zip"
        decompress(a,pwd())
        return pwd()
    end
    return a
end
