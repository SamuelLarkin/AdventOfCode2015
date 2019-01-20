#!/usr/bin/env julia


answer = open("input", "r") do f
   nice = 0
   for l in eachline(f)
      if occursin(r"(..).*\1", l) && occursin(r"(.).\1", l)
         println("Nice")
         nice += 1
      end
   end
   return nice
end

println("Answer: $answer")

# 258
