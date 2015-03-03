animateCommands = {}
afterCutscene = function() end
function animate(i,func)
  local script = love.filesystem.newFile("cutscenes/"..i..".txt")
  local content = script:read()
  content = string.explode(content,"\n")
  for _,v in pairs(content) do
    table.insert(animateCommands,string.explode(v," "))
  end 
  afterCutscene = func
  animating = true
end

function finishScene()
  afterCutscene()
  animating = false
end

function string.explode(str, div)
    assert(type(str) == "string" and type(div) == "string", "invalid arguments")
    local o = {}
    while true do
        local pos1,pos2 = str:find(div)
        if not pos1 then
            o[#o+1] = str
            break
        end
        o[#o+1],str = str:sub(1,pos1-1),str:sub(pos2+1)
    end
    return o
end