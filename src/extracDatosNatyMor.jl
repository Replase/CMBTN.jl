include("apis.jl")

#=Ejemplos de uso
a = Cantidad_total_de("natalidad", "2016")
b = Cantidad_total_de("mortalidad", "2019")
c = Cantidad_total_de("natalidad", "campeche", "2019", "total")
d = Cantidad_total_de("natalidad", "campeche", "2019", "hombre")
e = Cantidad_total_de("mortalidad", "veracruz", "2019", "mujer")
f = vector_x_anio_de_nacimientos()
g = vector_x_anio_de_muertes()
df = df_nacimientos_x_anio()
dfm = df_muertes_x_anio()
=#

#for it_naci in 1:length(Nacimientos)
function vector_x_anio_de_nacimientos()::Vector{Int}
    a = Nacimientos[1]
    b = convertir_a_json(a)
    datos = Array{Int}(undef,length(b["Series"][1]["OBSERVATIONS"]))
    for anio in 1:length(b["Series"][1]["OBSERVATIONS"])
        datos[anio] = convert_string_to_int(b["Series"][1]["OBSERVATIONS"][anio]["OBS_VALUE"])
    end
    return datos
end

function vector_x_anio_de_muertes()::Vector{Int}
    a = Muertes[1]
    b = convertir_a_json(a)
    datos = Array{Int}(undef,26)
    for anio in 1:length(b["Series"][1]["OBSERVATIONS"])
        datos[anio] = convert_string_to_int(b["Series"][1]["OBSERVATIONS"][anio]["OBS_VALUE"])
    end
    return datos
end

function df_nacimientos_x_anio()::DataFrame
    total = vector_x_anio_de_nacimientos(1)
    hombre = vector_x_anio_de_nacimientos(2)
    mujer = vector_x_anio_de_nacimientos(3)
    anio = vector_anio()
    a = DataFrame(Año = anio, Total = total, Humbre = hombre, Mujer = mujer)
end

function df_muertes_x_anio()::DataFrame
    total = vector_x_anio_de_muertes(1)
    hombre = vector_x_anio_de_muertes(2)
    mujer = vector_x_anio_de_muertes(3)
    anio = vector_anio()
    a = DataFrame(Año = anio, Total = total, Humbre = hombre, Mujer = mujer)
end

function Cantidad_total_de(categoria::String,anio::String)::Int
    if lowercase(categoria) == "natalidad"
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
    elseif lowercase(genero) == "total"
        gen = 1
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

function vector_x_anio_de_nacimientos(tp::Int)::Vector{Int}
    a = Nacimientos[1]
    b = convertir_a_json(a)
    datos = Array{Int}(undef,26)
    for anio in 1:length(b["Series"][tp]["OBSERVATIONS"])
        datos[anio] = convert_string_to_int(b["Series"][tp]["OBSERVATIONS"][anio]["OBS_VALUE"])
    end
    return datos
end

function vector_x_anio_de_muertes(tp::Int)::Vector{Int}
    a = Muertes[1]
    b = convertir_a_json(a)
    datos = Array{Int}(undef,26)
    for anio in 1:length(b["Series"][tp]["OBSERVATIONS"])
        datos[anio] = convert_string_to_int(b["Series"][tp]["OBSERVATIONS"][anio]["OBS_VALUE"])
    end
    return datos
end

function buscar_estado(estado::String)::Int #busc a el nombre del estado y regresa su índice
    for i in 2:length(nom_estados)
        if nom_estados[i] == estado
            return i
        end
    end
end

function vector_anio()::Array{String}
    a = Nacimientos[1]
    b = convertir_a_json(a)
    an = Array{String}(undef, length(b.vals[14][1]["OBSERVATIONS"]))
    for i in 1:length(b.vals[14][1]["OBSERVATIONS"])
         an[i]= b.vals[14][1]["OBSERVATIONS"][i]["TIME_PERIOD"]
    end
    return an
end
