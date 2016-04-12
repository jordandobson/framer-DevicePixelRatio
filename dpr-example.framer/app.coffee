##############################################################################
# Created on 23 DEC 2015 by Jordan Dobson / @jordandobson / jordan@brothe.rs 
# Updated on 12 APR 2016 by Jordan Dobson
##############################################################################
# More info on FramerCode @ http://jrdn.io/1z0o451b031k
# More info on GitHub @ http://jrdn.io/ffkn
##############################################################################
# NOTE:
# * Try Changing the device you view it on and see it adjust.
# * This device in Framer Studio is 3x try it on a 2x device & see it adjust.
##############################################################################

# Add the Module
{dpr} = require 'DevicePixelRatio'

Screen.backgroundColor = "#fff"

# ------------------------------------------------------------------------------
# Add a Scroller

scroller = new ScrollComponent
	width:  Screen.width
	height: Screen.height
	scrollHorizontal: false

# ------------------------------------------------------------------------------
# Add Rows to the Scroller
		
for rowIndex in [0..30]

	# Add a row w/ the height & text sizing/layout using dpr()
	row = new Layer
		name: "row-#{rowIndex}"
		parent: scroller.content
		y: (dpr 44) * rowIndex
		width: Screen.width
		height: dpr 44
		html: "List Item #{rowIndex}"
		backgroundColor: "#fff"
		color: "#000"
		style: 
		  font: "400 #{dpr 14}px/#{dpr 42}px -apple-system, Helvetica Neue"
		  textIndent: "#{dpr 15}px"
		  boxShadow: "inset 0 -1px 0 #c8c7cc"
		  
	# Add a chevron with the size, right margin & shadow stroke using dpr() 
	chevron = new Layer
		name: "chevron-#{rowIndex}"
		superLayer: row
		width:  dpr 9
		height: dpr 9
		y:    row.height / 2
		maxX: row.width - dpr 15
		originX: 1
		originY: 0
		rotation: 45
		backgroundColor: ""
		style:
			boxShadow: "inset -#{dpr 2}px #{dpr 2}px 0 #c7c7cc"

# ------------------------------------------------------------------------------
# Update the Scroller to handle all the rows

scroller.updateContent()
