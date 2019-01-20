#!/usr/bin/env julia

using DataStructures

answer = open("input", "r") do f
   dict = DefaultDict{Tuple{Int64,Int64},Int64}(0)
   line = read(f, String)
   x, y = 0, 0
   dict[(x,y)] += 1
   for c in line
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
      dict[(x,y)] += 1
   end

   return length(dict)
end

println("Answer: $answer")
