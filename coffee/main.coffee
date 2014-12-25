LEDRad=10
LEDlightRad=100

rgbString  = (r,g,b)   -> 
	"rgb(" +r.toString()+","+g.toString()+","+b.toString()+")"

rgbaString = (r,g,b,a) -> 
	"rgba("+r.toString()+","+g.toString()+","+b.toString()+","+a.toString()+")"

createLed = (context,x,y,r,g,b) ->
	this.x=x
	this.y=y
	this.LEDRad=LEDRad
	this.LEDlightRad=LEDlightRad
	this.draw = () ->
		radgrad = context.createRadialGradient(x,y,LEDRad,x,y,LEDlightRad)
		radgrad.addColorStop(0, rgbString(r,g,b))
		radgrad.addColorStop(0.025,
			rgbaString(r,g,b,0.5)
			)
		radgrad.addColorStop(1,rgbaString(r,g,b,0) )
		context.fillStyle = radgrad
		context.beginPath()
		context.arc(x,y,LEDlightRad,0,Math.PI*2,false)
		context.fill()
		return
	return

canvas = document.getElementById("canvas")
w=$("body").width()
h=$("body").height()
canvas.setAttribute("width",w.toString()+"px")
canvas.setAttribute("height",h.toString()+"px")
context = canvas.getContext("2d")
context.globalAlpha = .7

dark = true
bgR = 255
bgG = 255
bgB = 255
bgA = .0

if dark
	bgR = 0
	bgG = 0
	bgB = 0
	bgA = .9
LEDs = []
LEDs.push(
	new createLed(context,200,250,0  ,201,255),
	new createLed(context,250,350,255,150,0  ),
	new createLed(context,250,450,255,0  ,0  ),
	new createLed(context,400,400,0  ,255,0  ),

	)
drawCanvas= () -> 
	context.fillStyle = rgbString(bgR,bgG,bgB)
	context.beginPath()
	context.fillRect(0,0,w,h)


	context.globalCompositeOperation="darker"
	for i in LEDs
		context.globalAlpha=1
		i.draw()
dragLEDs= ()->

drawCanvas()

