function foo x y &z =
(
	-- ...
	z = x * y
	-- ...
	return true
)

-- test function
z = 12
foo 5 6 &z
