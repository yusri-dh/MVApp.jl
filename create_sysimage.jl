using PackageCompiler
# create_sysimage([:CSV,:DataFrames,:FileIO,:MeshIO,:GaussianProcesses,:GeometryBasics,:MVApp];precompile_execution_file="precompile_app.jl",sysimage_path="MVApp_plus.so")
create_sysimage([:CSV,:DataFrames,:FileIO,:MeshIO,:GaussianProcesses,:GeometryBasics,:MVApp];precompile_execution_file="precompile_app.jl")
