-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
require 'organizer-lib'
-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    indi_timer = ''
    indi_duration = 180
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')

    gear.default.weaponskill_waist = "Windbuffet Belt +1"

    select_default_macro_book()
end


-- Define sets and vars used by this job file.
function init_gear_sets()
	include('Augments.lua')
	
    lowTierNukes = S{'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder',
        'Stone II', 'Water II', 'Aero II', 'Fire II', 'Blizzard II', 'Thunder II',
        'Stone III', 'Water III', 'Aero III', 'Fire III', 'Blizzard III', 'Thunder III',
        'Stonega', 'Waterga', 'Aeroga', 'Firaga', 'Blizzaga', 'Thundaga', 
        'Stonera', 'Watera', 'Aerora', 'Fira', 'Blizzara', 'Thundara',
        'Stonega II', 'Waterga II', 'Aeroga II', 'Firaga II', 'Blizzaga II', 'Thundaga II'}

		sets.goldnq={
head="Shaded specs.",
neck="Goldsm. Torque",
body="Goldsmith's smock",
ring1="Artificer's ring",
ring2="Goldsmith's ring",
back="Shaper's shawl"}

sets.goldhq={
head="Shaded specs.",
neck="Goldsm. Torque",
body="Goldsmith's smock",
ring1="Artificer's ring",
ring2="Craftmaster's ring",
back="Shaper's shawl"}

   --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA.Bolster = {body="Bagua Tunic +1"}
    sets.precast.JA['Life Cycle'] = {head="Azimuth Hood +1", body="Geomancy Tunic"}
    sets.precast.JA['Full Circle'] = {hands="Bagua Mitaines +1"}
    sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals"}

    -- Fast cast sets for spells

    sets.precast.FC = {
		main=gear.SolsticeFC,
        range="Dunna",
        head=gear.FCMerlinicHood,
		neck="Orunmila's torque",
    	ear1="Loquacious earring",
        ear2="Malignance Earring",
		--body="",
		--hands="",
        ring1="Prolix Ring",
     	back="Swith Cape +1",
        waist="Witful Belt",
        legs="Geomancy Pants +1",
        feet=gear.FCMerlinicCrackows
    }

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
        --main="Tamaxchi",
        --sub="Genbu's Shield",
        --back="Pahtli Cape"
    })

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {
        neck="Stoicheion Medal",
        hands="Bagua Mitaines +1",
    })

    
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Nahtirah Hat",
        neck=gear.ElementalGorget,
        ear1="Bladeborn Earring",
        ear2="Steelflash Earring",
        body="Vanir Cotehardie",
        hands="Yaoyotl Gloves",
        ring1="Karieyh Ring",
        ring2="Ifrit Ring +1",
        back="Buquwik Cape",
        waist=gear.ElementalBelt,
        legs="Hagondes Pants",
        feet="Hagondes Sabots"
    }

    sets.precast.WS['Flash Nova'] = {
        --ammo="Dosis Tathlum",
        head="Hagondes Hat",
        neck="Eddy Necklace",
        ear1="Friomisi Earring",
        ear2="Crematio Earring",
        body="Hagondes Coat",
        hands="Yaoyotl Gloves",
        ring1="Acumen Ring",
        ring2="Strendu Ring",
        back="Toro Cape",
        waist="Snow Belt",
        legs="Hagondes Pants",
        feet="Hagondes Sabots"
    }

    sets.precast.WS['Starlight'] = {ear2="Moonshade Earring"}

    sets.precast.WS['Moonlight'] = {ear2="Moonshade Earring"}


    --------------------------------------
    -- Midcast sets
    --------------------------------------

    -- Base fast recast for spells
    sets.midcast.FastRecast = {
        ear2="Loquacious Earring",
        body="Helios Jacket", -- 3%
        hands="Helios gloves", -- 3%
        ring1="Prolix Ring",
	ring2="Weather. ring",
        back="Swith cape +1",
        waist="Witful Belt", -- 4%
        legs="Geomancy Pants +1", -- 10%
	feet="Helios boots"
    }

    sets.midcast.Geomancy = {
		main=gear.SolsticeFC,
        range="Dunna", 
        head="Azimuth Hood +1", -- 10
		neck="Incanter's torque", --10
		ear1="Ethereal earring",
		ear2="Gifted earring",
		body="Bagua Tunic +1", -- 12
        hands="Geomancy Mitaines +2", -- 15
		ring1="Stikini ring",
		back=gear.HeeroGeoCape,
		legs="Azimuth tights",
        feet="Azimuth gaiters +1"
    }

    sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {
        legs="Bagua Pants",
		feet="Azimuth gaiters +1"
    })

    sets.midcast.Cure = sets.midcast.FastRecast
        --main="Tamaxchi",
        --sub="Genbu's Shield",
        --body="Heka's Kalasiris",
        --ring1="Haoma Ring",
        --ring2="Sirona's Ring",
        --back="Swith Cape +1",
        --legs="Nares Trews",
        --feet="Hagondes Sabots"
    
    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast.Protectra = {ring1="Sheltered Ring"}

    sets.midcast.Shellra = {ring1="Sheltered Ring"}

    sets.midcast.HighTierNuke = {
        main=gear.SolsticeMAB,
        sub="Culminus",
        ammo="Witchstone",
        head=gear.BurstMerlinicHood,
        neck="Mizu. Kubikazari",
        ear1="Hecate's Earring",
        ear2="Friomisi Earring",
        body="Shamash Robe",
        hands="Amalric Gages",
        ring1="Acumen Ring",
        ring2="Mujin band",
        back="Toro Cape",
        waist="Yamabuki-no-obi", 
        legs=gear.BurstMerlinicShalwar,
        feet=gear.BurstMerlinicCrackows
    }
    
    sets.midcast.HighTierNuke.Resistant = set_combine(sets.midcast.HighTierNuke, {
	main={ name="Lehbrailg +2", augments={'DMG:+15','Elem. magic skill +6','Mag. Acc.+20',}},
        ear1="Psystorm Earring",
        ear2="Lifestorm Earring",
        ring1="Weather. Ring",
        ring2="Sangoma Ring",
        --feet="Bokwus Boots"
    })

    sets.precast.JA['Concentric Pulse'] = sets.midcast.HightTierNuke

    sets.midcast.LowTierNuke = set_combine(sets.midcast.HighTierNuke, {
	main={ name="Lehbrailg +2", augments={'DMG:+15','Elem. magic skill +6','Mag. Acc.+20',}},
	head="Buremte hat",
        ring2="Acumen Ring"
    })
    
    sets.midcast.LowTierNuke.Resistant = set_combine(sets.midcast.LowTierNuke, {
        ear1="Psystorm Earring", 
        ear2="Lifestorm Earring",
	ring1="Weather. Ring",
        ring2="Sangoma Ring"
    })

    sets.midcast.Macc = { 
        main=gear.SolsticeFC,
        sub="Cumulus", 
        ammo="Dunna",
        head=gear.FCMerlinicHood,
        neck="Eddy Necklace", 
        lear="Lifestorm Earring", 
        rear="Psystorm Earring",
        body="Shamash robe",
        hands="Geomancy Mitaines +2",
        ring1="Weather. Ring", 
        ring2="Sangoma Ring",
        waist="Yamabuki-no-obi",
		legs="Jhakri slops +1",
		feet=gear.FCMerlinicCrackows
    }
    
    sets.midcast.Aspir = set_combine(sets.midcast.Macc, { 
        head="Bagua Galero",
        neck="Dark Torque", 
        ring1="Excelsis Ring",
        body="Geomancy tunic +1",
        waist="Casso Sash",
        --legs="Azimuth Tights",
    })
    sets.midcast.Drain = sets.midcast.Aspir
    sets.midcast.Stun = {
		main=gear.SolsticeFC,
		sub="Genbu's shield",
		range="Dunna",
		
	}
    
    sets.midcast['Enfeebling Magic'] = set_combine(sets.midcast.Macc, {
        waist="Casso Sash",
        back={ name="Lifestream Cape", augments={'Geomancy Skill +3','Pet: Damage taken -3%','Damage taken-4%',}},
        lring="Globidonta Ring",
        feet="Bagua Sandals"
    })
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast.Macc, {
        waist="Casso Sash",
        back={ name="Lifestream Cape", augments={'Geomancy Skill +3','Pet: Damage taken -3%','Damage taken-4%',}},
        lring="Globidonta Ring",
        feet="Bagua Sandals"
    })

	sets.midcast['Enhancing Magic'] = sets.midcast.Macc
        --sub="Fulcio Grip", 
        --neck="Colossus's Torque", 
        --body="Anhur Robe",
        --hands="Ayao's Gloves"
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    -- Resting sets
    sets.resting = {
        neck="Twilight Torque",
        body="Azimuth Coat",
        hands="Geomancy Mitaines +2",
        ring1="Dark Ring",
        ring2="Paguroidea Ring",
        --waist="Austerity Belt",
	legs="Assid. pants +1",
    }


    -- Idle sets
    sets.idle = {
        main="Daybreak",
        sub="Genbu's Shield",
        range="Dunna",
        head="Befouled Crown",
        neck="Loricate torque +1",
        ear1="Ethereal Earring",
        ear2="Infused Earring",
        body="Shamash Robe",
        hands="Bagua Mitaines +1",
        ring1="Vocane Ring",
        ring2="Defending Ring",
		--back="Mecisto. Mantle",
        back=gear.HeeroIdleGeoCape,
        waist="Fucho-no-Obi",
        legs="Assid. pants +1",
        feet="Geomancy Sandals +2"
    }
    sets.idle.PDT = set_combine(sets.idle, {
        head="Hagondes hat",
		neck="Loricate torque +1",
		body="Shamash robe",
        hands="Geomancy Mitaines +2",
	    ring1="Defending ring",
        ring2="Vocane Ring",
		back="Mecisto. Mantle",
        --back=gear.HeeroIdleGeoCape,
		feet="Azimuth gaiters +1"
    })

    -- .Pet sets are for when Luopan is present.
    sets.idle.Pet = set_combine(sets.idle, {
		main=gear.SolsticeFC,
		sub="Genbu's shield",
        head="Nyame helm",
		neck="Loricate torque +1",
		lear="Ethereal Earring",
		rear="Handler's earring +1",
		body="Shamash robe",
        hands="Geomancy Mitaines +2",
		lring="Thurandaut ring",
		rring="Defending ring",
		back=gear.HeeroIdleGeoCape,
		waist="Isa belt",
		legs="Nyame flanchard",
        feet="Nyame sollerets"
    })

    sets.idle.PDT.Pet = set_combine(sets.idle.Pet, {
        })

    -- .Indi sets are for when an Indi-spell is active.
    
    sets.idle.Town = sets.idle

    sets.idle.Weak = sets.idle

    -- Defense sets

    sets.defense.PDT = {
        range="Dunna",
        head="Hike Khat",
        neck="Twilight Torque",
        ear1="Ethereal Earring",
        body="Hagondes coat",
        hands="Geomancy Mitaines +2",
        ring1="Defending Ring",
        ring2="Dark Ring",
        back="Umbra Cape",
        legs="Hagondes Pants +1",
        feet="Hagondes Sabots"
    }

    sets.defense.MDT = {
        range="Dunna",
        head="Nahtirah Hat",
        neck="Wiglen Gorget",
        ear1="Zennaroi Earring",
        ear2="Loquacious Earring",
        body="Azimuth Coat",
        hands="Geomancy Mitaines +2",
        ring1="Defending Ring",
        ring2="Shadow Ring",
        back="Umbra Cape",
        waist="Yamabuki-no-Obi",
        --legs="Bokwus Slops",
        --feet="Hagondes Sabots"
    }

    sets.Kiting = {feet="Geomancy sandals +2"}

    sets.latent_refresh = {waist="Fucho-no-obi"}


    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {
        range="Dunna",
		head="Nyame helm",
        neck="Lissome necklace",
        ear1="Cessance earring",
        ear2="Brutal Earring",
        body="Nyame mail",        
        hands="Nyame gauntlets",
        ring1="Chirich ring",
        ring2="Chirich Ring +1",
        back="Moonbeam cape",
        waist="Windbuffet Belt +1",
        legs="Nyame flanchard",
        feet="Nyame sollerets"
    }

    --------------------------------------
    -- Custom buff sets
		
		
