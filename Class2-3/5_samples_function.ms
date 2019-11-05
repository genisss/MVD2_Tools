function createCircle rad1 rad2 step = 
(
	total_amount = 360 / step

	for i = 1 to total_amount do 
	(
		local out_angle = i *step;
		x = rad1 * cos(out_angle);
		y = rad1 * sin(out_angle);
		sphere name:("itr" + i as string) pos:[x,y,0] radius:rad2
	)
)

delete $*
createCircle 40 1 5 