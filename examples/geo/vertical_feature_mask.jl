using GLMakie, GeoMakie
using Downloads: download
using FileIO
GLMakie.activate!()
earth_img = load(download("https://upload.wikimedia.org/wikipedia/commons/5/56/Blue_Marble_Next_Generation_%2B_topography_%2B_bathymetry.jpg"))


ul= range(-1, 1, length=10)
vl= range(0, 0.75, length=8)
u= [s for t in vl, s in ul]
v= [t for t in vl, s in ul]

surface(u, v, v; color = 1 ./ v)

fig = Figure(resolution=(1200, 800), fontsize=22)
ax = LScene(fig[1,1])
lines!(ax, GeoMakie.coastlines())
lines!(ax, GeoMakie.coastlines()[95], color = :red, linewidth=5)
image!(ax, -180..180, -90..90, earth_img'[:,end:-1:1])
fig

length.(GeoMakie.coastlines())
findmax(length.(GeoMakie.coastlines()))

longpath = GeoMakie.coastlines()[95]
longpath[3]

linepath = Point3f[]
for p in longpath
    push!(linepath, Point3f(p[1]..., 0))
    push!(linepath, Point3f(p[1]..., 0))
end

linepathh = Point3f[]
for p in longpath
    push!(linepathh, Point3f(p[1]..., 20))
    push!(linepathh, Point3f(p[1]..., 20))
end

fig = Figure(resolution=(1200, 800), fontsize=22)
ax = LScene(fig[1,1])
lines!(ax, GeoMakie.coastlines())
lines!(ax, linepath, color = :red, linewidth=5)
lines!(ax, linepathh, color = :red, linewidth=5)
band!(ax, linepath, linepathh, color = repeat(1:1384,outer=2))
image!(ax, -180..180, -90..90, earth_img'[:,end:-1:1])
fig


fig = Figure(resolution=(1200, 800), fontsize=22)
ax = LScene(fig[1,1])
lines!(ax, linepath[1:100], color = :red, linewidth=5)
#lines!(ax, linepathh[1:100], color = :red, linewidth=5)
fig

xyz = linepath[1:10]
x = [x[1] for x in  xyz]
y = [y[2] for y in  xyz]
z = collect(1:10)
xa = [x for x in x, y in y]
ya = [y for y in y, x in x]
za = [z for z in z, x in x]

surface(xa, ya, rand(10,10); color =rand(10,10))