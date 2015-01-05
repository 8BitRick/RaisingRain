canvas = document.getElementById("myCanvas")
c = canvas.getContext("2d")

# Simple helper functions
decimalToHex = (d, padding) ->
  hex = Number(Math.round(d)).toString(16)
  hex = "0" + hex while (hex.length < padding)
  hex

# Our 2D Drawing Environment
whole_canvas = [0,0,canvas.width, canvas.height]
max_y = canvas.height

# Our 3D Environment
ra_radius = 5
ra_height = 10
ws_bbox = [[-ra_radius, 0, -ra_radius],[ra_radius, ra_height, ra_radius]]

# 2D/3D transforms
ra_xrange = ws_bbox[1][0] - ws_bbox[0][0]
x_per = (val) ->  (val - ws_bbox[0][0]) / ra_xrange
x_trans = (val) -> x_per(val) * canvas.width # X range is canvas width
y_trans = (val) -> (1-val/ra_height) * max_y # Y range is canvas height
z_trans = (val) -> x_per(val) * 9 + 1 # Z range is 1 to 10
draw_trans = (val) -> {x: x_trans(val.x), y: y_trans(val.y), z: z_trans(val.z)}

# Functions to calculate the "fall" rate of our rects
# They are just different experimental rates I tried
fall1 = (temp) -> Math.pow(2,(temp/6-10))*6
fall2 = (temp) -> Math.pow(2,(temp/6-3))*6+1
fall3 = (temp) -> Math.pow((temp+50)/30,3)+1
fall4 = (temp) -> fall3(temp) * ra_height / max_y
fall5 = (temp) -> fall4(temp) * 0.1

# Rectangle initialization and updating
xs = -> Math.random() * ra_radius * 2 - ra_radius
ys = () -> Math.random() * ra_height * 0.3
zs = -> Math.random() * ra_radius * 2 - ra_radius
delay_s = () -> Math.random() * 60
new_rect = () -> {delay: delay_s(), counter: 0, rate: 0, x: xs(), y: ys(), z: zs()}
reset_rect = (r) -> r.delay=delay_s(); r.counter=0; r.rate=0; r.x=xs(); r.y=ys(); r.z=zs()
update_rect = (r) ->
  if r.delay > 0
    r.delay--
  else
    ds_pos = draw_trans(r) # transform from 3D space to drawing space
    c.fillStyle = "#0000" + decimalToHex(ds_pos.z*20,2) # make closer rects brighter
    c.fillRect(ds_pos.x, ds_pos.y, 1*ds_pos.z, 8*ds_pos.z) # make closer rects bigger
    r.counter++; r.rate = fall4(r.counter); r.y += r.rate
    reset_rect(r) if r.y > ra_height

# Clean the screen function
cls = () ->
  c.fillStyle = 'black'
  c.fillRect.apply(c, whole_canvas)

# Our array of falling objects
num_rects = 55
rects = (new_rect() for [0...num_rects])

console.log("Number of rects " + rects.length)

render = ->
  cls()
  rects.sort((a,b) -> a.z - b.z) # Z sorting (inefficient - we are z sorting all rects every frame)
  rects.forEach (r) -> update_rect(r)

setInterval(render,30);
