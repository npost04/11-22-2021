-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

-- Setup vars that are user-independent.
function job_setup()

end

-- //gs debugmode
-- //gs showswaps
function binds_on_load()
-- F9-F12
	send_command('bind @f9 gs c cycle OffenseMode')
	send_command('bind @f10 gs c cycle HybridMode')
	send_command('bind @f11 gs c cycle CastingMode')
	send_command('bind @f12 gs c cycle IdleMode')
-- ALT F9-12
	send_command('bind !f10 gs c cycle RangedMode')
	send_command('bind !f11 gs c cycle WeaponskillMode')
	send_command('bind !f12 gs c update user')
	
---------------------------------------------------------------------
-------------------------- Enmity Mapping ---------------------------
---------------------------------------------------------------------	

		EnmityMagic = S {'Foil','Flash','Cure','Cure II','Cure III','Cure IV','Banishga','Stun','Poisonga'}
		EnmityBlu = S {'Sheep Song','Jettatura','Blank Gaze','Soporific','Geist Wall','Stinking Gas'}
		EnmityJA = S {'Shield Bash','Provoke','Animated Flourish','Sentinel','Rampart','Invincible',
			'Holy Circle','Palisade','Intervene','Cover','Fealty','Chivalry','Sepulcher','Divine Emblem',
			'Provoke','Animated Flourish','Pflug','Battuta','Valiance','Vallation'}			
	
end

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	include('augments.lua')
    state.OffenseMode:options('Normal', 'Acc', 'Refresh')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.HybridMode:options('Normal', 'Hybrid', 'PDT', 'MDT')
    state.IdleMode:options('Normal', 'PDT', 'MDT')
    state.CastingMode:options('Normal', 'Resistant')

    update_defense_mode()	
	
    select_default_macro_book()
	
    -- Augmented Gear

	
	
