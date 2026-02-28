using DrawingDim

set_dimstyle(decimals=2, unit_suffix=" mm")

println("Deviation tolerance:")
println(dim_tolerance(25.0; plus=0.10, minus=0.03))

println("Symmetric tolerance:")
println(dim_tolerance(25.0; plus=0.05))

println("Limits style:")
println(dim_limits(25.0, 24.95, 25.05))

set_dimstyle(decimals=3, unit_suffix=" in")
println("Imperial example:")
println(dim_limits(1.0, 0.998, 1.002))
