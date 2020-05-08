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
using MeshIO
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
# function real_main()
#     data_folder = ARGS[1];
#     track_id = parse(Int,ARGS[2]);
#     t_start = parse(Int,ARGS[3]);
#     t_end = parse(Int,ARGS[4]);
#     main(data_folder,track_id,t_start,t_end)
# end
function julia_main()
    try
        data_folder = ARGS[1];
        track_id = parse(Int,ARGS[2]);
        t_start = parse(Int,ARGS[3]);
        t_end = parse(Int,ARGS[4]);
        main(data_folder,track_id,t_start,t_end)
    catch
        Base.invokelatest(Base.display_error, Base.catch_stack())
        return 1
    end
    return 0
end

if abspath(PROGRAM_FILE) == @__FILE__
    julia_main()
end
end # module
