struct Point2D
    x::Float64
    y::Float64
end

Point2D(p::Tuple{<:Real,<:Real}) = Point2D(float(p[1]), float(p[2]))

Base.:+(a::Point2D, b::Point2D) = Point2D(a.x + b.x, a.y + b.y)
Base.:-(a::Point2D, b::Point2D) = Point2D(a.x - b.x, a.y - b.y)
Base.:-(p::Point2D) = Point2D(-p.x, -p.y)
Base.:*(k::Real, p::Point2D) = Point2D(k * p.x, k * p.y)
Base.:*(p::Point2D, k::Real) = k * p
Base.:/(p::Point2D, k::Real) = Point2D(p.x / k, p.y / k)

norm2d(v::Point2D) = sqrt(v.x^2 + v.y^2)

distance(a::Point2D, b::Point2D) = norm2d(b - a)

dot2d(a::Point2D, b::Point2D) = a.x * b.x + a.y * b.y

cross2d(a::Point2D, b::Point2D) = a.x * b.y - a.y * b.x

function unit(v::Point2D)
    n = norm2d(v)
    n == 0 && throw(ArgumentError("Cannot normalize zero-length vector"))
    return v / n
end

perp(v::Point2D) = Point2D(-v.y, v.x)

midpoint(a::Point2D, b::Point2D) = Point2D((a.x + b.x) / 2, (a.y + b.y) / 2)

angle_of(v::Point2D) = atan(v.y, v.x)

function rotate(v::Point2D, θ::Real)
    c = cos(θ)
    s = sin(θ)
    return Point2D(c * v.x - s * v.y, s * v.x + c * v.y)
end
