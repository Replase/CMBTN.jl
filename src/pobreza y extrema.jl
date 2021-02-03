using CSVFiles, DataFrames

#=p = df_pobreza()
ex = df_pobreza_extrema()
=#

function df_pobreza()::DataFrame
    df = DataFrame(load("src\\porcentaje de pobreza.csv"))
    return df
end

function df_pobreza_extrema()::DataFrame
    df = DataFrame(load("\\src\\porcentaje de pobreza extrema.csv"))
    return df
end
