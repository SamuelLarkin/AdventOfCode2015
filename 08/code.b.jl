#!/usr/bin/env  julia


answer = open("input", "r") do f
   total_number_of_character_in_string = 0
   total_number_of_character_in_memory = 0
   for l in eachline(f)
      total_number_of_character_in_string += length(l)
      l = replace(l, r"\"" => "##")
      l = replace(l, raw"\\" => "**")
      println(l)
      total_number_of_character_in_memory += length(l) + 2
   end

   return total_number_of_character_in_memory - total_number_of_character_in_string
end


println("Answer: $answer")

# 2085
