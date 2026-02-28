module DrawingDim

include("geometry.jl")
include("styles.jl")
include("dimensions.jl")
include("recipes.jl")

export Point2D
export DimStyle, set_dimstyle, dimstyle!, current_dimstyle, reset_dimstyle!
export LinearDimension, AlignedDimension, AngularDimension, ArcDimension, CenterDimension, JoggedDimension, RadialDimension, DiameterDimension, OrdinateDimension
export dim_linear, dim_aligned, dim_angular, dim_arc, dim_center, dim_jogged, dim_radial, dim_diameter, dim_ordinate, dim_baseline, dim_continue
export dim_tolerance
export dim_limits
export measure

end
