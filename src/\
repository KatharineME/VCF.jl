+++ 
date = "2021-01-28"
title = "Julia"
slug = "julia"
tags = []
categories = []
+++

![julia](/images/julia_banner.png)

## Why Learn Julia? What are the Value Propositions?

- A combination of Python's usability and C++ speed.
    - Writing a prototype of code in Python, only to later implement it in C++ for speed is a waste.
    - Now these strengths are in one language.
- Focus is on scientific computing
- Readable
    - Designed to be easy to understand. 
- Multiple Dispatch
- Asynchronous I/O
- Compiled
- Dynamic
    - Meaning you don't have to define data types, Julia will do that for you.
    - However you have the option of defining them if you want.
- Developed for parallel processing.
- No dependencies on other languages.
    - However, Julia can call other languages easily. 
- Includes math and data science symbols.
    - So an equation can become a line of code.
- Optional arguments in functions.
- Functions can be combined.

_The words that we have available change what we will do._

## Weaknesses
- Just in time compilation
    - Although its also a strength.
    - When you run something for the first time it will take surprisingly long to run.
    - This is because all the julia code you're calling (including julia that you called / included) get compiled into a static julia (like C++ which is static from the start). 
    - However, after the compilation is done, it is super fast.
    - The work-around for this is to keep your Julia session running.


## History

- Launched in 2012


## Key Packages

- DataFrames.jl
- Plots.jl
- 

## Concepts

Macro
- A macro takes in code (a julia expression) as input and spits out code (a different julia expression). So, a macro is a code generator.


#### Tuple
Built in data structure with __fixed-length__ that can hold __any values__ but cannot be changed (__immutable__)

```julia
julia > x = (2, "soy sauce", "mirin")

(2, "soy sauce", "mirin")
```

```julia
julia > x[2]

"soy sauce"
```

#### Named Tuple
Elements in tuple can be given names. If so, then its a named tuple. Allowd you to access via names.

```julia
julia > x = (protein="beef", carb="rice")

(protein = "beef", carb = "rice")
```

```julia
julia > x[:protein]

"beef"
```

### Core Essentials

__Core.Array__: N-dimensional dense array with elements of type T

```julia
julia > Array{T, N}
```

### Base Essentials

__Base.vcat__: concatenate along 1 dimension

```julia
julia > a = [1 2 3]
julia > b = [4 5 6; 7 8 9]
julia > vcat(a,b)

3×3 Array{Int64,2}:
 1  2  3
 4  5  6
 7  8  9
```


