rayPicker_primitive = box

tool rayPicker
(
	on mouseMove clickno do
	(
		ry = mapScreenToWorldRay mouse.pos
		myray= ray ry.pos ry.dir
		local intersect = intersectRayScene myray
		
		if intersect.count > 0 do
		(
			selection[1].pos = intersect[1][2].pos
		)
	)
)

rollout unnamedRollout "Test tool" width:245 height:106
(
	button 'btn1' "Start" pos:[11,63] width:220 height:29 align:#left
	
	on btn1 pressed do
	(
		stopTool rayPicker
		startTool rayPicker
	)
)

createDialog unnamedRollout