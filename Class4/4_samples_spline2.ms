function placeObjsOnSpline inputSpline inputObjs =
 (
	local objsToPlace = #{1..inputObjs.count} as array;
	for i = 1 to inputObjs.count do
	(		
		placeObjIndex = (random 1 objsToPlace.count);
		inputObjs[objsToPlace[placeObjIndex]].position = (pathInterp inputSpline (i / inputObjs.count as float))
		objsToPlace = (deleteItem objsToPlace placeObjIndex);
	)
)