---------------------------------------------------------------------
-------------------------- Enmity Mapping ---------------------------
---------------------------------------------------------------------	

	EnmityMagic = S {'Foil','Flash','Cure','Cure II','Cure III','Cure IV','Banishga','Stun','Poisonga'}	
	
	gear.Ogma = {}
	gear.Ogma.STP = { name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Store TP"+10','Damage taken-5%',}}
	gear.Ogma.Tank = { name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Mag. Evasion+15',}}
	-- Needs 10 Dye
	gear.Ogma.DA = { name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	-- Needs 5 Dye
	gear.Ogma.WSD = { name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
	-- Needs 5 Dye
	
	-- DA = Weaponskill Cape
	
end

-- Called when this job file is unloaded (eg: job change)
function file_unload()
	if binds_on_unload then
		binds_on_unload()
	end
end


-- Define sets and vars used by this job file.
function init_gear_sets()
include('Augments.lua')
-- Precast sets to enhance JAs
    -- 1 hours
	sets.precast.JA['Elemental Sforzo'] = {body="Futhark Coat +3"}
    sets.precast.JA['One for All'] = {}
	
	-- Rune Enchantment
	sets.precast.JA['Ignis'] = {}
	sets.precast.JA['Gelus'] = {}
	sets.precast.JA['Flabra'] = {}
	sets.precast.JA['Tellus'] = {}
	sets.precast.JA['Sulpor'] = {}
	sets.precast.JA['Unda'] = {}
	sets.precast.JA['Lux'] = {}
	sets.precast.JA['Tenebrae'] = {}
	
	-- Other
    sets.precast.JA['Swordplay'] = {hands="Futhark Mitons +3"}
	sets.precast.JA['Embolden'] = {back={name="Evasionist's Cape", augments={'Enmity+5','"Embolden"+13','"Dbl.Atk."+4','Damage taken-3%',}},}
	sets.precast.JA['Odyllic Subterfuge'] = {}
	
	-- Wards
	sets.precast.JA['Vallation'] = {body="Runeist's Coat +3", legs="Futhark Trousers +3", back=gear.Ogma.Tank}
	sets.precast.JA['Pflug'] = {feet="Runeist Bottes +1"}	
	sets.precast.JA['Valiance'] = {body="Runeist's Coat +3", legs="Futhark Trousers +3", back=gear.Ogma.Tank}
	sets.precast.JA['Liement'] = {body="Futhark Coat +3"}
	sets.precast.JA['Battuta'] = {head="Futhark bandeau +3"}
	
	-- Effusion
	-- Swipe - MAB - Can Magic Burst it.
	-- Lunge - MAB - Can Magic Burst it.
	sets.precast.JA['Swipe'] = {
		ammo="Seething Bomblet +1",
		head="Herculean Helm",
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
		ear2="Novio Earring",
		body="Carmine Scale mail +1",
		hands="Carmine Finger Gauntlets +1",
		ring1="Shiva Ring +1",
		ring2="Shiva Ring +1",
		back="Evasionist's Cape",
		waist="Eschan Stone",
		legs="Herculean Trousers",
		feet="Herculean Boots"}
		
	sets.precast.JA['Lunge'] = sets.precast.JA['Swipe']
	sets.precast.JA['Gambit'] = {hands="Runeist Mitons +3"}
	sets.precast.JA['Rayke'] = {feet="Futhark Boots +3"}

	-- Healing - Divine Skill - Empy Head removes status effects.
	-- Tenebrae will cause this to restore MP
	-- All others will restore HP.
	
    sets.precast.JA['Vivacious Pulse'] = {
		ammo="Sapience Orb",
		head="Erilaz Galea +1",
		neck="Moonlight Necklace",
		ear1="Cryptic Earring",
		ear2="Friomisi Earring",
		body="Emet Harness +1",
		hands="Kurys Gloves",ring1="Petrov Ring",ring2="Eihwaz Ring",
		back=gear.Ogma.Tank,
		waist="Goading Belt",
		legs="Erilaz leg guards +1",
		feet="Ahosi Leggings"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {waist="Chaac Belt"}
        
    sets.precast.Step = {
		ammo="Yamarang",
        head="Futhark bandeau +3",
		neck="Sanctity Necklace",
		ear1="Dignitary's Earring",
		ear2="Telos Earring",
        body="Ashera Harness",
		hands="Turms Mittens +1",
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
        back=gear.Ogma.Tank,
		waist="Ioskeha Belt +1",
		legs="Meghanada Chausses +2",
		feet="Turms Leggings +1"}
		
    sets.precast.Flourish1 = {waist="Chaac Belt"}

    sets.precast.FC = {
		ammo="Impatiens",
		head="Runeist Bandeau +1",
		neck="Baetyl pendant",
		ear1="Enchanter Earring +1",
		ear2="Etiolation earring",
		
		hands="Leyline gloves",
		ring1="Kishar Ring",
		ring2="Prolix Ring",
		back="Swith Cape +1",
		waist="Witful Belt",
		legs="Ayanmo Cosciales +2",
		feet="Carmine Greaves +1"}		

	sets.precast.FC.Cure = set_combine(sets.precast.FC,{})

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {legs="Futhark Trousers +3", waist="Siegel Sash"})
	
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})
	
	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC, {head="Runeist's bandeau +2",waist="Siegel Sash",legs="Doyen Pants"})

-- Midcast sets

    sets.midcast.FastRecast = set_combine(sets.precast.FC, {
		back=gear.Ogma.Tank})
		
    sets.midcast.Enmity = {
		ammo="Sapience Orb",
		head="Halitus Helm",
		neck="Unmoving Collar +1",
		ear1="Cryptic Earring",
		ear2="Friomisi Earring",
		body="Emet Harness +1",
		hands="Kurys Gloves",
		ring1="Begrudging Ring",
		ring2="Eihwaz Ring",
		back=gear.Ogma.Tank,
		waist="Sinew belt",
		legs="Erilaz leg guards +1",
		feet="Erilaz greaves +1"}

    sets.midcast.Flash = sets.midcast.Enmity
	sets.midcast.BlueMagic =  sets.midcast.Enmity  
	
	sets.midcast.Stun = sets.midcast.Flash

    sets.midcast.Cure = set_combine(sets.midcast.FastRecast, {
		waist="Gishdubar Sash"})
    
	sets.midcast.CureSelf = sets.midcast.Cure

	sets.midcast['Regen'] = set_combine(sets.midcast.Cure, {
		head="Runeist's bandeau +2", legs="Futhark Trousers +3"})
	sets.midcast['Regen II'] = set_combine(sets.midcast.Cure, {
		head="Runeist's bandeau +2", legs="Futhark Trousers +3"})
	sets.midcast['Regen III'] = set_combine(sets.midcast.Cure, {
		head="Runeist's bandeau +2", legs="Futhark Trousers +3"})
	sets.midcast['Regen IV'] = set_combine(sets.midcast.Cure, {
		head="Runeist's bandeau +2", legs="Futhark Trousers +3"})

	sets.midcast['Refresh'] = set_combine(sets.midcast.Cure, {
	head="Erilaz Galea +1",legs="Futhark Trousers +3"})		

    sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast, {
		ammo="Staunch Tathlum +1",
		head="Erilaz Galea +1",neck="Baetyl Pendant",
		hands="Runeist's mittons +3",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		waist="Siegel Sash",feet="Erilaz Greaves +1", legs="Futhark Trousers +3"})
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})
	
	sets.midcast['Temper'] = sets.midcast['Enhancing Magic']
   
   	sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'], {
		ammo="Impatiens",
		head="Futhark Bandeau +3",neck="Loricate Torque +1",
		body="Taeon Tabard",hands="Runeist's mittons +3",ring1="Stikini Ring +1", ring2="Kishar ring",
		back=gear.Ogma.Tank,legs="Taeon Tights",feet="Taeon Boots"})

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring1="Sheltered Ring"})
    sets.midcast.Shell = set_combine(sets.midcast.Protect)
	
	sets.midcast['Divine Magic'] = sets.midcast['Enhancing Magic']

	sets.midcast['Blue Magic'] = set_combine(sets.midcast.Enmity, {
		neck="Unmoving Collar +1",
		hands="Rawhide Gloves",ring1="Stikini Ring +1", ring2="Stikini Ring +1"})


    
