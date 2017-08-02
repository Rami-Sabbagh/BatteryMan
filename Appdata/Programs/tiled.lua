local mapcode = fs.load("D:/LD/map.lua")()
local layer = mapcode.layers[1]
local tdata = "LK12;TILEMAP;"..layer.width.."x"..layer.height..";"
tdata = tdata..table.concat(layer.data,";")..";"

local eapi = require("Editors")

local teditor = eapi.leditors[eapi.editors.tile]
teditor:import(tdata)
fs.write("D:/LD/map.lk12",tdata)

local term = require("terminal")
term.execute("save")