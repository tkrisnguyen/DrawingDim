module DrawingDim

include("geometry.jl")
include("styles.jl")
include("dimensions.jl")
include("recipes.jl")

export Point2D
export DimStyle, DIMSTYLE, dimstyle!, current_dimstyle, reset_dimstyle!
export LinearDimension, AlignedDimension, AngularDimension, ArcDimension, CenterDimension, JoggedDimension, RadialDimension, DiameterDimension, OrdinateDimension
export DIMLINEAR, DIMALIGNED, DIMANGULAR, DIMARC, DIMCENTER, DIMJOGGED, DIMRADIAL, DIMDIAMETER, DIMORDINATE, DIMBASELINE, DIMCONTINUE
export DIMTOLERANCE
export DIMLIMITS
export measure

end
