global mat_folders = "D:/Users/Vostek/Desktop/materials/"

struct MyMaterialExporter
(
	mat_name = "default",
    mat_tech = "pbr.tech",
	mat_shadows = "true",
	
    public
    fn Constructor =
    (
		print ("The object has been created")
		return true
    ),
	
	fn exportMaterial mat =  
	(  
		local header = mat_name + " // "
		header += mat_tech + " // "
		header += mat_shadows + "\n"
		
		local maps = (getFilenameFile mat.diffuseMap.fileName) + "\n"
		maps += (getFilenameFile mat.specularMap.fileName) + "\n"
		maps += (getFilenameFile mat.bumpMap.fileName)
		
		copyFile mat.diffuseMap.fileName (mat_folders + "diffusemap")
		copyFile mat.specularMap.fileName (mat_folders + "specularmap")
		copyFile mat.bumpMap.fileName (mat_folders + "bumpmap")

		f = (createFile (mat_folders + mat_name))
		format header to:f
		format maps to:f
		close f
    )
)

fn testMaterialExporter = 
(
	--newmat = StandardMaterial()
	exp_test = MyMaterialExporter mat_name:"mtl_test.mat"
	exp_test.exportMaterial $selection[1].material		
)

testMaterialExporter()
