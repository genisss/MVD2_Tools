global selectedObj = undefined

--Replace all the selected objects with the replacement object
fn replaceNodes = 
(
	-- Looping through selection and copying their transform
	for obj in selection do 
	(
		copyObj = copy selectedObj
		copyObj.pos = obj.pos
		copyObj.rotation = obj.rotation
	)
	
	delete selection
)

rollout unnamedRollout "Untitled" width:302 height:91
(
	pickButton 'btn1' "PickButton" pos:[34,30] width:98 height:29 align:#left
	button 'btn2' "Replace" pos:[160,31] width:99 height:28 align:#left
	
	on btn1 picked obj do
	(
		-- Check if the object is valid.
		-- Null equivalent in maxscript is Undefined
		if isValidNode obj do 
		(
			btn1.tooltip = "Pick an object as replacement"
			btn1.caption = obj.name
			selectedObj = obj
		)
	)
	
	on btn2 pressed do 
	(
		replaceNodes
	)
)

createDialog unnamedRollout
