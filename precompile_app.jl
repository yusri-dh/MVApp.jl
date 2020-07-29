
using MVApp

data_folder = "data/0429"
main(data_folder,97,1,10)
main(data_folder,97,-1,-1)

# main(data_folder,95,1,10)
push!(ARGS, data_folder, "1","10", "97", "56")
MVApp.julia_main()

