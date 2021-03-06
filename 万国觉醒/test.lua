

require("tsp")

a = 'data:image/png;base64,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'

b = 'data:image/png;base64,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'


log({#a,#b})

for i=1,1998 do
    local aa = string.sub(a,i,i)
    local bb = string.sub(b,i,i)
    
    if aa ~= bb then
        log( string.sub(a,i-20,i) )
        log({i,aa,bb})
        lua_exit()
    end
end










