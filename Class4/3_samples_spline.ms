fn drawLineBetweenTwoPoints pointA pointB =
(
        ss = SplineShape pos:pointA
        addNewSpline ss
        addKnot ss 1 #corner #line PointA
        addKnot ss 1 #corner #line PointB
        updateShape ss
        ss
)

newSpline = drawLineBetweenTwoPoints [10,20,30] [100,200,10]
