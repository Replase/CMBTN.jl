using DataFrames


function inegi(dic::Dict)::Vector
      a=get(dic,"Series",3)
      vector=Vector{Dict{String,Any}}(undef,1)
      for x in a
            obs=get(x,"OBSERVATIONS",3)
            data=get(obs[1],"OBS_VALUE",3)
            #ind=get(x,"INDICADOR",3)
            dic2=Dict("OBS_VALUE"=>data)#dic2=Dict("INDICADOR"=>ind,"OBS_VALUE"=>data)
            push!(vector,dic2)
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
      a=url[182:189]
      b=url[182:193]
      g=parse(Int64,a)
      g=g-7000000
      f=b[end-3:end]
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

function detainf(vect::Vector)::Vector

end
