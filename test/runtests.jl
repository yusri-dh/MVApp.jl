using MVApp
using Test
include("test_utils_movement.jl")
@testset "MovingFrame.jl" begin
    test_standardize()
    test_gradient()
end
