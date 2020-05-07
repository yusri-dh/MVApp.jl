function test_standardize()
    mat1 = [0. 0.; 0. 0.; 1. 1.; 1. 1.]
    mat2 = [-1. -1.; -1. -1.; 1. 1.; 1. 1.]
    @test isapprox(MVApp.standardize(mat1), mat2)
    @test isapprox(MVApp.reverse_standardization(mat2,mat1),mat1)
end

function test_gradient()
    vec = [1., 2., 4., 7., 11., 16.]
    res = [1. , 1.5, 2.5, 3.5, 4.5, 5. ]
    @test isapprox(MVApp.gradient(vec), res)
    mat = [1. 2. 6.; 3. 4. 5.]
    res2 = [2.0  2.0  -1.0;2.0  2.0  -1.0]
    @test isapprox(MVApp.gradient(mat), res2)
end
