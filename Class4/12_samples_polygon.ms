unregisterRedrawViewsCallback GW_displayObjectNames

fn GW_displayObjectNames =
(
        gw.setTransform (matrix3 1)
        for o in objects where not o.isHiddenInVpt do
        gw.text o.pos (o as string) color:yellow
        gw.enlargeUpdateRect #whole  
)
registerRedrawViewsCallback GW_displayObjectNames

unregisterRedrawViewsCallback GW_displayObjectNames

fn GW_displayObjectNames =
(
        gw.hMarker [mouse.pos.x, mouse.pos.y, 10]("circle" as name)
        gw.enlargeUpdateRect #whole
        gw.updateScreen()
)

registerRedrawViewsCallback GW_displayObjectNames
