module MVApp

using LinearAlgebra
using Statistics: mean, var, std
using GaussianProcesses
# using GeometryBasics
# using GSL
# using PyCall
# using SparseArrays
# using DataFrames
# using CSV
# using FileIO: load, save
include("./utils_movement.jl")
export standardize,reverse_standardization
include("./smoothing.jl")
export Smoother, GaussianProcessSmoother, smoothing, fit, predict
end # module
