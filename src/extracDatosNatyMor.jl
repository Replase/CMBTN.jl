#include("apis.jl")
using HTTP, JSON
#=Ejemplos de uso
a = Cantidad_total_de("natalidad", "1996")
b = Cantidad_total_de("mortalidad", "2019")
c = Cantidad_total_de("natalidad", "campeche", "2019", "total")
d = Cantidad_total_de("natalidad", "campeche", "2001", "hombre")
e = Cantidad_total_de("mortalidad", "veracruz", "2019", "mujer")
f = vector_x_anio_de_nacimientos()
g = vector_x_anio_de_muertes()
df = df_nacimientos_x_anio()
dfm = df_muertes_x_anio()
=#

function vector_x_anio_de_nacimientos()::Vector{Int}
    try
        a = Nacimientos[1]
        b = convertir_a_json(a)
        datos = Array{Int}(undef,length(b["Series"][1]["OBSERVATIONS"]))
        for anio in 1:length(b["Series"][1]["OBSERVATIONS"])
            datos[anio] = convert_string_to_int(b["Series"][1]["OBSERVATIONS"][anio]["OBS_VALUE"])
        end
        return datos
    catch
        include("apis.jl")
        vector_x_anio_de_nacimientos()
    end
end

function vector_x_anio_de_muertes()::Vector{Int}
    try
        a = Muertes[1]
        b = convertir_a_json(a)
        datos = Array{Int}(undef,26)
        for anio in 1:length(b["Series"][1]["OBSERVATIONS"])
            datos[anio] = convert_string_to_int(b["Series"][1]["OBSERVATIONS"][anio]["OBS_VALUE"])
        end
        return datos
    catch
        include("apis.jl")
        vector_x_anio_de_muertes()
    end
end

function df_nacimientos_x_anio()::DataFrame
    try
        total = vector_x_anio_de_nacimientos(1)
        hombre = vector_x_anio_de_nacimientos(2)
        mujer = vector_x_anio_de_nacimientos(3)
        noespe = vector_x_anio_de_nacimientos(4)
        anio = vector_anio()
        a = DataFrame(Año = anio, Total = total, Hombre = hombre, Mujer = mujer, NoEspecificado = noespe)
    catch
        include("apis.jl")
        df_nacimientos_x_anio()
    end
end

function df_muertes_x_anio()::DataFrame
    try
        total = vector_x_anio_de_muertes(1)
        hombre = vector_x_anio_de_muertes(2)
        mujer = vector_x_anio_de_muertes(3)
        noespe = vector_x_anio_de_muertes(4)
        anio = vector_anio()
        a = DataFrame(Año = anio, Total = total, Hombre = hombre, Mujer = mujer, NoEspecificado = noespe)
    catch
        include("apis.jl")
        df_muertes_x_anio()
    end
end

function Cantidad_total_de(categoria::String,anio::String)::Int
    try
        if lowercase(categoria) == "natalidad"
            a = Nacimientos[1]
        elseif lowercase(categoria) == "mortalidad"
            a = Muertes[1]
        else
            println("Error en la escritura de categoria")
            return 0
        end
        b = convertir_a_json(a)
        indice = 0
        try
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
            else
                println("Error en el año establecido")
                return 0
            end
        catch
            println("Error en el año establecido")
            return 0
        end
    catch
        include("apis.jl")
        Cantidad_total_de(categoria,anio)
    end
end

function Cantidad_total_de(categoria::String, estado::String, año::String, genero::String)::Int
    try
        indice_estado = buscar_estado(lowercase(estado))
        if indice_estado == -1
            println("Estado no encontrado")
            return 0
        end
        if lowercase(categoria) == "natalidad"
            a = convertir_a_json(Nacimientos[indice_estado+1])
        elseif lowercase(categoria) == "mortalidad"
            a = convertir_a_json(Muertes[indice_estado+1])
        elseif lowercase(categoria) == "fecundidad"
            a = convertir_a_json(Embarazos[indice_estado+1])
        else
            println("Categoría no encontrada")
            return 0
        end
        if lowercase(genero) == "hombre"
            gen = 2
        elseif lowercase(genero) == "mujer"
            gen = 3
        elseif lowercase(genero) == "total"
            gen = 1
        else
            println("Entrada de género incorrecto")
            return 0
        end
        b = a.vals[14][gen]["OBSERVATIONS"]
        indice, i = 0, 1
        try
            while i <= length(b)
                if b[i]["TIME_PERIOD"] == año
                    indice = i
                end
                i = i+1
            end
            dato = convert_string_to_int(b[indice]["OBS_VALUE"])
        catch
            println("El año ingresado es incorrecto")
            return 0
        end
    catch
        include("apis.jl")
        Cantidad_total_de(categoria, estado, año, genero)
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
    try
        a = Nacimientos[1]
        b = convertir_a_json(a)
        datos = Array{Int}(undef,26)
        for anio in 1:length(b["Series"][tp]["OBSERVATIONS"])
            datos[anio] = convert_string_to_int(b["Series"][tp]["OBSERVATIONS"][anio]["OBS_VALUE"])
        end
        return datos
    catch
        include("apis.jl")
        vector_x_anio_de_nacimientos(tp)
    end
end

function vector_x_anio_de_muertes(tp::Int)::Vector{Int}
    try
        a = Muertes[1]
        b = convertir_a_json(a)
        datos = Array{Int}(undef,26)
        for anio in 1:length(b["Series"][tp]["OBSERVATIONS"])
            datos[anio] = convert_string_to_int(b["Series"][tp]["OBSERVATIONS"][anio]["OBS_VALUE"])
        end
        return datos
    catch
        include("apis.jl")
        vector_x_anio_de_muertes(tp)
    end
end

function buscar_estado(estado::String)::Int #busc a el nombre del estado y regresa su índice
    try
        for i in 2:length(nom_estados)
            if nom_estados[i] == estado
                return i
                break
            end
        end
        return -1
    catch
        include("apis.jl")
        buscar_estado(estado)
    end
end

function vector_anio()::Array{String}
    try
        a = Nacimientos[1]
        b = convertir_a_json(a)
        an = Array{String}(undef, length(b.vals[14][1]["OBSERVATIONS"]))
        for i in 1:length(b.vals[14][1]["OBSERVATIONS"])
             an[i]= b.vals[14][1]["OBSERVATIONS"][i]["TIME_PERIOD"]
        end
        return an
    catch
        include("apis.jl")
        vector_anio()
    end
end
