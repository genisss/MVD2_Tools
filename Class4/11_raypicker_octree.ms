
global select_obj = undefined
global multiplier = 1

fn drawPolygon = 
(
	vpSize = getViewSize()
	gw.hMarker [mouse.pos.x, vpSize.y - mouse.pos.y, 1]("circle" as name)
	gw.enlargeUpdateRect #whole
	gw.updateScreen()
)

tool rayPicker
(
	on mousePoint clickno do
	(		
		rm = RayMeshGridIntersect() -- Create the instance for intersection
		rm.Initialize 100 -- Init. the octree grid size to 10x10x10
		rm.addNode select_obj -- Add the object to the octree
		rm.buildGrid()
		
		ry = mapScreenToWorldRay mouse.pos
		theHitsCount = rm.intersectRay ry.pos ry.dir true --intersect the ray with the object
		-- rm.intersectSphere 
		
		if theHitsCount > 0 then --if have hit anything...
		(
			theIndex = rm.getClosestHit () --get the index of the closest hit by the ray
			theFace = rm.getHitFace theIndex --get the face index corresponding to that indexed hit
			-- extrudeface p #{theFace} (random 1 15) 100 dir:#independent
			
			-- Best way of modying the mesh, get the vertices affected and apply modifications on them
			vertsSel = meshop.getVertsUsingFace select_obj theFace
			faceNormal = getFaceNormal select_obj theFace
			
			-- Modifications on mesh, better to do through selection
			setVertSelection select_obj vertsSel
			for vert in $.selectedVerts do vert.pos = (vert.pos + multiplier * faceNormal)
			update select_obj --Always update the mesh after any modification on its geometry.
			
			max modify mode-- Switch to Modify panel
			subObjectLevel = 1-- Set Vertex SO level
		)
	)
	
	on mouseMove clickno do
	(
		drawPolygon()
	)
)

rollout unnamedRollout "Raypick Extruder" width:245 height:106
(
	button 'btn1' "Start" pos:[11,63] width:220 height:29 align:#left
	spinner 'spn1' "Strength " pos:[107,20] width:74 height:16 align:#left value:1
	
	on btn1 pressed do
	(
		select_obj = convertToMesh selection[1]
		multiplier = spn1.value
		stopTool rayPicker
		startTool rayPicker
	)
)

-- First clear then register.
unregisterRedrawViewsCallback drawPolygon
registerRedrawViewsCallback drawPolygon
createDialog unnamedRollout