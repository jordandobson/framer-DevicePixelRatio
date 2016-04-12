# framer-DevicePixelRatio

Use this module to design in Framer at 1x and have your designs adjust for the Pixel Ratio of the device.

*To get started...*

 1. Place the DevicePixelRatio.coffee file in your Framer /modules directory

 2. In your Framer project include:

 ```
 {dpr} = require 'DevicePixelRatio'
```

 3. When you create a layer do so @ 1x and add the dpr function to the value
 
 ```
  rect = new Layer
    width:  dpr 300
    height: dpr 50
```
 4. Use it for more than layer size. Here's advanced usage for multi devices:

 ```
 # Add a list row w/ the height & text sizing/layout using dpr()

 listRow = new Layer
    width: Screen.width
    height: dpr 44
    html: "List Item"
    backgroundColor: "#fff"
    color: "#000"
    style: 
      font: "400 #{dpr 14}px/#{dpr 42}px -apple-system, Helvetica Neue"
      textIndent: "#{dpr 15}px"

 # Add a chevron with the size, right margin & shadow stroke using dpr()

 listChevron = new Layer
    superLayer: listRow
    width:  dpr 9
    height: dpr 9
    maxX: listRow.width - dpr 15
    y:    listRow.height / 2
    originX: 1
    originY: 0
    rotation: 45
    backgroundColor: ""
    style:
      boxShadow: "inset -#{dpr 2}px #{dpr 2}px 0 #BCBCC1"
```

###### Thanks to [Nikolay Berezovskiy](https://twitter.com/unikolas) for helping with the latest device updates to this module. :D
