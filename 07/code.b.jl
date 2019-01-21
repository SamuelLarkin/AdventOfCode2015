#!/usr/bin/env julia

# [Dynamic Variable Names](https://www.rosettacode.org/wiki/Dynamic_variable_names#Julia)


deps = open("input", "r") do f
   deps = Dict{Symbol,Expr}()
   for l in eachline(f)
      #println(l)
      m = match(r"(\d+) AND (\w+) -> (\w+)", l)
      if m !== nothing
         #println("AND ($l)")
         d1 = parse(Int16, m[1])
         d2 = Symbol(m[2])
         t  = Symbol(m[3])
         deps[t] = :($t = $d1 & $d2)
         continue
      end

      m = match(r"(\w+) AND (\w+) -> (\w+)", l)
      if m !== nothing
         #println("AND ($l)")
         d1 = Symbol(m[1])
         d2 = Symbol(m[2])
         t  = Symbol(m[3])
         deps[t] = :($t = $d1 & $d2)
         continue
      end

      m = match(r"(\w+) OR (\w+) -> (\w+)", l)
      if m !== nothing
         #println("OR ($l)")
         d1 = Symbol(m[1])
         d2 = Symbol(m[2])
         t  = Symbol(m[3])
         deps[t] = :($t = $d1 | $d2)
         continue
      end

      m = match(r"(\w+) LSHIFT (\d+) -> (\w+)", l)
      if m !== nothing
         #println("LSHIFT ($l)")
         d1 = Symbol(m[1])
         d2 = parse(Int16, m[2])
         t  = Symbol(m[3])
         deps[t] = :($t = $d1 << $d2)
         continue
      end

      m = match(r"(\w+) RSHIFT (\d+) -> (\w+)", l)
      if m !== nothing
         #println("RSHIFT ($l)")
         d1 = Symbol(m[1])
         d2 = parse(Int16, m[2])
         t  = Symbol(m[3])
         deps[t] = :($t = $d1 >>> $d2)
         continue
      end

      m = match(r"NOT (\w+) -> (\w+)", l)
      if m !== nothing
         #println("NOT ($l)")
         d = Symbol(m[1])
         t = Symbol(m[2])
         deps[t] = :($t = ~$d)
         continue
      end

      m = match(r"(\d+) -> (\w+)", l)
      if m !== nothing
         #println("A ($l)")
         d = parse(Int16, m[1])
         t = Symbol(m[2])
         deps[t] = :($t = $d)
         continue
      end

      m = match(r"(\w+) -> (\w+)", l)
      if m !== nothing
         println("B ($l)")
         d = Symbol(m[1])
         t = Symbol(m[2])
         deps[t] = :($t = $d)
         continue
      end

      println("PARSE ERROR: $l")
   end
   println(deps)
   return deps
end

deps[Symbol("b")] = :(b = 16076)


answer = open("input.tsorted", "r") do f
   for l in eachline(f)
      println(l, "=>", deps[Symbol(l)])
      #dump(deps[Symbol(l)])
      eval(deps[Symbol(l)])
   end
   eval(Symbol("a"))
   return a
end


println("Answer: $answer")
# 2797
