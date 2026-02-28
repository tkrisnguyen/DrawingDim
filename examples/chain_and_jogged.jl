using DrawingDim
using Plots

set_dimstyle(text_height=8.0, arrow_size=3.0, decimals=1, unit_suffix=" mm", color=:black)

dbase = dim_baseline((10.0, 10.0), (30.0, 10.0), (50.0, 10.0), (70.0, 10.0); orientation=:horizontal, offset=14)
dcont = dim_continue((10.0, 24.0), (30.0, 24.0), (50.0, 24.0), (70.0, 24.0); orientation=:horizontal, offset=6)
djog = dim_jogged((10.0, 38.0), (70.0, 38.0); orientation=:horizontal, offset=10, jog_size=5)

plot(legend=false, aspect_ratio=:equal, title="Baseline / Continue / Jogged")
plot!(dbase)
plot!(dcont)
plot!(djog)

display(current())
