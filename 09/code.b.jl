#!/usr/bin/env  julia

using DataStructures
using ResumableFunctions
# https://github.com/BenLauwens/ResumableFunctions.jl

distances, towns = open("input", "r") do f
   distances = DefaultDict{String,Dict{String,Int32}}(Dict{String,Int32})
   towns = Set{String}()
   @elapsed for l in eachline(f)
      parts = split(l)
      from = parts[1]
      to = parts[3]
      distance = parse(Int32, parts[5])
      distances[from][to] = distance
      distances[to][from] = distance
      push!(towns, from)
      push!(towns, to)
   end

   return distances, towns
end

function walk(unvisited::Set, visited::Array, distance::Integer)
   #println("walk with: $unvisited, $visited, $distance")
   # No more places to visit
   if length(unvisited) === 0
      #println(distance, visited)
      return [(distance, visited)]
   end

   results = []
   # Start visiting
   if length(visited) === 0
      println("Starting with: $unvisited, $visited, $distance")
      for to in unvisited
         r = walk(setdiff(unvisited, Set([to])), vcat(visited, [to]), 0)
         #push!(results, r)
         results = vcat(results, r)
      end
   else
      from = visited[end]
      tos  = setdiff(keys(distances[from]), visited)
      #println("$from $tos")

      for to in tos
         d = distances[from][to]
         r = walk(setdiff(unvisited, Set([to])), vcat(visited, [to]), distance + d)
         #push!(results, r)
         results = vcat(results, r)
      end
   end

   return results
end

if false
   println(distances)
   println(towns)

   routes = walk(towns, [], 0)
   #for a in routes
   #   println("A: $a")
   #end

   answer = sort(routes, rev = true, by = x -> x[1])[1]
   println("Answer: $answer")
end


@elapsed function walk2(unvisited::Set, visited::Array, distance::Integer)::Tuple{Integer,Array}
   #println("walk with: $unvisited, $visited, $distance")
   # No more places to visit
   if length(unvisited) === 0
      #println(distance, visited)
      return (distance, visited)
   end

   best = undef
   # Start visiting
   if length(visited) === 0
      println("Starting with: $unvisited, $visited, $distance")
      for to in unvisited
         r = walk2(setdiff(unvisited, Set([to])), vcat(visited, [to]), 0)
         if best === undef || r[1] > best[1]
            best = r
         end
      end
   else
      from = visited[end]
      tos  = setdiff(keys(distances[from]), visited)
      #println("$from $tos")

      for to in tos
         d = distances[from][to]
         r = walk2(setdiff(unvisited, Set([to])), vcat(visited, [to]), distance + d)
         if best === undef || r[1] > best[1]
            best = r
         end
      end
   end

   return best
end

println(distances)
println(towns)

println("Answer2: ", walk2(towns, [], 0))

# 117
