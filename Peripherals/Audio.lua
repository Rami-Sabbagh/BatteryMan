--Custom Audio Peripheral for LD Jam

return function(config) --A function that creates a new Keyboard peripheral.
  if not love.audio then error("love.audio module is disabled !") end
  
  local au, devkit = {}, {}
  
  local musiclist = {"BounceMan.ogg"}
  
  local sfxlist = {
    "DoorClose.wav", --1
    "DoorOpen.wav", --2
    "Jump.wav", --3
    "PickUp.wav", --4
    "Tick.wav", --5
    "BoxDown.wav", --6
    "BoxUp.wav", --7
    "BoxLand.wav", --8
    "PlayerLand.wav", --9
    "GameWin.ogg", --10
    "GameOver.ogg" --11
  }
  
  local musicdata = {}
  local sfxdata = {}
  
  function devkit.loadAudio()
    --Load Music
    print("Loading Music ("..#musiclist..")")
    for k, file in ipairs(musiclist) do
      print("Loading "..file.." ("..k.."/"..#musiclist..")")
      local data = love.audio.newSource("/Audio/"..file,"stream")
      data:setLooping(true)
      data:setVolume(0.5)
      table.insert(musicdata,data)
    end
    
    print("Loading SFX ("..#sfxlist..")")
    for k, file in ipairs(sfxlist) do
      print("Loading "..file.." ("..k.."/"..#sfxlist..")")
      local data = love.audio.newSource("/Audio/"..file,"static")
      table.insert(sfxdata,data)
    end
    
    print("Finished Loading Audio")
  end
  
  function au.StopAudio()
    love.audio.stop()
    return true
  end
  
  function au.SFX(id,stop)
    if not sfxdata[id] then return false, "SFX "..id.." Doesn't exists" end
    if stop then
      love.audio.stop(sfxdata[id])
    else
      love.audio.play(sfxdata[id])
    end
    return true
  end
  
  function au.Music(id,stop)
    if not musicdata[id] then return false, "Music "..id.." Doesn't exists" end
    if stop then
      love.audio.stop(musicdata[id])
    else
      love.audio.play(musicdata[id])
    end
    return true
  end
  
  return au, devkit
end