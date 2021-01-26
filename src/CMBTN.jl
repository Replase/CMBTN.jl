module CMBTN

include("help.jl")
include("data.jl")
include("info.jl")
include("extracDatosNatyMor.jl")

function Estado_data()
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
    homb=value[225:256]
    muje=value[257:288]
    indi=value[193:224]
    data=DataFrame(id=d,Estado=Estados,Poblacion_total=pob,Media_edad=edad,Fecundidad=fecun,Nacimientos=naci,Defunciones=defun,Densidad_pob=dens,Hombres=homb,Mujeres=muje,indigena=indi)
    filecsv(data)
end
function Municipio_Estado()
    path=pathof(CMBTN)
    path=path[1,end-8]*"municipios.txt"
    f=open("")
    if f
        println("se abrio")
    end
    close(f)
end
end # module
