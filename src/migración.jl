using CSVFiles, DataFrames
#a = df_migracion()

function df_migracion(path::String)::DataFrame
    archi = "\\src\\indimigra.csv"
    archi = path * archi
    df = DataFrame(load(archi))
    return df
end
