function _save_shapes!(shapes::Vector{<:Mesh}, dir_name)
    for i in eachindex(shapes)
        fname = "t" * string(i) * ".ply"
        shape = shapes[i]
        save_mesh(joinpath(dir_name, fname), shape)
    end
    0
end

function main(data_folder::String, track_id::Int, t_start::Int, t_end::Int)
    t0 = convert(Float64, t_start)
    t1 = convert(Float64, t_end)
    df = create_group_df(data_folder)
    cell = get_cell(df, track_id; t0 = t0, t1 = t1)
    coordinate = cell.coordinates
    length_step = 0.01
    add_moving_frame_data!(cell, step = length_step)
    selected_df =
        filter(row -> (row.trackid == track_id) & (t0 <= row.t <= t1), df)
    shape_folder = joinpath(data_folder, "shape")
    add_shape_data!(cell, selected_df, data_dir = shape_folder)
    str_t0::String = string(t0)
    str_t1::String = string(t1)
    str_id::String = string(track_id)

    dir_name = "movement_analysis" * "_" * str_id * "_" * str_t0 * "-" * str_t1
    dir_name = joinpath(data_folder, dir_name)
    if !isdir(dir_name)
        mkdir(dir_name)
    end
    movement_df = DataFrame(
        x = cell.smooth_coordinates[:, 1],
        y = cell.smooth_coordinates[:, 2],
        z = cell.smooth_coordinates[:, 3],
        time = cell.smooth_time,
        T = matrix_to_array_of_array(cell.T),
        N = matrix_to_array_of_array(cell.N),
        B = matrix_to_array_of_array(cell.B),
        curvature = cell.curvature,
        torsion = cell.torsion,
        speed = cell.speed,
    )
    fname = joinpath(dir_name, "result.csv")
    CSV.write(fname, movement_df)


    ori_dir_name =
        "original_shapes" * "_" * str_id * "_" * str_t0 * "-" * str_t1
    ori_dir_name = joinpath(data_folder, ori_dir_name)
    if !isdir(ori_dir_name)
        mkdir(ori_dir_name)
    end
    reori_dir_name =
        "reoriented_shapes" * "_" * str_id * "_" * str_t0 * "-" * str_t1
    reori_dir_name = joinpath(data_folder, reori_dir_name)
    if !isdir(reori_dir_name)
        mkdir(reori_dir_name)
    end
    _save_shapes!(cell.original_shapes, ori_dir_name)
    _save_shapes!(cell.reoriented_shapes, reori_dir_name)
    return 0
end
