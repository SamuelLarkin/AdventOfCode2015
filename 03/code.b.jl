#!/usr/bin/env julia

using DataStructures

function move(x, y, c)
   if c == '^'
      y += 1
   elseif c == 'v'
      y -= 1
   elseif c == '<'
      x -= 1
   elseif c == '>'
      x += 1
   else
      println("Error")
   end
   return x, y
end


answer = open("input", "r") do f
   houses = DefaultDict{Tuple{Int64,Int64},Int64}(0)
   line = read(f, String)

   x, y = 0, 0
   houses[(x,y)] += 1
   for c in line[1:2:end]
      x, y = move(x, y, c)
      houses[(x,y)] += 1
   end

   x, y = 0, 0
   houses[(x,y)] += 1
   for c in line[2:2:end]
      x, y = move(x, y, c)
      houses[(x,y)] += 1
   end

   return length(houses)
end

println("Answer: $answer")

# 2574 too low
# 2784 too high
