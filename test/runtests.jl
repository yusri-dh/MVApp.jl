using MVApp
using Test
using GeometryBasics
using Statistics: mean, var, std

include("test_utils_movement.jl")
include("test_smoothing.jl")
include("test_shape.jl")

data_folder = "../data"
@testset "MovingFrame.jl" begin
    test_standardize()
    test_gradient()
    test_smoothing()
    test_shape()
end
