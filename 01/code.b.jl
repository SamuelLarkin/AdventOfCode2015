#!/usr/bin/env julia

open("input", "r") do f
   a = 0
   for (il, l) in enumerate(eachline(f))
      for (ib, b) in enumerate(l)
         if b == '('
            a = a + 1
         else
            a = a - 1
         end
         println(a)
         if a == -1
            println("Answer: $ib")
            return
         end
      end
   end
end
