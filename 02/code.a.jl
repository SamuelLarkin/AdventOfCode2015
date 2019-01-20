#!/usr/bin/env julia

open("input", "r") do f
   surface = 0
   for l in eachline(f)
      d = map(x -> parse(Int, x), split(l, "x"))
      l = d[1]
      w = d[2]
      h = d[3]
      surface += 2*l*w + 2*w*h + 2*h*l + min(l*w, w*h, h*l)
   end
   println("Answer: $surface")
end
