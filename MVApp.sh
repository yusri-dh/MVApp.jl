#!/bin/bash
#=
exec julia --color=no --project --startup-file=no "${BASH_SOURCE[0]}" "$@"
=#
using MVApp
MVApp.julia_main()  # put any Julia code here
