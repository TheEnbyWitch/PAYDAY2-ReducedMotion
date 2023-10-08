if RequiredScript == "lib/tweak_data/playertweakdata" then
	local p = pairs
	local old_ptd = PlayerTweakData.init
	function PlayerTweakData:init(...)
		old_ptd(self, ...)
		-- Remove the breathing shaker and 
		for k, v in p(self.stances) do
			v.standard.shakers.breathing.amplitude = 0
			v.crouched.shakers.breathing.amplitude = 0
			v.standard.vel_overshot.yaw_neg = 0
			v.standard.vel_overshot.yaw_pos = 0
			v.standard.vel_overshot.pitch_neg = 0
			v.standard.vel_overshot.pitch_pos = 0
			v.crouched.vel_overshot.yaw_neg = 0
			v.crouched.vel_overshot.yaw_pos = 0
			v.crouched.vel_overshot.pitch_neg = 0
			v.crouched.vel_overshot.pitch_pos = 0
		end
	end
end

if RequiredScript == "lib/units/beings/player/playercamera" then
	local old_ptd = PlayerCamera.play_shaker
	function PlayerCamera:play_shaker(effect, amplitude, frequency, offset)
		-- Remove the camera roll shaker when firing a weapon
		if effect == "fire_weapon_rot" then
			return
		end

		return old_ptd(self, effect, amplitude, frequency, offset)
	end
end

if RequiredScript == "lib/units/beings/player/states/playercarry" then
	-- Remove the camera roll tilt when carrying a bag
	PlayerCarry.target_tilt = 0
end

if RequiredScript == "lib/units/beings/player/states/playermaskoff" then
	-- Remove the walking headbob when without a mask
	function PlayerMaskOff:_get_walk_headbob()
		return 0
	end
end
if RequiredScript == "lib/units/beings/player/states/playerstandard" then
	-- Remove the walking headbob
	function PlayerStandard:_get_walk_headbob()
		return 0
	end
end
