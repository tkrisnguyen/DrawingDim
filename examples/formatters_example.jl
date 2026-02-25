using DrawingDim

DIMSTYLE(decimals=2, unit_suffix=" mm")

println("Deviation tolerance:")
println(DIMTOLERANCE(25.0; plus=0.10, minus=0.03))

println("Symmetric tolerance:")
println(DIMTOLERANCE(25.0; plus=0.05))

println("Limits style:")
println(DIMLIMITS(25.0, 24.95, 25.05))

DIMSTYLE(decimals=3, unit_suffix=" in")
println("Imperial example:")
println(DIMLIMITS(1.0, 0.998, 1.002))
