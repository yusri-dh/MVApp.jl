using MVApp
if length(ARGS) >= 4
    MVApp.julia_main()
else
    println("Input must be start timepoint, end timepoint, and cell IDs")
end