-- Idle/resting/defense/etc sets

    sets.resting = {
		ammo="Homiliary",
		head="Rawhide Mask",
		neck="Bathy Choker +1",
		ear1="Odnowa Earring +1",
		ear2="Infused Earring",
        body="Runeist's Coat +3",
		hands="Regal Gauntlets",
		ring1="Stikini Ring +1",
		ring2="Chirich Ring +1",
        back="Moonlight Cape",
		waist="Fucho-no-obi",
		
		feet="Turms Leggings +1"}

    -- Idle sets
	
    sets.idle = {
		ammo="Homiliary",
		head=gear.RefreshHerculeanHelm,
		neck="Loricate torque +1",
		ear1="Odnowa Earring +1",
		ear2="Infused Earring",
        body="Vrikodara jupon",
		hands=gear.RefreshHerculeanGloves,
		ring1="Defending Ring",
		ring2="Stikini Ring +1",
        back="Moonbeam Cape",
		waist="Fucho-no-obi",
		legs=gear.RefreshHerculeanTrousers,
		feet=gear.RefreshHerculeanBoots}

		--	Above set is Engaged DT but with Rawhide Mask and Carmine Pants
		--	See notes on sets.engaged.PDT
		
	sets.idle.PDT = set_combine(sets.idle, {
		back=gear.Ogma.Tank,legs="Ayanmo Cosciales +2"})
		
	sets.idle.MDT = set_combine(sets.idle, {
		ear2="Odnowa Earring +1",
		back=gear.Ogma.Tank,
		waist="Engraved Belt",
		legs="Ayanmo Cosciales +2"})	

    
   
    sets.idle.Weak = sets.idle.PDT

    sets.Kiting = {legs="Carmine Cuisses +1"}

    sets.latent_refresh = set_combine(sets.idle,{
		head=gear.RefreshHerculeanHelm,
		neck="Bathy Choker +1",
		ear1="Odnowa Earring +1",
		ear2="Infused Earring",
        body="Runeist's Coat +3",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
        back="Moonlight Cape",
		waist="Fucho-no-obi",
		legs=gear.RefreshHerculeanTrousers,
		feet=gear.RefreshHerculeanBoots
		})

