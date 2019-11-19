-- We can include files using filein 
filein "mvd_utility_managers.ms"

gc()
clearListener()

man_selection = SelectionManager() -- Selection utility tool manager
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

-- Instructions rollouts
rollout SBInstructions "Instructions" width:351 height:99
(
	label 'lbl1' "- Selection tools: ADD DESC HERE." pos:[17,9] width:302 height:24 align:#left
	label 'lbl3' "- Export tools: ADD DESC HERE." pos:[17,28] width:321 height:30 align:#left
	label 'lbl4' "- Animation tools: ADD DESC HERE." pos:[17,46] width:321 height:30 align:#left
	label 'lbl5' "- Asset library: ADD DESC HERE." pos:[17,65] width:321 height:30 align:#left
)

-- Selection tools
rollout SBSelection "Selection Tools" width:477 height:252
(
	GroupBox 'grp1' "Selection" pos:[11,12] width:450 height:222 align:#left
	edittext 'mesh_filter' "Name:" pos:[37,47] width:184 height:21 fieldwidth:150 labelOnTop:false align:#left
	button 'btn_select' "Select" pos:[34,175] width:188 height:33 toolTip:"This is a tooltip" align:#left

	dropdownList 'sel_layers' "" pos:[73,85] width:149 height:21 align:#left 
 
	listbox 'lbx1' "Selection Hierarchy" pos:[274,31] width:161 height:12 align:#left
	label 'lbl1' "Layers:" pos:[35,87] width:39 height:14 align:#left
	button 'btn13' "Button" pos:[248,36] width:2 height:181 align:#left
	dropdownList 'sel_cat' "" pos:[73,118] width:149 height:21 align:#left
	label 'lbl4' "Tag:" pos:[35,121] width:39 height:14 align:#left
	
	local var1 = ""
	local var2 = sel_layers.selected 
	local var3 = sel_cat.selected
	
	fn updateDataInput = 
	(
		man_selection.updateManager()
		sel_layers.items = man_selection.layers
		sel_cat.items = man_selection.categories
		var2 = sel_layers.selected 	
		var3 = sel_cat.selected
		lbx1.items = man_selection.updateHierarchy var1 var2 var3
	)
	
	-- On window open
	on SBSelection open do 
	(
		updateDataInput()
	)
	
	-- On layer selected
	on sel_layers selected var2 do 
	(
		-- Update the manager, with new layers
		-- Update the hierarchy with the current selected layer and prefix
		-- TO-DO method calling
		updateDataInput()
	)
	
	-- On category selected
	on sel_cat selected var3 do 
	( 
		-- Update the manager with new layers
		-- Update the hierarchy with the current selected category
		-- TO-DO method calling
		updateDataInput()
	)
	
	-- On name changed
	on mesh_filter changed var1 do 
	(
		-- TO-DO method calling
		man_selection.updateManager()
		var2 = sel_layers.selected 	
		var3 = sel_cat.selected
		lbx1.items = man_selection.updateHierarchy var1 var2 var3
	)
	
	-- Here we catch button actions
	on btn_select pressed do 
	(		
		-- Update the results with new selected nodes.
		man_selection.triggerSelection();
	)
)

-- Export Tools
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
rollout SBExport "Export Tools" width:474 height:266
(

)

--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

-- Utils Tools
rollout SBUtils "Utils Tools" width:469 height:263
(

)

-- Build a rollout that can be floated
function createRollouts = 
(
	-- Create a rollout floater and load it.
	-- Floater allow us to expand/shrink panels
	try(cui.UnRegisterDialogBar FirstDialog)catch()
	try(destroyDialog FirstDialog)catch()
	FirstDialog = newRolloutFloater "MVD Export Tools" 485 600
	
	-- Build the panels we want here
	addrollout SBInstructions FirstDialog rolledUp:on
	addrollout SBSelection FirstDialog rolledUp:on
	addrollout SBExport FirstDialog rolledUp:on
	addrollout SBUtils FirstDialog rolledUp:on
)

-- Launching the tool
createRollouts()