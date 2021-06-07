# by lazarusA # HIDE
#using GLMakie, Random # HIDE
using CairoMakie, Random
CairoMakie.activate!() #HIDE
let
    Random.seed!(123)
    fig = Figure(resolution = (400, 427))
    ax = Axis(fig,  aspect = 1, xlabel = "x", ylabel = "y")
    hmap = heatmap!(rand(20,20), colormap = :CMRmap)
    cbar = Colorbar(fig, hmap, label = "values", height = 15, vertical = false,
                ticksize=15, tickalign = 1, width = Relative(3.55/4))
    fig[1, 1] = cbar
    fig[2, 1] = ax
    rowgap!(fig.layout, 7)
    fig
    save(joinpath(@__DIR__, "output", "heatmapCbarTop.png"), fig, px_per_unit = 2.0) # HIDE
end
using Pkg # HIDE
Pkg.status(["CairoMakie", "Random"]) # HIDE