-- Engaged sets
    sets.engaged = {
    ammo="Ginsen",
    head="Adhemar bonnet",
	neck="Anu torque",
	ear1="Sherida Earring",
	ear2="Cessance Earring",
    body="Adhemar jacket +1",
	hands=gear.AdhemarWristbandsMelee,
	ring1="Chirich ring +1",
	ring2="Epona's ring",
    back="Letalis mantle",
	waist="Ioskeha belt +1",
	legs="Samnuha tights",
	feet=gear.TAHerculeanBoots,
	
	}
    
	-- BIS for engaged is Augmented herc boots with TA

    sets.engaged.Acc = set_combine(sets.engaged, {
    ammo="Yamarang",
	neck="Sanctity Necklace",
	ear2="Telos Earring",
	waist="Ioskeha Belt +1"})
	
	sets.engaged.Refresh = set_combine(sets.engaged, {
		head="Rawhide Mask"})

    sets.engaged.PDT = {
		ammo="Staunch Tathlum +1",  -- 3 DT
		-- Can use Albers strap however gear swapping straps causes TP Loss
        head="Futhark Bandeau +3", neck="Futhark Torque +2",ear1="Tuisto Earring",ear2="Odnowa Earring +1", -- 9 DT
        body="Futhark Coat +3",hands="Turms Mittens +1",ring1="Defending Ring",ring2="Moonlight Ring", -- 27 DT
        back="Moonlight cape",waist="Flume Belt +1",legs="Erilaz Leg Guards +1",feet="Turms leggings +1"} -- 11 DT, 4 PDT
		
		-- Total Current Totals 50 DT, 4 PDT

    sets.engaged.Acc.PDT = set_combine(sets.engaged.PDT, {
		ear2="Telos Earring",
        body="Ashera Harness"})
		
		-- Total Current Totals 50 DT, 4 PDT
	
	sets.engaged.Refresh.PDT = set_combine(sets.engaged.PDT, {
		head="Rawhide Mask"})
		
		-- Total Current Totals 47 DT, 4 PDT
		
	sets.engaged.MDT = {
		ammo="Staunch Tathlum +1",  -- 3 DT
        head="Erilaz Galea +1", neck="Futhark Torque +2",ear1="Ethereal Earring",ear2="Odnowa earring +1", -- 9 DT 2 MDT
        body="Runeist's Coat +3",hands="Erilaz Gauntlets +1",ring1="Defending Ring",ring2="Moonlight Ring +1", -- 27 DT
        back=gear.Ogma.Tank,waist="Flume Belt +1",legs="Erilaz Leg Guards +1",feet="Erilaz Greaves +1"} -- 11 DT

		-- Total Current Totals 50 DT, 3 MDT

    sets.engaged.Acc.MDT = set_combine(sets.engaged.MDT, {})
	
	    -- Acc items already built in the above set
		
	sets.engaged.Refresh.MDT = set_combine(sets.engaged.MDT, {
		head="Rawhide Mask"})

		-- Total Current Totals 47 DT, 3 MDT
		
	sets.engaged.Hybrid = set_combine(sets.engaged, {
		head="Ayanmo Zucchetto +2", -- 3 DT
		body="Ashera Harness",ring1="Defending Ring", -- 17 DT
		legs="Meghanada chausses +2"}) -- Back retains the 5 DT

		-- Total Current Totals 25 DT
	  

    sets.engaged.Acc.Hybrid = set_combine(sets.engaged.Hybrid, {
		ammo="Yamarang",
		neck="Sanctity Necklace",ear2="Telos Earring",
		waist="Ioskeha Belt +1"})	  
		
	sets.engaged.Refresh.Hybrid = set_combine(sets.engaged.Hybrid, {
		head="Rawhide Mask"})

		
-- Weaponskill sets

    sets.precast.WS = {
		ammo="Knobkierrie",
		head="Nyame Helm",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",		
		ring1="Shukuyu Ring",
		ring2="Niqmaddu Ring",
		back=gear.Ogma.WSD,
		waist="Fotia Belt",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
		}
	
	-- WS Default set to Resolution
	
	sets.precast.WS['Dimidiation'] = set_combine(sets.precast.WS, {
		ear1="Odr Earring",
		
		
		back=gear.Ogma.DA,
		waist="Kentarch belt +1",
		})

		
	-- Dimidiation is a single hit WS and therefore the template for all single hit WS
	
	sets.precast.WS['Ground Strike'] = set_combine(sets.precast.WS['Dimidiation'])
    sets.precast.WS['Ground Strike'].Acc = sets.precast.WS['Dimidiation'].Acc
	
	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS['Dimidiation'])
    sets.precast.WS['Savage Blade'].Acc = sets.precast.WS['Dimidiation'].Acc
	
	sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.WS, {
		ammo="Knobkierrie",
		head="Pixie Hairpin +1",neck="Baetyl pendant",ear1="Friomisi Earring",ear2="Novio Earring",
		ring1="Archon Ring",ring2="Epaminondas's Ring",
		waist="Eschan Stone",legs="Herculean Trousers",feet="Herculean Boots"})
    sets.precast.WS['Sanguine Blade'].Acc = set_combine(sets.precast.WS['Sanguine Blade'],{})
	sets.MoveSpeed = {legs="Carmine cuisses +1"}
end

-- Job-specific hooks for standard casting events.
-- Job-specific hooks for standard casting events.

function job_midcast(spell, action, spellMap, eventArgs)
    -- If DefenseMode is active, apply that gear over midcast
    -- choices.  Precast is allowed through for fast cast on
    -- spells, but we want to return to def gear before there's
    -- time for anything to hit us.
    -- Exclude Job Abilities from this restriction, as we probably want
    -- the enhanced effect of whatever item of gear applies to them,
    -- and only one item should be swapped out.
    if state.DefenseMode.value ~= 'None' and spell.type ~= 'JobAbility' then
        handle_equipping_gear(player.status)
        eventArgs.handled = true
    end
