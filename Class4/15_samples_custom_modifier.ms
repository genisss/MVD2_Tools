plugin modifier MyMod
name:"Bend Custom"
classID:#(685325,452281)
extends:Bend replaceUI:true version:1
(
	-- Parameters and actions
	parameters main rollout:params
	(
		bendamt type:#float animatable:true ui:bendamt default:0.0
		on bendamt set val do delegate.angle = val
	)
	
	-- Custom rollout to set up parameters
	rollout params "Bend Custom Parameters"
	(
			spinner bendamt "Bendiness: "
	)
)

plugin modifier NSpline
name:"Normal. Spline"
classID:#(0x133067, 0x54374)
extends:normalize_spline
replaceUI:true version:1
(
	parameters main rollout:params
	(
		seglen type:#float animatable:true ui:seglen default:20
		on seglen set val do delegate.length = val
	)
	
	rollout params "Parameters"
	(
		spinner seglen "Seg Length: " range:[0.01,1e9,20]
	)
)