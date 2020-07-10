
using MVApp

data_folder = "/home/yusri/pCloudDrive/190612/0429/gc-50_0.2_1_0.2/"
main(data_folder,97,1,10)
main(data_folder,97,-1,-1)

# main(data_folder,95,1,10)
push!(ARGS, data_folder, "97","2","8")
MVApp.julia_main()

