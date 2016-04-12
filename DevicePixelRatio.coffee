##############################################################################
# Created on 23 DEC 2015 by Jordan Dobson / @jordandobson / jordan@brothe.rs
# Updated on 12 APR 2016 by Jordan Dobson with thanks to Nikolay Berezovskiy!
##############################################################################
#
# Use to measure pixels at 1x and have it adjust for the Pixel Ratio
#
# To Get Started...
#
#  1. Place this file in Framer Studio modules directory
#
#  2. In your project include:
#
#     {dpr} = require 'DevicePixelRatio'
#
#  3. When you create a layer do so @ 1x and add the dpr function to the value
#
#     rect = new Layer
#       width:  dpr(300)
#       height: dpr 50
#       x:      (dpr 16)
# 
#  4. Use it for more than layer size. Here's advanced usage for multi devices:
#
#			# Add a list row w/ the height & text sizing/layout using dpr()
#
#     listRow = new Layer
#       width: Screen.width
#       height: dpr 44
#       html: "List Item"
#       backgroundColor: "#fff"
#       color: "#000"
#       style: 
#         font: "400 #{dpr 14}px/#{dpr 42}px -apple-system, Helvetica Neue"
#         textIndent: "#{dpr 15}px"
#
# 		# Add a chevron with the size, right margin & shadow stroke using dpr()
#     
#     listChevron = new Layer
#     	superLayer: listRow
#     	width:  dpr 9
#     	height: dpr 9
#     	maxX: listRow.width - dpr 15
#     	y:    listRow.height / 2
#     	originX: 1
#     	originY: 0
#     	rotation: 45
#     	backgroundColor: ""
#     	style:
#     		boxShadow: "inset -#{dpr 2}px #{dpr 2}px 0 #BCBCC1"
#
##############################################################################

class exports.DevicePixelRatio

	#############################################################################
	# Private Methods ###########################################################
	
	log = (v) ->
		console.log "DevicePixelRatio set as:", v
		return v

	dpr = () ->
		initialValue = 1
		value = initialValue
		# Check if in Studio or Desktop to figure out what the scaling should be
		if Utils.isFramerStudio() or Utils.isDesktop()

			# Check for 2x devices 
			for device_2x in ['apple-', 'google-nexus-', 'iphone-6-', 'iphone-5', 'ipad-air', 'nexus-9', 'applewatch']
				value = 2 if _.startsWith(Framer.Device.deviceType, device_2x)

			# Check for 3x devices
			for device_3x in ['apple-iphone-6s-plus', 'google-nexus-5', 'htc-one-', 'microsoft-lumia-', 'samsung-galaxy-note-', 'iphone-6plus', 'nexus-5']
				value = 3 if _.startsWith(Framer.Device.deviceType, device_3x)
				
			# Check for 3.5x devices
			for device_3p5x in ['google-nexus-6']
				value = 3.5 if _.startsWith(Framer.Device.deviceType, device_3p5x)

		# Return if the value changed... otherwise continue
		return log value unless value is initialValue
		
		# Set Units based on Device Pixel Ratio Except for Desktop
		unless Utils.isDesktop()
			devicePixelRatio = Utils.devicePixelRatio()
			# if it's greater than 1 then update it!
			value = devicePixelRatio if devicePixelRatio > initialValue

		# return the value even if it hasn't changed and log it everytime its set
		return log value
		
	#############################################################################
	# Constant ##################################################################
	
	VALUE = dpr()

	#############################################################################
	# Public Methods ############################################################
	
	@.calc  = (v) -> return v * VALUE
	
	@.value = VALUE

################################################################################
# Create a shorthand to get directly to the calc statement

exports.dpr = exports.DevicePixelRatio.calc
