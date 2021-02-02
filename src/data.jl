using DataFrames


function inegi(dic::Vector)::Vector
      vector=Vector(undef,1)
      for x in dic
            obs=get(x,"OBSERVATIONS",3)
            data=get(obs[1],"OBS_VALUE",3)
            push!(vector,data)
      end
      deleteat!(vector,1)
      return vector
end
function estadoid(url::String)::Int64
      a=url[182:189]
      f=parse(Int64,a)
      f=f-7000000
      return f
end
function municid(url::String)::Vector
      a=url[187:189]
      g=parse(Int64,a)
      f=url[190:193]
      f=parse(Int64,f)
      vec=Vector()
      push!(vec,g)
      push!(vec,f)
      return vec
end
function dataind(vect::Vector,g::Bool)::Vector
      vec=Vector(undef,1)
      if g                                                                              ### true indicadores
            for x in vect
                  push!(vec,get(x,"INDICADOR",0))
            end
      else                                                                                ##false valores
            for x in vect
                  push!(vec,get(x,"OBS_VALUE",0))
            end
      end
      deleteat!(vec,1)
      return vec
end
