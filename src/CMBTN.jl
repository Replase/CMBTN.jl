module CMBTN

include("help.jl")
include("data.jl")
include("info.jl")

function General()::String
    V=apis
    d=Vector()
    info=Vector()
    for x in V
        k=estadoid(x)
        Dic=downA(x)
        awa=inegi(Dic)
        push!(info,awa)
        push!(d,k)
    end
    value=Vector(undef,1)
    obs=Vector(undef,1)
    for n in 1:9
        for x in info
            push!(value,get(x[n],"OBS_VALUE",0))
        end
    end
    value=deleteat!(value,1)
    pob=value[1:32]
    edad=value[33:64]
    fecun=value[65:96]
    naci=value[97:128]
    defun=value[129:160]
    dens=value[161:192]
    homb=value[193:224]
    muje=value[225:256]
    indi=value[257:288]
    data=DataFrame(id=d,Estado=Estados,Poblacion_total=pob,Media_edad=edad,Fecundidad=fecun,Nacimientos=naci,Defunciones=defun,Densidad_pob=dens,Hombres=homb,Mujeres=muje,indigena=indi)
    a=filecsv(data)
    return a
end
end # module
