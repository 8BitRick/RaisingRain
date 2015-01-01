canvas = document.getElementById("myCanvas")
c = canvas.getContext("2d")

# Our Environment
whole_canvas = [0,0,canvas.width, canvas.height]
max_y = canvas.height

# Our main falling thing
normal_rect = [10, 20]
normal_style = "#0000AA"

# Operations to do stuff
fall1 = (temp) -> Math.pow(2,(temp/6-10))*6
fall2 = (temp) -> Math.pow(2,(temp/6-3))*6+1
fall3 = (temp) -> Math.pow((temp+50)/30,3)+1
xs = () -> Math.random() * canvas.width
ys = () -> max_y - (Math.random() * canvas.height * 0.3)
delay_s = () -> Math.random() * 60
new_rect = () -> {delay: delay_s(), counter: 0, rate: 0, x: xs(), y: ys()}

reset_rect = (r) -> r.delay=delay_s(); r.counter=0; r.rate=0; r.x=xs(); r.y=ys()
update_rect = (r) ->
  if r.delay > 0
    r.delay--
  else
    c.fillRect(r.x, r.y, 2, 8)
    r.counter++; r.rate = fall3(r.counter); r.y -= r.rate
    reset_rect(r) if r.y < 0

cls = () ->
  c.fillStyle = 'black'
  c.fillRect.apply(c, whole_canvas)

# Our array of falling objects
num_rects = 55
rects = (new_rect() for [0...num_rects])

console.log("blah" + rects.length)

render = ->
  cls()
  c.fillStyle = "#0000AA"
  rects.forEach (r) -> update_rect(r)

setInterval(render,30);
