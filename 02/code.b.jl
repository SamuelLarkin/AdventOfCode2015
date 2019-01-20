#!/usr/bin/env julia

total_ribbon_length = open("input", "r") do f
   ribbon = 0
   for l in eachline(f)
      d = map(x -> parse(Int, x), split(l, "x"))
      l = d[1]
      w = d[2]
      h = d[3]
      ribbon += l*w*h + 2*min(l+w, w+h, h+l)
   end
   return ribbon
end

println("Answer: $total_ribbon_length")
