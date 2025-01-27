using CairoMakie, LaTeXStrings, SpecialFunctions
CairoMakie.activate!(type = "svg") #hide

x = 0.1:0.1:15
cycle = Cycle([:color, :linestyle, :marker], covary = true)
set_theme!(Lines = (cycle = cycle,), Scatter = (cycle = cycle,))
fig = Figure(resolution = (600, 400), fonts = (; regular="CMU Serif")) ## probably you need to install this font in your system
ax = Axis(fig[1, 1], xlabel = L"x", ylabel = L"Y_{\nu}(x)", ylabelsize = 22,
    xlabelsize = 22, xgridstyle = :dash, ygridstyle = :dash, xtickalign = 1,
    xticksize = 10, ytickalign = 1, yticksize = 10, xlabelpadding = -10)
for ν in 0:4
    lines!(ax, x, bessely.(ν, x), label = latexstring("Y_{$(ν)}(x)"), linewidth = 2)
end
axislegend(; position = :rb, nbanks = 2, framecolor = (:grey, 0.5))
ylims!(-1.8, 0.7)
fig

# !!! warning 
# This example was autogenerated using:

using Pkg
Pkg.status(["CairoMakie", "LaTeXStrings", "SpecialFunctions"])