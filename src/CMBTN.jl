module CMBTN

include("help.jl")
include("data.jl")
include("info.jl")
include("extracDatosNatyMor.jl")

function Estado_data()
    V=apis
    ids=Vector()
    info=Vector()
    for x in V
        k=estadoid(x)
        v=downA(x)
        awa=inegi(v)
        push!(info,awa)
        push!(ids,k)
    end
    nine=Vector(undef,9)
    for n in 1:9
        data=Vector(undef,1)
        for x in info
            push!(data,x[n])
        end
        nine[n]=deleteat!(data,1)
    end
    data=DataFrame(id=ids,Estado=Estados,Poblacion_total=nine[1],Media_edad=nine[2],Fecundidad=nine[3],Nacimientos=nine[4],Defunciones=nine[5],Densidad_pob=nine[6],Hombres=nine[8],Mujeres=nine[9],indigena=nine[7])
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
        if i==500
            sleep(120)
        end
        if i==1000
            sleep(120)
        end
        if i==1500
            sleep(120)
        end
        if i==2000
            sleep(120)
        end
    end
    nine=Vector(undef,9)
    for n in 1:9
        data=Vector(undef,1)
        for x in info
            try
                push!(data,x[n])
            catch err
                push!(data,999)
            end
        end
        nine[n]=deleteat!(data,1)
    end
    data=DataFrame(id_Estado=ide,id_municipio=idm,Poblacion_total=nine[1],Media_edad=nine[2],Fecundidad=nine[3],Nacimientos=nine[4],Defunciones=nine[5],Densidad_pob=nine[6],Hombres=nine[8],Mujeres=nine[9],indigena=nine[7])
    filecsv(data)
end
end # module
