# DrawingDim

AutoCAD-style dimensioning utilities for Julia drawings, with direct support for `Plots.jl`.

## Current scope (MVP)

- `set_dimstyle` global style configuration
- `dim_linear` for horizontal/vertical linear dimensions
- `dim_aligned` for true-length aligned dimensions
- `dim_angular` for angle dimensions
- `dim_arc` for arc-length dimensions
- `dim_center` for center marks
- `dim_jogged` for jogged/broken linear dimensions
- `dim_radial` for radius dimensions
- `dim_diameter` for diameter dimensions
- `dim_ordinate` for x/y ordinate dimensions
- `dim_baseline` for baseline/stacked linear dimensions
- `dim_continue` for continued chain dimensions
- Rendering through `RecipesBase` so objects can be plotted directly in `Plots.jl`

## Install (local development)

```julia
using Pkg
Pkg.develop(path=".")
Pkg.instantiate()
```

## Quick start

```julia
using DrawingDim
using Plots

set_dimstyle(
	text_height = 8.0,
	arrow_size = 3.0,
	color = :black,
	unit_suffix = " mm",
	decimals = 1,
)

p1 = (10.0, 10.0)
p2 = (70.0, 25.0)

d1 = dim_linear(p1, p2; orientation=:horizontal, offset=15)
d2 = dim_aligned(p1, p2; offset=-10)
d3 = dim_angular((40.0, 40.0), (70.0, 40.0), (55.0, 62.0); radius=18)
d3b = dim_arc((40.0, 40.0), (58.0, 40.0), (40.0, 58.0); radius=18)
dcenter = dim_center((40.0, 40.0); size=10)
djog = dim_jogged((10.0, 30.0), (70.0, 30.0); orientation=:horizontal, offset=12, jog_size=5)
d4 = dim_radial((40.0, 40.0), (58.0, 40.0); offset=8)
d5 = dim_diameter((40.0, 40.0), (40.0, 58.0))
d6 = dim_ordinate((70.0, 25.0); axis=:x, origin=(0.0, 0.0), offset=10, tol_plus=0.2, tol_minus=0.1)
dbase = dim_baseline((10.0, 10.0), (30.0, 10.0), (50.0, 10.0); orientation=:horizontal, offset=20)
dcont = dim_continue((10.0, 20.0), (30.0, 20.0), (50.0, 20.0); orientation=:horizontal, offset=5)

plot(legend=false, aspect_ratio=:equal)
plot!(d1)
plot!(d2)
plot!(d3)
plot!(d3b)
plot!(dcenter)
plot!(djog)
plot!(d4)
plot!(d5)
plot!(d6)
plot!(dbase)
plot!(dcont)
```

## API summary

### Styles

- `DimStyle(; kwargs...)`
- `set_dimstyle(; kwargs...)` (sets active style)
- `current_dimstyle()`
- `dimstyle!(style)`
- `reset_dimstyle!()`

Important style options:

- `arrowhead_style` (`:closed_filled`, `:closed`, `:closed_blank`, `:open`, `:open30`, `:open90`, `:open_out`, `:open30_out`, `:open90_out`, `:small_open`, `:oblique`, `:tick`, `:dot`, `:dot_small`, `:hook`, `:none`)
- `text_font` (GR-safe default: `"Helvetica"`)
- `text_orientation` (`:aligned`, `:horizontal`, `:vertical`)
- `text_placement` (`:above`, `:below`, `:centered`)
- `fit_mode` (`:best`, `:text_inside`, `:text_outside`)
- `hand_drawn` (`true`/`false`) and `hand_drawn_amplitude`, `hand_drawn_wiggles`
- `tolerance_mode` (`:symmetric`, `:deviation`, `:none`)

Preferred style example:

```julia
set_dimstyle(
	arrowhead_style=:small_open,
	text_font="Helvetica",
	text_orientation=:aligned,
	text_placement=:above,
	fit_mode=:best,
	hand_drawn=false,
	tolerance_mode=:symmetric,
	tolerance_plus=0.05,
)
```

Color note: use `color=:black` (or any symbol/color supported by your backend) in `set_dimstyle` to force all lines/arrows/text to a single color.

### Tolerance formatter

- `dim_tolerance(value; plus=nothing, minus=nothing, style=current_dimstyle())`

Example:

```julia
set_dimstyle(decimals=2, unit_suffix=" mm", tolerance_mode=:deviation, tolerance_plus=0.05, tolerance_minus=0.02)
dim_tolerance(25.0)                     # "25.0 mm +0.05 mm/-0.02 mm"
dim_tolerance(25.0; plus=0.1)          # "25.0 mm ±0.1 mm"
dim_tolerance(25.0; plus=0.1, minus=0.03)
```

### Limits formatter

- `dim_limits(nominal, lower, upper; style=current_dimstyle())`

Limit-style dimensions return a compact `upper / lower` string.

```julia
set_dimstyle(decimals=2, unit_suffix=" mm")
dim_limits(25.0, 24.95, 25.05)         # "25.05 mm / 24.95 mm"
dim_limits(10.0, 9.8, 10.2)
```

### Dimension constructors

- `dim_linear(p1, p2; orientation=:auto, offset=10.0, text=nothing, tol_plus=nothing, tol_minus=nothing, style=current_dimstyle())`
- `dim_aligned(p1, p2; offset=10.0, text=nothing, tol_plus=nothing, tol_minus=nothing, style=current_dimstyle())`
- `dim_angular(vertex, p1, p2; radius=20.0, text=nothing, tol_plus=nothing, tol_minus=nothing, style=current_dimstyle())`
- `dim_arc(center, p1, p2; radius=nothing, text=nothing, tol_plus=nothing, tol_minus=nothing, style=current_dimstyle())`
- `dim_center(center; size=10.0, style=current_dimstyle())`
- `dim_jogged(p1, p2; orientation=:auto, offset=10.0, jog_size=6.0, jog_fraction=0.12, text=nothing, tol_plus=nothing, tol_minus=nothing, style=current_dimstyle())`
- `dim_radial(center, point; offset=10.0, text=nothing, tol_plus=nothing, tol_minus=nothing, style=current_dimstyle())`
- `dim_diameter(center, point; text=nothing, tol_plus=nothing, tol_minus=nothing, style=current_dimstyle())`
- `dim_ordinate(point; axis=:x, origin=(0.0, 0.0), offset=10.0, text=nothing, tol_plus=nothing, tol_minus=nothing, style=current_dimstyle())`
- `dim_baseline(base_point, points...; orientation=:auto, offset=10.0, tol_plus=nothing, tol_minus=nothing, style=current_dimstyle())`
- `dim_continue(start_point, points...; orientation=:auto, offset=10.0, tol_plus=nothing, tol_minus=nothing, style=current_dimstyle())


All points can be passed as `(x, y)` tuples or `Point2D`.

## Notes

- This package currently focuses on 2D dimension graphics and annotation.
- Commands follow Julia naming conventions with snake_case for functions (e.g., `dim_linear`, `dim_aligned`, `dim_angular`).
- Future extensions can add radial/diameter/ordinate dimensions, tolerances, and richer style tables.

## More docs and examples

- Documentation entry: `docs/index.md`
- Command reference: `docs/commands.md`
- Formatter reference: `docs/formatters.md`
- Examples guide: `docs/examples.md`
- Registry registration guide: `docs/registration.md`

Runnable examples:

- `examples/linear_aligned_angular.jl`
- `examples/radial_diameter_ordinate.jl`
- `examples/chain_and_jogged.jl`
- `examples/formatters_example.jl`
- `examples/iso_dimstyle_example.jl`
