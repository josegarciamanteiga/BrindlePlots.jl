
const dir = abspath( splitdir(@__FILE__)[1] )
unshift!( LOAD_PATH, dir * "/../src" )

using Base.Test
using BrindlePlots
using BufferedStreams

@testset "Basic Single Plot" begin

   delta = BufferedInputStream(IOBuffer("Gene\tNode\tBlank\nENSG00000117448.13_2\t10\tblank\n"))
   samples = ["test.psi.gz", "test2.psi.gz"]
   tabs = load_tables( map(x->"$dir/$x", samples) )
   @test make_plots( delta, tabs, samples, "testplot" ) == true 

end
