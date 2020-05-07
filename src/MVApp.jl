module MVApp

using LinearAlgebra
using Statistics: mean, var, std
using GaussianProcesses
using GeometryBasics
# using GSL
# using PyCall
# using SparseArrays
using DataFrames
using CSV
using FileIO: load, save
include("./utils_movement.jl")
export standardize, reverse_standardization
include("./smoothing.jl")
export Smoother, GaussianProcessSmoother, smoothing, fit, predict
include("./frenet_serret.jl")
export frenet_serret
include("./parallel_transport.jl")
export parallel_transport
include("utils_shape.jl")
export mesh_centering,
    volume_normalizing,
    mesh_volume,
    create_mesh,
    centroid,
    internal_angles,
    double_surface_area,
    surface_area
include("moving_cells.jl")
export mesh_reorientation,
    MovingCells, get_cell, add_moving_frame_data!, add_shape_data!

include("fileIO.jl")
export load_mesh, save_mesh, create_group_df

include("main.jl")
export main
end # module
