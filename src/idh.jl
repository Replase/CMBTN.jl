using CSVFiles, DataFrames
#a = df_migracion()

function df_IDH(path::String)::DataFrame
    archi = "\\src\\idh.csv"
    archi = path * archi
    df = DataFrame(load(archi))
    return df
end
