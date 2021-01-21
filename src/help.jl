

using InfoZIP,DataFrames,HTTP,CSVFiles,JSON,Dates

function decompress(zipp::String,dir::String)  #Descomprime un .zip dando su direccion y donde cae
    InfoZIP.unzip(zipp,dir)
end
function decompress(zipp::String) #descomprime un .zip y lo guarda el la direccion actual
    InfoZIP.unzip(zipp,pwd())
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
    date=string(Dates.now())
    date=date[1:19]
    date=replace(date, ['-',':'] => "")
    n="file"
    fin=".csv"
    name=n*date*fin
    a=save(name,file)                  #crea un arhchivo csv en el directorio base
end
function downl(url::String,dir::String)::String
        a=HTTP.download(url,dir)                            #Descarga un archivo y si es un zip lo descomprime
        tipo=a[end-2:end]
        if tipo == "zip"
            decompress(a,dir)
            return ""
        end
        return a
end
function downl(url::String)::String
    a=HTTP.download(url,pwd())
    tipo=a[end-2:end]
    if tipo == "zip"
        decompress(a,pwd())
        return pwd()
    end
    return a
end
function downA(API::String)::Dict
    a=HTTP.request("GET",API)
    f=String(a.body)
    Dic=Dict()
    Dic=JSON.parse(f)
    return Dic
end
