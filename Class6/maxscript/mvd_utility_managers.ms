/* 
This class will hold all information related to selection tools
Retrieve all layers present in the scene
Retrieve all tags present in the scene
Trigger the selection
*/

struct SelectionManager 
(
	selhierarchy = #(), -- list of objects in the hierarchy panel
	layers = #(),
	categories = #("all", "mesh", "collider", "decal"), --manually adding them by now
	
	-- Function to select everything on the list
	fn triggerSelection = 
	(
		local final_selection = #()
		
		/* TO-DO
		(
		-- Loop through selhierarchy
		-- save all nodes into final_selection
		)
		*/
		select final_selection
	),
	
	-- Update the hierarchy panel with the total amount of nodes that should be taken into count
	fn updateHierarchy substr layer category = 
	(		
		local candidates = #()
		local layer_nodes = for i in $* where i.layer.name == layer collect i
			
		/* TO-DO
		(
			-- Loop through layer nodes and check if their name contains the substring
		)
		*/	
				
		/* TO-DO
		(
			-- Loop through all the categories and check if their tag  matches the selected one
		)
		*/	
		return selhierarchy
	),
	
	-- Function to retrieve the layer names..
	fn updateLayers = 
	(
		free layers
				
		/* TO-DO
		(
			-- Loop through all the layers and retrieve them
			-- Use 
		)
		*/	
	),
	
	-- Function to update everything we need
	fn updateManager = 
	(
		-- First, update the layers, search them in max
		updateLayers()
		
		-- Update the categories?
	)	
)
