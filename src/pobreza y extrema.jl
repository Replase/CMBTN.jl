using CSVFiles, DataFrames

#=p = df_pobreza()
ex = df_pobreza_extrema()
=#

function df_pobreza(path::String)::DataFrame
    archi = "\\src\\porcentaje de pobreza.csv"
    archi = path * archi
    df = DataFrame(load(archi))
    return df
end

function df_pobreza_extrema(path::String)::DataFrame
    archi = "\\src\\porcentaje de pobreza extrema.csv"
    archi = path * archi
    df = DataFrame(load(archi))
    return df
end
