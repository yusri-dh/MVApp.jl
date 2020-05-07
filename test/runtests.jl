using MVApp
using Test
include("test_utils_movement.jl")
include("test_smoothing.jl")

@testset "MovingFrame.jl" begin
    test_standardize()
    test_gradient()
    test_smoothing()
end
