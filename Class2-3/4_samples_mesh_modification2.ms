/*
Snippet used to remove mesh backface
*/

delete $*
global obj = sphere() -- Create an sphere
convertToMesh obj -- Convert to editable mesh

-- Determine camera front vector
viewDir = Inverse(getViewTM())
viewDir = viewDir.row3	
	
for v = obj.numFaces to 1 by -1 do
(
	local faceNormal = getFaceNormal obj v
	if dot faceNormal viewDir < 0 then
	(
		deleteFace obj v
	)
)

-- Update on mesh needed after editing its geometry!
update obj 