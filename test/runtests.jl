using BenchmarkTools
using FileIO, CSVFiles

#System benchmarks
@info "Running system benchmarks -------"
@info "CPU"
run(`sysbench --test=cpu run`)
@info "Memory"
run(`sysbench --test=memory run`)
@info "Fileio"
run(`sysbench --test=fileio --file-test-mode=seqwr run`)



# Julia benchmarks
@info "Running julia benchmarks --------"
@info "CPU"
x = rand(100,100)
@btime $x .^ 2

@info "Memory"
x = rand(100_000_000)
@btime deepcopy($x)

@info "Fileio"
x = rand(100_000_000)
save("test.csv", x)
@btime load("test.csv")
