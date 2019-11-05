function createCircle rad1 rwidth step = 
(
	total_amount = 360 / step

	-- Declare two arrays, for vertices and faces
	vert_array = #()
    face_array = #()
    
    -- Declare a vertex count variable
    vert_count = 0

	for i = 1 to total_amount do 
	(
		local in_angle = (i-1) * step
        local out_angle = i * step
        
        -- Determine previous and next point
        local org1 = [rad1 * cos(in_angle), rad1 * sin(in_angle), 0]
        local org2 = [rad1 * cos(out_angle), rad1 * sin(out_angle), 0]
        local p1 = org1 - org1 * rwidth
        local p2 = org1 + org1 * rwidth
        local p3 = org2 - org2 * rwidth
        local p4 = org2 + org2 * rwidth

        join vert_array #(p1,p2,p3)
        join vert_array #(p3,p4,p2)
        append face_array [vert_count+1,vert_count+2,vert_count+3]
        append face_array [vert_count+6,vert_count+5,vert_count+4]
        vert_count += 6
    )

	mesh vertices:vert_array faces:face_array
)

delete $*
createCircle 500 0.1 5 