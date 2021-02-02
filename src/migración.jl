using CSVFiles, DataFrames
#a = df_migracion()

function df_migracion()::DataFrame
    df = DataFrame(load("indimigra.csv"))
    return df
end
