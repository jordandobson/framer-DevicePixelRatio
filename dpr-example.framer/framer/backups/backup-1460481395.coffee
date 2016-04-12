##############################################################################
# Created on 23 DEC 2015 by Jordan Dobson / @jordandobson / jordan@brothe.rs  
##############################################################################
# More info on FramerCode @ http://jrdn.io/1z0o451b031k 
##############################################################################
# NOTE:
# * Try Changing the device you view it on and see it adjust.
# * This device in Framer Studio is 3x try it on a 2x device & see it adjust.
##############################################################################

# Add the Module and setup a background color

{dpr} = require 'DevicePixelRatio'

bg = new BackgroundLayer backgroundColor: "#c8c7cc"

# ------------------------------------------------------------------------------
# Add a list row w/ the height & text sizing/layout using dpr()


    
# ------------------------------------------------------------------------------
# Add a chevron with the size, right margin & shadow stroke using dpr()

listChevron = new Layer
	name: "chevron"
	superLayer: listRow
	width:  dpr 9
	height: dpr 9
	y:    listRow.height / 2
	maxX: listRow.width - dpr 15
	originX: 1
	originY: 0
	rotation: 45
	backgroundColor: ""
	style:
		boxShadow: "inset -#{dpr 2}px #{dpr 2}px 0 #c7c7cc"

# ------------------------------------------------------------------------------
# Add a Scroller

scroller = new ScrollComponent
	width:  Screen.width
	height: Screen.height
	scrollHorizontal: false
scroller.content.backgroundColor = "#fff"

listRow.superLayer = scroller.content

# ------------------------------------------------------------------------------
# Add More Rows
		
for rowIndex in [1..30]
	row listRow = new Layer
  name: "row"
  width: Screen.width
  height: dpr 44
  html: "List Item"
  backgroundColor: "#fff"
  color: "#000"
  style: 
    font: "400 #{dpr 14}px/#{dpr 42}px -apple-system, Helvetica Neue"
    textIndent: "#{dpr 15}px"
    boxShadow: "inset 0 -1px 0 #c8c7cc"
	chevron = row.subLayersByName("chevron")[0]
	
	row.props =
		superLayer: scroller.content
		style:      listRow.style
		y:          listRow.height * rowIndex
		html:       "#{listRow.html} #{rowIndex}"

	chevron.props = 
		style: 		listChevron.style

# ------------------------------------------------------------------------------
# Update the Scroller to handle all the rows
		
scroller.updateContent()
