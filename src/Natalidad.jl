using HTTP, JSON
Nacimientos = [HTTP.get("https://www.inegi.org.mx/app/api/indicadores/desarrolladores/jsonxml/INDICATOR/1002000026,1002000027,1002000028/es/0700/false/BISE/2.0/5568de47-3c5d-eb22-1c3c-9d4294ee5b77?type=json"),
            HTTP.get("https://www.inegi.org.mx/app/api/indicadores/desarrolladores/jsonxml/INDICATOR/1002000026,1002000027,1002000028/es/07000001/false/BISE/2.0/5568de47-3c5d-eb22-1c3c-9d4294ee5b77?type=json"),
            HTTP.get("https://www.inegi.org.mx/app/api/indicadores/desarrolladores/jsonxml/INDICATOR/1002000026,1002000027,1002000028/es/07000002/false/BISE/2.0/5568de47-3c5d-eb22-1c3c-9d4294ee5b77?type=json"),
            HTTP.get("https://www.inegi.org.mx/app/api/indicadores/desarrolladores/jsonxml/INDICATOR/1002000026,1002000027,1002000028/es/07000003/false/BISE/2.0/5568de47-3c5d-eb22-1c3c-9d4294ee5b77?type=json"),
            HTTP.get("https://www.inegi.org.mx/app/api/indicadores/desarrolladores/jsonxml/INDICATOR/1002000026,1002000027,1002000028/es/07000004/false/BISE/2.0/5568de47-3c5d-eb22-1c3c-9d4294ee5b77?type=json"),
            HTTP.get("https://www.inegi.org.mx/app/api/indicadores/desarrolladores/jsonxml/INDICATOR/1002000026,1002000027,1002000028/es/07000005/false/BISE/2.0/5568de47-3c5d-eb22-1c3c-9d4294ee5b77?type=json"),
            HTTP.get("https://www.inegi.org.mx/app/api/indicadores/desarrolladores/jsonxml/INDICATOR/1002000026,1002000027,1002000028/es/07000006/false/BISE/2.0/5568de47-3c5d-eb22-1c3c-9d4294ee5b77?type=json"),
            HTTP.get("https://www.inegi.org.mx/app/api/indicadores/desarrolladores/jsonxml/INDICATOR/1002000026,1002000027,1002000028/es/07000007/false/BISE/2.0/5568de47-3c5d-eb22-1c3c-9d4294ee5b77?type=json"),
            HTTP.get("https://www.inegi.org.mx/app/api/indicadores/desarrolladores/jsonxml/INDICATOR/1002000026,1002000027,1002000028/es/07000008/false/BISE/2.0/5568de47-3c5d-eb22-1c3c-9d4294ee5b77?type=json"),
            HTTP.get("https://www.inegi.org.mx/app/api/indicadores/desarrolladores/jsonxml/INDICATOR/1002000026,1002000027,1002000028/es/07000009/false/BISE/2.0/5568de47-3c5d-eb22-1c3c-9d4294ee5b77?type=json"),
            HTTP.get("https://www.inegi.org.mx/app/api/indicadores/desarrolladores/jsonxml/INDICATOR/1002000026,1002000027,1002000028/es/07000010/false/BISE/2.0/5568de47-3c5d-eb22-1c3c-9d4294ee5b77?type=json"),
            HTTP.get("https://www.inegi.org.mx/app/api/indicadores/desarrolladores/jsonxml/INDICATOR/1002000026,1002000027,1002000028/es/07000011/false/BISE/2.0/5568de47-3c5d-eb22-1c3c-9d4294ee5b77?type=json"),
            HTTP.get("https://www.inegi.org.mx/app/api/indicadores/desarrolladores/jsonxml/INDICATOR/1002000026,1002000027,1002000028/es/07000012/false/BISE/2.0/5568de47-3c5d-eb22-1c3c-9d4294ee5b77?type=json"),
            HTTP.get("https://www.inegi.org.mx/app/api/indicadores/desarrolladores/jsonxml/INDICATOR/1002000026,1002000027,1002000028/es/07000013/false/BISE/2.0/5568de47-3c5d-eb22-1c3c-9d4294ee5b77?type=json"),
            HTTP.get("https://www.inegi.org.mx/app/api/indicadores/desarrolladores/jsonxml/INDICATOR/1002000026,1002000027,1002000028/es/07000014/false/BISE/2.0/5568de47-3c5d-eb22-1c3c-9d4294ee5b77?type=json"),
            HTTP.get("https://www.inegi.org.mx/app/api/indicadores/desarrolladores/jsonxml/INDICATOR/1002000026,1002000027,1002000028/es/07000015/false/BISE/2.0/5568de47-3c5d-eb22-1c3c-9d4294ee5b77?type=json"),
            HTTP.get("https://www.inegi.org.mx/app/api/indicadores/desarrolladores/jsonxml/INDICATOR/1002000026,1002000027,1002000028/es/07000016/false/BISE/2.0/5568de47-3c5d-eb22-1c3c-9d4294ee5b77?type=json"),
            HTTP.get("https://www.inegi.org.mx/app/api/indicadores/desarrolladores/jsonxml/INDICATOR/1002000026,1002000027,1002000028/es/07000017/false/BISE/2.0/5568de47-3c5d-eb22-1c3c-9d4294ee5b77?type=json"),
            HTTP.get("https://www.inegi.org.mx/app/api/indicadores/desarrolladores/jsonxml/INDICATOR/1002000026,1002000027,1002000028/es/07000018/false/BISE/2.0/5568de47-3c5d-eb22-1c3c-9d4294ee5b77?type=json"),
            HTTP.get("https://www.inegi.org.mx/app/api/indicadores/desarrolladores/jsonxml/INDICATOR/1002000026,1002000027,1002000028/es/07000019/false/BISE/2.0/5568de47-3c5d-eb22-1c3c-9d4294ee5b77?type=json"),
            HTTP.get("https://www.inegi.org.mx/app/api/indicadores/desarrolladores/jsonxml/INDICATOR/1002000026,1002000027,1002000028/es/07000020/false/BISE/2.0/5568de47-3c5d-eb22-1c3c-9d4294ee5b77?type=json"),
            HTTP.get("https://www.inegi.org.mx/app/api/indicadores/desarrolladores/jsonxml/INDICATOR/1002000026,1002000027,1002000028/es/07000021/false/BISE/2.0/5568de47-3c5d-eb22-1c3c-9d4294ee5b77?type=json"),
            HTTP.get("https://www.inegi.org.mx/app/api/indicadores/desarrolladores/jsonxml/INDICATOR/1002000026,1002000027,1002000028/es/07000022/false/BISE/2.0/5568de47-3c5d-eb22-1c3c-9d4294ee5b77?type=json"),
            HTTP.get("https://www.inegi.org.mx/app/api/indicadores/desarrolladores/jsonxml/INDICATOR/1002000026,1002000027,1002000028/es/07000023/false/BISE/2.0/5568de47-3c5d-eb22-1c3c-9d4294ee5b77?type=json"),
            HTTP.get("https://www.inegi.org.mx/app/api/indicadores/desarrolladores/jsonxml/INDICATOR/1002000026,1002000027,1002000028/es/07000024/false/BISE/2.0/5568de47-3c5d-eb22-1c3c-9d4294ee5b77?type=json"),
            HTTP.get("https://www.inegi.org.mx/app/api/indicadores/desarrolladores/jsonxml/INDICATOR/1002000026,1002000027,1002000028/es/07000025/false/BISE/2.0/5568de47-3c5d-eb22-1c3c-9d4294ee5b77?type=json"),
            HTTP.get("https://www.inegi.org.mx/app/api/indicadores/desarrolladores/jsonxml/INDICATOR/1002000026,1002000027,1002000028/es/07000026/false/BISE/2.0/5568de47-3c5d-eb22-1c3c-9d4294ee5b77?type=json"),
            HTTP.get("https://www.inegi.org.mx/app/api/indicadores/desarrolladores/jsonxml/INDICATOR/1002000026,1002000027,1002000028/es/07000027/false/BISE/2.0/5568de47-3c5d-eb22-1c3c-9d4294ee5b77?type=json"),
            HTTP.get("https://www.inegi.org.mx/app/api/indicadores/desarrolladores/jsonxml/INDICATOR/1002000026,1002000027,1002000028/es/07000028/false/BISE/2.0/5568de47-3c5d-eb22-1c3c-9d4294ee5b77?type=json"),
            HTTP.get("https://www.inegi.org.mx/app/api/indicadores/desarrolladores/jsonxml/INDICATOR/1002000026,1002000027,1002000028/es/07000029/false/BISE/2.0/5568de47-3c5d-eb22-1c3c-9d4294ee5b77?type=json"),
            HTTP.get("https://www.inegi.org.mx/app/api/indicadores/desarrolladores/jsonxml/INDICATOR/1002000026,1002000027,1002000028/es/07000030/false/BISE/2.0/5568de47-3c5d-eb22-1c3c-9d4294ee5b77?type=json"),
            HTTP.get("https://www.inegi.org.mx/app/api/indicadores/desarrolladores/jsonxml/INDICATOR/1002000026,1002000027,1002000028/es/07000031/false/BISE/2.0/5568de47-3c5d-eb22-1c3c-9d4294ee5b77?type=json"),
            HTTP.get("https://www.inegi.org.mx/app/api/indicadores/desarrolladores/jsonxml/INDICATOR/1002000026,1002000027,1002000028/es/07000032/false/BISE/2.0/5568de47-3c5d-eb22-1c3c-9d4294ee5b77?type=json")]
