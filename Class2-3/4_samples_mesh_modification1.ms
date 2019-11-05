delete $*
myplane = Plane lengthsegs:15 widthsegs:15
p = convertToPoly(myplane) --converts any shape to editpoly

for i = 1 to 15 do -- repeat length
(
	for j = 1 to 15 do -- repeat width
	(
		if (random 1 3) == 1 then (
			polyop.setFaceSelection p #{15*(i-1) + j}
			p.extrudeFaces (random 1 15) --extrude the selection
		)
	)
)
