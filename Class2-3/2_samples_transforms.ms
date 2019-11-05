delete $*
gc()

-- Create a box
box name:"create_box" pos:[-70,0,0]

-- Translate a box
box name:"move_box" pos:[-70,0,0]
move $move_box [40,0,0]

-- Rotate a box
box name:"rotate_box" pos:[10,0,0]
rotate $rotate_box (eulerangles 00 0 45)

-- Scale a box
box name:"scale_box" pos:[60,0,0]
scale $scale_box [2,2,2]

-- Create some debug text
t = TextPlus name:"transform_text" size:25 pos:[0,-70,0] wirecolor:(color 255 255 255)
t.SetPlaintextString("Transformations")	
t.extrudeamount = 1

-- Previous actions can be done by a single action on object
mybox = $create_box
mybox.scale = [0.5,0.5,0.5]
mybox.rotation = (eulerangles 0 0 45)
mybox.position = [-70,0,20]
mybox.wirecolor = (color 255 0 0)