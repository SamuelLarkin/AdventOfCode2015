function parse(number)
   count = 0
   previous_digit = undef
   new_number = ""
   for l in number
      if previous_digit === undef
         count += 1
         previous_digit = l
      elseif l == previous_digit
         count += 1
      else
         new_number *= string(count) * previous_digit
         previous_digit = l
         count = 1
      end
   end
   new_number *= string(count) * previous_digit

   return new_number
end
