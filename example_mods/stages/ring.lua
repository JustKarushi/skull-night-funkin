-- A REALLY REALLY BIG THANKS TO WASHO FOR MAKING A CAMERA FOLLOWS CHAR SCRIP, tqm washo se que hablas español asi que besitos en la cola
-- Washo GB page: https://gamebanana.com/members/1971029
local xx = 400
local yy = 200
local xx2 = 1100
local yy2 = 300
local ofs = 40
local followchars = true
local del = 0
local del2 = 0

function onCreate()
	-- background shit
	makeLuaSprite('ringback', 'wwe/ringback', -500, -500)
	setLuaSpriteScrollFactor('ringback', 1, 1)

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeAnimatedLuaSprite('bgRing', 'wwe/bgRing', -500, -500)
		setScrollFactor('bgRing', 1, 1)
		addAnimationByPrefix('bgRing', 'bopping', 'bgRing bopping', 24, true)

        --shhhh
		makeLuaSprite('QR','QR/beowulf',-500,-500)
		setProperty('QR.antialiasing',false)
		setObjectCamera('QR','hud')
		addLuaSprite('QR')
	end

	makeLuaSprite('ring', 'wwe/the ring itself', -500, -500)
	setLuaSpriteScrollFactor('ring', 1, 1)

	makeLuaSprite('ringcurtains', 'wwe/ringcurtains', -500, -500)
	setLuaSpriteScrollFactor('ringcurtains', 0.9, 0.9)

	addLuaSprite('ringback', false)
	addLuaSprite('bgRing', false)
	addLuaSprite('ring', false)
	addLuaSprite('ringcurtains', false)
end

function onBeatHit()
	objectPlayAnimation('bgRing', 'bopping', false)

    if songName == "thunderwulf" then
        triggerEvent('Add Camera Zoom', '0.03', '0.02')
    end

end

function onUpdate()
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end 
end