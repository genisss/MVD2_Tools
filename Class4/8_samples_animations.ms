with animate on 
(
	at time 10	
	$needle.rotation.z_rotation = random 100.0 -100.0
	at time 20	
	$needle.rotation.z_rotation = random 100.0 -100.0
	at time 30	
)

-- Sequential frames
sequential_box = teapot name:"sequential_box" wirecolor:(color 255 0 0) pos:[20,0,0] radius:15
animate on for t = 0 to 100 by 5
do at time t
(
	sequential_box.position = sequential_box.position + [5,0,0]
)