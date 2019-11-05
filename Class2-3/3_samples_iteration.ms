
resetMaxFile #noprompt --reset the scene
mybox = box length:10 width:10 height:10 wirecolor:blue --new box

for i = 1 to 5 do --repeat five times, for each iteration do:
(
        box_copy = copy mybox 
        box_copy.pos = [i*20, 0, 0] 
        box_copy.wirecolor = [i*25,i*50,(5-i)*50] 


) -- end of the for loop 

resetMaxFile #noprompt --reset the scene
mybox = box length:10 width:10 height:10 wirecolor:blue --new box

for i = 1 to 5 do --repeat five times, for each iteration do:
(
        for j = 1 to 5 do
        (
                box_copy = copy mybox 
                box_copy.pos = [i*20, j*20, 0] 
                box_copy.wirecolor = [i*25,j*25,0] 
        )
	
) -- end of the for loop 

resetMaxFile #noprompt --reset the scene

for i = 1 to 15 do --repeat five times, for each iteration do:
(
        sphere name:(i as string) position:[0,i^2,0] radius:i
) -- end of the for loop 

resetMaxFile #noprompt --reset the scene
mybox = box length:10 width:10 height:10 wirecolor:blue --new box

for i = 1 to 15 do --repeat five times, for each iteration do:
(
        for j = 1 to 15 do
        (
                box_copy = copy mybox 
                box_copy.pos = [i*12, j*12, 0] 
                if mod i 2 == 0 then (
			box_copy.wirecolor = [0,0,255] 
                )
                else (
                        box_copy.wirecolor = [255,0,0] 
                )
        )
) -- end of the for loop 
