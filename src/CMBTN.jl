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
function Municipio_Estado(path::String)                                        #Tiene que insertar el path del package CMBTN
    m="\\src\\municipio.txt"
    p=path*m
    f=open(p)
    s=readlines(f)
    close(f)
    ide=Vector()
    idm=Vector()
    info=Vector()
    for (i,x) in enumerate(s)
        ids=municid(x)
        Dic=downA(x)
        awa=inegi(Dic)
        push!(info,awa)
        push!(ide,ids[1])
        push!(idm,ids[2])
        println("$i")
        if i==15
            break
        end
    end
    value=Vector(undef,1)
    obs=Vector(undef,1)
    for n in 1:9
        for x in info
            push!(value,get(x[n],"OBS_VALUE",0))
        end
    end
    value=deleteat!(value,1)
    pob=value[1:15]
    edad=value[16:30]
    fecun=value[31:45]
    naci=value[46:60]
    defun=value[61:75]
    dens=value[76:90]
    homb=value[106:120]
    muje=value[121:135]
    indi=value[91:105]
    #pob=value[1:2469]
    #edad=value[2470:4938]
    #fecun=value[4939:7407]
    #naci=value[7408:9876]
    #defun=value[9877:12345]
    #dens=value[12346:14814]
    #homb=value[17284:19752]
    #muje=value[19752:22221]
    #indi=value[14815:17283]
    data=DataFrame(id_Estado=ide,id_municipio=idm,Poblacion_total=pob,Media_edad=edad,Fecundidad=fecun,Nacimientos=naci,Defunciones=defun,Densidad_pob=dens,Hombres=homb,Mujeres=muje,indigena=indi)
    filecsv(data)
end
end # module
