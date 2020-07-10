#!/bin/bash
#=
so_file="${MVApp_PATH}/MVApp_plus.so"
exec julia --color=no --project=$MVApp_PATH -J $so_file --startup-file=no "${BASH_SOURCE[0]}" "$@"
=#
using MVApp
MVApp.julia_main()  # put any Julia code here