end
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

function job_aftercast(spell, action, spellMap, eventArgs)
    if not spell.interrupted then
        if spell.english:startswith('Indi') then
            if not classes.CustomIdleGroups:contains('Indi') then
                classes.CustomIdleGroups:append('Indi')
            end
            send_command('@timers d "'..indi_timer..'"')
            indi_timer = spell.english
            send_command('@timers c "'..indi_timer..'" '..indi_duration..' down spells/00136.png')
        elseif spell.english == 'Sleep' or spell.english == 'Sleepga' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 60 down spells/00220.png')
        elseif spell.english == 'Sleep II' or spell.english == 'Sleepga II' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 90 down spells/00220.png')
        end
    elseif not player.indi then
        classes.CustomIdleGroups:clear()
    end
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------
function job_status_change(newStatus, oldStatus, eventArgs)
    if newStatus == 'Engaged' then
        -- nothing yet
   -- elseif newStatus == 'Idle' then
   --     determine_idle_group()
    end
end

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if player.indi and not classes.CustomIdleGroups:contains('Indi')then
        classes.CustomIdleGroups:append('Indi')
        handle_equipping_gear(player.status)
    elseif classes.CustomIdleGroups:contains('Indi') and not player.indi then
        classes.CustomIdleGroups:clear()
        handle_equipping_gear(player.status)
    end
end

function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','range')
        else
            enable('main','sub','range')
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if spell.skill == 'Enfeebling Magic' then
            if spell.type == 'WhiteMagic' then
                return 'MndEnfeebles'
            else
                return 'IntEnfeebles'
            end
        elseif spell.skill == 'Geomancy' then
            if spell.english:startswith('Indi') then
                return 'Indi'
            end
        elseif spell.skill == 'Elemental Magic' and default_spell_map ~= 'ElementalEnfeeble' then
            if lowTierNukes:contains(spell.english) then
                return 'LowTierNuke'
            else
                return 'HighTierNuke'
            end
        end

    end
end

function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    return idleSet
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    classes.CustomIdleGroups:clear()
    if player.indi then
        classes.CustomIdleGroups:append('Indi')
    end
end

-- Handle zone specific rules
windower.register_event('Zone change', function(new,old)
    determine_idle_group()
end)

function determine_idle_group()
    classes.CustomIdleGroups:clear()
    if areas.Adoulin:contains(world.area) then
    	classes.CustomIdleGroups:append('Adoulin')
    end
end

-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 18)
end
