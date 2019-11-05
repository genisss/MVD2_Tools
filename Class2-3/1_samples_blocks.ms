-- This is a comment
-- This is a global variable, visible from the whole snippet
Global globalvar = "This is a global variable"

-- Creating a dummy scope
(
    local localvar = "This is a local variable"

    --print globalvar
    --print localvar
)

print localvar -- This gives an error
--print globalvar -- this works
