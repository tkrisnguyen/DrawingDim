using DrawingDim
using Plots

set_dimstyle(text_height=8.0, arrow_size=3.0, decimals=1, unit_suffix=" mm", color=:black)

d1 = dim_linear((10.0, 10.0), (60.0, 10.0); orientation=:horizontal, offset=12)
d2 = dim_aligned((10.0, 20.0), (55.0, 38.0); offset=10)
d3 = dim_angular((30.0, 25.0), (60.0, 25.0), (50.0, 45.0); radius=14)
d4 = dim_arc((30.0, 25.0), (44.0, 25.0), (30.0, 39.0); radius=14)

plot(legend=false, aspect_ratio=:equal, title="Linear / Aligned / Angular / Arc")
plot!(d1)
plot!(d2)
plot!(d3)
plot!(d4)

display(current())