end

function job_buff_change(buff, gain)
	if buff == "Doom" or buff == "Curse" then
		if gain then
			equip(sets.Doom)
			send_command('@input /p Doomed.')
			disable('ring1','ring2','waist')
		else
			enable('ring1','ring2','waist')
			handle_equipping_gear(player.status)
		end
	end	
end

-- Called when the player's status changes.
function job_state_change(field, new_value, old_value)

end

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
    update_defense_mode()
end


-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
	if spellMap == 'Cure' and spell.target.type == 'SELF' then
		equip(sets.midcast.CureSelf)
	end
	if EnmityMagic:contains(spell.english) then
			equip(sets.midcast.Enmity)
	end	
	if EnmityBlu:contains(spell.name) then
		equip(sets.midcast.BlueMagic)
	end		
	if spell.english == 'Phalanx' then
			equip(sets.midcast.Phalanx)
	end
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    if state.Buff.Doom then
        idleSet = set_combine(idleSet, sets.buff.Doom)
    end
	if state.Buff.Cover then
        idleSet = set_combine(idleSet, state.Buff.Cover)
    end

    return idleSet
end

-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
    if state.Buff.Doom then
        meleeSet = set_combine(meleeSet, sets.buff.Doom)
    end
	if state.Buff.Cover then
        meleeSet = set_combine(meleeSet, state.Buff.Cover)
    end
   
    return meleeSet
end

function customize_defense_set(defenseSet)
    if state.Buff.Doom then
        defenseSet = set_combine(defenseSet, sets.buff.Doom)
    end
	if state.Buff.Cover then
        defenseSet = set_combine(defenseSet, state.Buff.Cover)
    end

    return defenseSet
end

function display_current_job_state(eventArgs)
    local msg = 'Melee'
    
    if state.CombatForm.has_value then
        msg = msg .. ' (' .. state.CombatForm.value .. ')'
    end
    
    msg = msg .. ': '
    
    msg = msg .. state.OffenseMode.value
    if state.HybridMode.value ~= 'Normal' then
        msg = msg .. '/' .. state.HybridMode.value
    end
    msg = msg .. ', WS: ' .. state.WeaponskillMode.value
    
    if state.DefenseMode.value ~= 'None' then
        msg = msg .. ', Defense: ' .. state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')'
    end
    
    if state.Kiting.value == true then
        msg = msg .. ', Kiting'
    end

    add_to_chat(122, msg)

    eventArgs.handled = true
end

function update_defense_mode()

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(7, 20)
    elseif player.sub_job == 'BLU' then
        set_macro_page(8, 20)
    elseif player.sub_job == 'SAM' then
        set_macro_page(9, 20)
    elseif player.sub_job == 'NIN' then
        set_macro_page(10, 20)
    else
        set_macro_page(7, 20)
    end
		send_command('@wait 5;input /lockstyleset 10')	
end

windower.raw_register_event('outgoing chunk',function(id,original,modified,injected,blocked)
   if not blocked then
      if id == 0x15 then
         if (gearswap.cued_packet or midaction()) and fixed_pos ~= '' and os.time()-fixed_ts < 5 then
               return original:sub(1,4)..fixed_pos..original:sub(17)
         else
               fixed_pos = original:sub(5,16)
               fixed_ts = os.time()
         end
      end
   end
end)
-- Code for equiping movement speed when in motion. I did not write this.
mov = {counter=0}
if player and player.index and windower.ffxi.get_mob_by_index(player.index) then
    mov.x = windower.ffxi.get_mob_by_index(player.index).x
    mov.y = windower.ffxi.get_mob_by_index(player.index).y
    mov.z = windower.ffxi.get_mob_by_index(player.index).z
end
 
moving = false
windower.raw_register_event('prerender',function()
    mov.counter = mov.counter + 1;
    if mov.counter>15 then
        local pl = windower.ffxi.get_mob_by_index(player.index)
        if pl and pl.x and mov.x then
            dist = math.sqrt( (pl.x-mov.x)^2 + (pl.y-mov.y)^2 + (pl.z-mov.z)^2 )
            if dist > 1 and not moving then
                send_command('gs equip sets.MoveSpeed')
      		    moving = true
            elseif dist < 1 and moving then
                send_command('gs c update')
                moving = false
            end
        end
        if pl and pl.x then
            mov.x = pl.x
            mov.y = pl.y
            mov.z = pl.z
        end
        mov.counter = 0
    end
end)