#= Nacional, hombres y mujeres
1- Estados Unidos Mexicanos
2- Aguascalientes Total estatal
3- Baja california Tot est
4- Baja california sur tot est
=#

#dato = Natalidad(true, "2018") arroja el numero total de nacimientos en todo el territorio mexicano en ese año

function Natalidad(tot::Bool, anio::String)::Int
    a = Nacimientos[1]
    b = convertir_a_json(a)
    indice = 0
    if convert_string_to_int(anio) >=1994 && convert_string_to_int(anio) <=2019
        for i in 1:length(b.vals[14][1]["OBSERVATIONS"])
            if anio == b.vals[14][1]["OBSERVATIONS"][i]["TIME_PERIOD"]
                indice = i
            end
        end
        if indice != 0
            dato = b.vals[14][1]["OBSERVATIONS"][indice]["OBS_VALUE"]
            dato = convert_string_to_int(dato)
            return dato
        end
        println("Año no encontrado")
        return 0
    end
        println("Ingrese un año correcto")
        return 0
end

function convert_string_to_int(dato::String)::Int
    y = parse(Float64, dato)
    y = isinteger(y) ? Int(y) : y
end

function convertir_a_json(a::HTTP.Messages.Response)::Dict{String,Any}
    st = String(a.body)
    obj = JSON.Parser.parse(st)
    a.body = Vector{UInt8}(st)
    return obj
end
