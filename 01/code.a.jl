#!/usr/bin/env julia

open("input", "r") do f
   a = 0
   for l in eachline(f)
      for b in l
         println(b)
         if b == '('
            a = a + 1
         else
            a = a - 1
         end
      end
   end
   print("Answer:", a, "\n")
end
