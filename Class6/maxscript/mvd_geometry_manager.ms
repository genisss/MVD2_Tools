/* 
Contains three classes
	Mesh Manager, to export all the mesh information into map files
	Material Manager, to export all material info and maps into material file
	Collider Manager, to generate colliders depending on our needs.
*/
--filein "mvd_json_exporter.ms"
--filein "mvd_utils.ms"

-- Determine geometry layer names and other definitions in this file header
global layer_colliders = "colliders"

-- Class used to export the meshes as .obj or binary files
struct MeshManager 
(
	
	--fs = MVDJson(),           
	
	-- Method to export mesh in .obj format
	fn exportItem obj epath = 
	(
		/* TO-DO
		(
			-- Get the given object and export it as a .obj format file
		)
		*/
	),
	
	-- Method to export a mesh in binary format
	fn exportItemBinary obj epath = (
		
		/* TO-DO
		(
			-- Export the given object in our custom format!
			-- Class 7
		)
		*/
	)
)

-- Class used to export materials and textures
struct MaterialManager (
	
	--fs = MVDJson(),    
	--fs_tex = MVDJson(), 	
	tech = "pbr.tech",
	shadows = true,
	gen_mat = true,
	gen_tex = true,
	
	-- Export the texture of the given map
	fn exportMap emap ename = (
		
		/* TO-DO
		(
		-- Export the texture and copy it into assets texture folder
		-- Save necessary data into the material file.
		)
		*/
	),
	
	-- Export the material given, parameters and texture definition
	fn exportItem emat = (
		
		local short_path = (mats_path + emat.name + ".mtl")
		local full_path = (project_path + short_path)
		
		-- Atleast default diffuse needed
		if emat.diffusemap != undefined then (
			exportMap emat.diffusemap "diffuse"
		) else ( -- setup a default in this case.
			fs_tex.add "diffuse" (tex_path + "default.dds")
		)
		
		/* TO-DO
		(
		-- Get all the maps that we have and export them
		)
		*/
		
		return short_path
	)
)

-- Collider manager
-- Used to generate collider meshes and types
struct ColliderManager 
(	
	-- TO-DO
	-- Class that generates colliders and exports them.
)