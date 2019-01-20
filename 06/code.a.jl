#!/usr/bin/env  julia

answer = open("input", "r") do f
   lights = falses(1000, 1000)
   for l in eachline(f)
      m = match(r"(turn on|turn off|toggle) (\d+),(\d+) through (\d+),(\d+)", l)
      if m === nothing
         println("ERROR")
      else
         x = parse(Int, m[2])+1
         y = parse(Int, m[3])+1
         a = parse(Int, m[4])+1
         b = parse(Int, m[5])+1
         #println("$x, $y   $a,$b")
         if m[1] == "turn on"
            lights[x:a, y:b] .= true
         elseif m[1] == "turn off"
            lights[x:a, y:b] .= false
         elseif m[1] == "toggle"
            lights[x:a, y:b] .⊻= true
         else
            println("Instruction error")
         end
      end
   end
   #lights = convert.(Int, lights)
   #@show lights
   return count(lights)
end

println("Answer: $answer")

# 543903
