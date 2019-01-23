#!/usr/bin/env  julia

include("parse.jl")


start = open("input", "r") do f
   return readline(f)
end


if false
   n = "1"
   for i in 1:5
      global n
      n = parse(n)
      println(n)
   end
end

n = start
for i in 1:40
   global n
   n = parse(n)
end

println("Answer: ", length(n))

# 329356
