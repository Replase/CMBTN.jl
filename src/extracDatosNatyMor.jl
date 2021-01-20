include("apis.jl")

#=Ejemplos de uso
a = Cantidad_total_de("natalidad", "2019")
b = Cantidad_total_de("mortalidad", "2019")
c = Cantidad_total_de("natalidad", "campeche", "2019", "total")
d = Cantidad_total_de("natalidad", "campeche", "2019", "hombre")
e = Cantidad_total_de("mortalidad", "veracruz", "2019", "mujer")
=#

function Cantidad_total_de(categoria::String,anio::String)::Int
    if lowercase(categoria) == "natalida"
        a = Nacimientos[1]
    elseif lowercase(categoria) == "mortalidad"
        a = Muertes[1]
    end
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
        println("No se tiene registro de natalidad en éste año")
        return 0
end

function Cantidad_total_de(categoria::String, estado::String, año::String, genero::String)::Int
    indice_estado = buscar_estado(lowercase(estado))
    if lowercase(genero) == "hombre"
        gen = 2
    elseif lowercase(genero) == "mujer"
        gen = 3
    else
        println("entrada de género incorrecto")
        gen = 0
    end
    if estado == 0
        printf("Estado no encontrado")
        return 0
    else
        if lowercase(categoria) == "natalidad"
            a = convertir_a_json(Nacimientos[indice_estado+1])
        elseif lowercase(categoria) == "mortalidad"
            a = convertir_a_json(Muertes[indice_estado+1])
        elseif lowercase(categoria) == "fecundidad"
            a = convertir_a_json(Embarazos[indice_estado+1])
        end
        b = a.vals[14][gen]["OBSERVATIONS"]
        indice, i = 0, 1
        while i <= length(b)
            if b[i]["TIME_PERIOD"] == año
                indice = i
            end
            i = i+1
        end
        dato = convert_string_to_int(b[indice]["OBS_VALUE"])
    end
end

#--------------------------Funcioes ayuda---------------------------------------------

function convert_string_to_int(dato::String)::Int
    y = parse(Float64, dato)
    y = isinteger(y) ? Int(y) : y
end

function convertir_a_json(a::HTTP.Messages.Response)::Dict{String,Any} #converte una consulta HTTP a json
    st = String(a.body)
    obj = JSON.Parser.parse(st)
    a.body = Vector{UInt8}(st)
    return obj
end

function buscar_estado(estado::String)::Int #busca el nombre del estado y regresa su índice
    if estado == "aguascalientes"   return 2 end
    if estado == "baja california"  return 3 end
    if estado == "baja california sur"  return 4 end
    if estado == "campeche" return 5 end
    if estado == "chiapas"  return 6 end
    if estado == "ciudad de mexico" return 7 end
    if estado == "coahuila" return 8 end
    if estado == "colima"   return 9 end
    if estado == "durango"  return 10 end
    if estado == "guanajuato"   return 11 end
    if estado == "guerrero" return 12 end
    if estado == "hidalgo"  return 13 end
    if estado == "jalisto"  return 14 end
    if estado == "michoacan" return 15 end
    if estado == "morelos"  return 16 end
    if estado == "estado de mexico" return 17 end
    if estado == "nayarit" return 18 end
    if estado == "nuevo Leon" return 19 end
    if estado == "oaxaca" return 20 end
    if estado == "puebla" return 21 end
    if estado == "queretaro"    return 22 end
    if estado == "quintana Roo" return 23 end
    if estado == "san Luis Potosi"  return 24 end
    if estado == "sinaloa"  return 25 end
    if estado == "sonora" return 26 end
    if estado == "tabasco" return 27 end
    if estado == "tamaulipas" return 28 end
    if estado == "tlaxcala" return 29 end
    if estado == "veracruz" return 30 end
    if estado == "yucatan" return 31 end
    if estado == "zacatecas" return 32 end
    return 0
end
