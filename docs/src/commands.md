```@meta
CurrentModule = DrawingDim
```

# Command Reference

`DrawingDim` provides AutoCAD-style commands:

- `DIMSTYLE`
- `DIMLINEAR`, `DIMALIGNED`, `DIMANGULAR`, `DIMARC`
- `DIMCENTER`, `DIMJOGGED`
- `DIMRADIAL`, `DIMDIAMETER`, `DIMORDINATE`
- `DIMBASELINE`, `DIMCONTINUE`

## Arrow styles

- `:closed_filled`
- `:closed`
- `:open`
- `:small_open`
- `:hook`
- `:tick`
- `:dot`
- `:none`

## Text behavior

- `text_orientation`: `:aligned`, `:horizontal`, `:vertical`
- `text_placement`: `:above`, `:below`, `:centered`
- `fit_mode`: `:best`, `:text_inside`, `:text_outside`
