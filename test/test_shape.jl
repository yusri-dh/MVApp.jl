function test_shape()
    cell = load_mesh(joinpath(data_folder,"cell.obj"))
    new_cell = mesh_centering(cell)
    @test all(faces(cell) .== faces(new_cell))
    new_centroid = convert(Vector{Float64},mean(coordinates(new_cell)))
    @test isapprox(new_centroid, [0., 0., 0.],atol =0.0001)
    new_cell2 = volume_normalizing(cell)
    @test all(faces(cell) .== faces(new_cell2))
    @test isapprox(mesh_volume(new_cell2), 1.0,atol =0.0001)
end
