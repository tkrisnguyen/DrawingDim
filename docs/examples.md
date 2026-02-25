# Examples Guide

Run examples from the package root:

```julia
julia --project=. examples/linear_aligned_angular.jl
julia --project=. examples/radial_diameter_ordinate.jl
julia --project=. examples/chain_and_jogged.jl
julia --project=. examples/formatters_example.jl
julia --project=. examples/iso_dimstyle_example.jl
```

## Example coverage

- `linear_aligned_angular.jl`: `DIMLINEAR`, `DIMALIGNED`, `DIMANGULAR`, `DIMARC`
- `radial_diameter_ordinate.jl`: `DIMCENTER`, `DIMRADIAL`, `DIMDIAMETER`, `DIMORDINATE`
- `chain_and_jogged.jl`: `DIMBASELINE`, `DIMCONTINUE`, `DIMJOGGED`
- `formatters_example.jl`: `DIMTOLERANCE`, `DIMLIMITS`
- `iso_dimstyle_example.jl`: ISO-style `DIMSTYLE` setup and mixed dimensions
