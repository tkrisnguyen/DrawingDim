using DrawingDim
using Plots

set_dimstyle(text_height=8.0, arrow_size=3.0, decimals=2, unit_suffix=" mm", color=:black)

dc = dim_center((40.0, 40.0); size=10)
dr = dim_radial((40.0, 40.0), (56.0, 40.0); offset=8)
dd = dim_diameter((40.0, 40.0), (40.0, 56.0))
dx = dim_ordinate((70.0, 35.0); axis=:x, origin=(0.0, 0.0), offset=12)
dy = dim_ordinate((70.0, 35.0); axis=:y, origin=(0.0, 0.0), offset=12)

plot(legend=false, aspect_ratio=:equal, title="Center / Radial / Diameter / Ordinate")
plot!(dc)
plot!(dr)
plot!(dd)
plot!(dx)
plot!(dy)

display(current())
