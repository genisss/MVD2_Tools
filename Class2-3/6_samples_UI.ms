rollout unnamedRollout "Untitled" width:499 height:130
(
	button 'btn1' "Box" pos:[22,39] width:133 height:29 align:#left
	button 'btn2' "Sphere" pos:[168,40] width:133 height:29 align:#left
	button 'btn3' "Plane" pos:[317,41] width:133 height:29 align:#left
	
	on btn1 pressed do ( mybox = Box() )
	on btn2 pressed do ( mybox = Sphere() )
	on btn3 pressed do ( mybox = Plane() )
)

createDialog  unnamedRollout 