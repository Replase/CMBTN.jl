module CMBTN

include("help.jl")
include("data.jl")
include("info.jl")
#=include("extracDatosNatyMor.jl")
include("migración.jl")
include("pobreza y extrema.jl")
include("idh.jl")
=#
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
    filecsv(data,"Estados")
    println("Listo")
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
    Dic=Vector()
    for (i,x) in enumerate(s)
        ids=municid(x)
        Dic=downA(x)
        if sizeof(Dic)==0
            break
        end
        awa=inegi(Dic)
        push!(info,awa)
        push!(ide,ids[1])
        push!(idm,ids[2])
        if i==500
            println("Seguimos haciendo las consultas...\n")
        end
        if i==1000
            println("Seguimos haciendo las consultas...\n")
        end
        if i==1500
            println("Seguimos haciendo las consultas...\n")
        end
        if i==2000
            println("Seguimos haciendo las consultas...\n")
        end
    end
    if sizeof(Dic)==0
        return
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
    filecsv(data,"MUNICIPIOS")
    println("Listo")
end
function union_covid(info::String) #mandas el path del archivo que genera municipi_estado o Estado_data
    path="http://datosabiertos.salud.gob.mx/gobmx/salud/datos_abiertos/datos_abiertos_covid19.zip"
    path=downl(path)
    date=string(Dates.now())
    date=date[1:10]
    date=replace(date, ['-',':'] => "")
    date=date[3:8]
    day=parse(Int64,date[5:6])
    mon=Dates.month(Dates.now())
    yea=Dates.year(Dates.now())
    if day==1
          if mon==1
                yea=yea-1
                mon=12
                ld=Dates.lastdayofmonth(Date(Dates.Month(mon),Dates.Year(yea)))
                day=Dates.day(ld)
          else
                mon=mon-1
                ld=Dates.lastdayofmonth(Date(Dates.Month(mon),Dates.Year(yea)))
                day=Dates.day(ld)
          end
    else
          day=day-1
    end
    if day<10
          day=string(0,day)
    else
          day=string(day)
    end
    if mon<10
          mon=string(0,mon)
    else
          mon=string(mon)
    end
    yea=string(yea)
    covid="COVID19MEXICO.csv"
    i="\\"
    date=i*yea[3:4]*mon*day*covid
    path=path*date
    data=DFCSV(path,false)
    data2=DFCSV(info,false)
    bol=info[end-25:end-19]
    if bol == "Estados"
        frame=leftjoin(data,data2,on=:ENTIDAD_RES=>:id)
        filecsv(frame,"COVID19ESTADOS")
    else
        frame=leftjoin(data,data2,on=[:ENTIDAD_RES=>:id_Estado,:MUNICIPIO_RES =>:id_municipio])
        filecsv(frame,"COVID19MUNICIPIOS")
    end
end
end # module
