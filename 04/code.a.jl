#!/usr/bin/env julia

using Nettle

function find_number(secret_key)
   for i = 1:100000000
      k = secret_key * string(i)
      md5sum = hexdigest("md5", k)
      if md5sum[1:5] == "00000"
         println("SUCCESS")
         return i
      end
   end
end

secret_key = "iwrupvqb"
answer = find_number(secret_key)
println("Answer: $answer")
# 346386
