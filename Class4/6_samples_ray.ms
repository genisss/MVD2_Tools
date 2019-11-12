delete $hitpoint*

for i = 1 to $selection.count   do 
(
	seed i -- regenerate random numbers
	random_pos = random [-100,-100,100] [100,100,100] -- [random -1 1, random -1 1, random -1 1]
	
	ray_dir = Ray $selection[i].position [0,0,-1]
	ray_int = intersectRay $Plane001  ray_dir
	
	if ray_int != undefined do 
	(
		--obj  =sphere name:"hitpoint" scale:[0.025,0.025,0.025]
		$selection[i].pos = ray_int.pos
	)
)

