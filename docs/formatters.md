# Formatters

## DIMTOLERANCE
Create tolerance-style text for dimension annotations.

```julia
DIMSTYLE(decimals=2, unit_suffix=" mm")
DIMTOLERANCE(25.0; plus=0.10, minus=0.03)  # 25.0 mm +0.1 mm/-0.03 mm
DIMTOLERANCE(25.0; plus=0.05)              # 25.0 mm ±0.05 mm
```

If `plus` and `minus` are omitted, style tolerance settings are used.

```julia
DIMSTYLE(tolerance_mode=:deviation, tolerance_plus=0.05, tolerance_minus=0.02)
DIMTOLERANCE(25.0)                          # 25.0 +0.05/-0.02 (with style units/decimals)
```

## DIMLIMITS
Create limits-style notation as `upper / lower`.

```julia
DIMSTYLE(decimals=2, unit_suffix=" mm")
DIMLIMITS(25.0, 24.95, 25.05)               # 25.05 mm / 24.95 mm
```

Validation rules:

- `lower <= upper`
- `nominal` must be in `[lower, upper]`
