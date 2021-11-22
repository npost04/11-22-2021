-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
require 'organizer-lib'
-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
	include('Augments.lua')
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
	include('Augments.lua')
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')

    gear.default.weaponskill_waist = "Windbuffet Belt +1"

    select_default_macro_book()
end


-- Define sets and vars used by this job file.
function init_gear_sets()

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
    sets.precast.JA.Bolster = {body="Bagua Tunic"}
    sets.precast.JA['Life Cycle'] = {head="Azimuth Hood +1", body="Geomancy Tunic +2"}
    sets.precast.JA['Full Circle'] = {hands="Bagua Mitaines +1"}
    sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals"}

    -- Fast cast sets for spells

    sets.precast.FC = {
		main="Solstice", --5
		sub="Genmei shield",
        range="Dunna", --3
        head=gear.SallyFCMerlinicHood, --13
		neck="Baetyl pendant", --4
    	ear2="Etiolation Earring", --1
        body=gear.SallyFCMerlinicJubbah, --13
		hands=gear.SallyFCMerlinicDastanas, --5
        ring1="Weatherspoon Ring", --5
		ring2="Kishar Ring", --4
        back=gear.SallyFCGeo, --10
        waist="Cetl Belt",
        legs="Geomancy Pants +2", --13
        feet=gear.SallyFCMerlinicCrackows --10
    }

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
        
    })

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {
        neck="Stoicheion Medal",
        hands="Bagua Mitaines +1",
    })

    
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        sub="Genmei shield",
		head="Nyame Helm",
        neck="Lissome Necklace",
        ear1="Telos Earring",
        ear2="Brutal Earring",
        body="Nyame mail",
		hands="Nyame Gauntlets",
        ring1="Rajas Ring",
        ring2="Cacoethic ring",
        back="Kayapa Cape",
        waist="Cetl Belt",
		legs="Nyame Flanchard",
		feet="Nyame sollerets"
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
        legs="Geomancy Pants +2", -- 10%
	    feet="Helios boots"
    }

    sets.midcast.Geomancy = {
	
		main="Idris",
		sub="Genmei Shield",
        range="Dunna", 
        head="Azimuth Hood +1",
		neck="Bagua Charm +2",
		ear1="Gifted Earring",
		ear2="Magnetic earring",
		body="Psycloth Vest",
        hands="Shrieker's cuffs",
		ring1="Stikini ring",
		ring2="Stikini ring",	
        back="Lifestream Cape",
		waist="Austerity belt +1",
        legs="Azimuth tights",
        feet={ name="Merlinic Crackows", augments={'Mag. Acc.+27','"Conserve MP"+6','INT+7',}},
		--feet="Medium's sabots"
    }

    sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {
		
        legs="Bagua Pants",
		feet="Azimuth gaiters +1"
    })

    sets.midcast.Cure = {
        main="Daybreak", --30
        sub="Sors Shield", --3
		neck="Incanter's torque",
        body="Vrikodara jupon", --13
		hands="Revealer's mitts", --13
        ring1="Haoma Ring",
        ring2="Sirona's Ring",
		waist="Austerity belt +1",
        back="Swith Cape +1",
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+27','"Conserve MP"+6','INT+7',}},
		}
    
    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast.Protectra = {ring1="Sheltered Ring"}

    sets.midcast.Shellra = {ring1="Sheltered Ring"}

    sets.midcast.HighTierNuke = {
        main="Daybreak",
        ammo="Witchstone",
        head="Jhakri coronal +2",
        neck="Eddy Necklace",
        ear1="Hecate's Earring",
        ear2="Friomisi Earring",
        body="Jhakri robe +2",
        hands="Jhakri cuffs +2",
        ring1="Acumen Ring",
        ring2="Strendu Ring",
        back=gear.SallyNukeGeo,
        waist="Yamabuki-no-obi", 
        legs="Jhakri slops +2", -- "Azimuth Tights"
        feet="Jhakri Pigaches +2"
    }
    
    sets.midcast.HighTierNuke.Resistant = set_combine(sets.midcast.HighTierNuke, {
	main="Daybreak",
        ammo="Witchstone",
        head="Jhakri coronal +2",
        neck="Eddy Necklace",
        ear1="Hecate's Earring",
        ear2="Friomisi Earring",
        body="Jhakri robe +2",
        hands="Jhakri cuffs +2",
        ring1="Acumen Ring",
        ring2="Mujin Band",
        back="Toro Cape",
        waist="Yamabuki-no-obi", 
        legs="Jhakri slops +2", -- "Azimuth Tights"
        feet="Jhakri Pigaches +2"
    })

    sets.precast.JA['Concentric Pulse'] = sets.midcast.HightTierNuke

    sets.midcast.LowTierNuke = set_combine(sets.midcast.HighTierNuke, {
		main="Oranyan",
		head="Jhakri Cornal +2",
		neck="Eddy necklace",
		ear1="Friomisi earring",
		ear2="Hecates earring",
		body="Shamash robe",
		hands="Jhakri cuffs +2",
		ring1="Locus ring",
		ring2="Acumen Ring",
		legs="Jhakri slops +2",
		feet="Jhakri pigaches +2"
    })
    
    sets.midcast.LowTierNuke.Resistant = set_combine(sets.midcast.LowTierNuke, {
        ear1="Psystorm Earring", 
        ear2="Lifestorm Earring",
		ring1="Weather. Ring",
        ring2="Sangoma Ring"
    })

    sets.midcast.Macc = { 
        main="Maxentius",
		sub="Amurrapi shield",
        ammo="Dunna",
        head="Mall. Chapeau +2",
		body="Mallquis saio +2",
		lear="Barkarole Earring", 
        rear="Malignance Earring",
        hands="Mallquis cuffs +2",
        neck="Incanter's torque", 
        ring1="Weatherspoon ring", 
        ring2="Stikini Ring",
		back=gear.SallyNukeGeo,
        waist="Eschan stone",
		legs="Mallquis trews +2",
		feet="Mallquis clogs +2"
    }
    
    sets.midcast.Aspir = set_combine(sets.midcast.Macc, { 
        head="Bagua Galero",
        neck="Dark Torque", 
        ring1="Excelsis Ring",
        body="Geomancy tunic +2",
        waist="Casso Sash",
        --legs="Azimuth Tights",
    })
    sets.midcast.Drain = sets.midcast.Aspir
    sets.midcast.Stun = {
		main="Maxentius", --40Macc/15INT/250MaccSkill
		sub="Genmei Shield",
		range="Dunna", --10Macc
		head="Jhakri Coronal +2",
		neck="Bagua charm +2",
		body="Jhakri Robe +2",
		hands="Jhakri Cuffs +2",
		legs="Geomancy Pants +2",
		feet="Jhakri Pigaches +2",
		waist="Eschan Stone",
		left_ear="Barkaro. Earring",
		right_ear="Etiolation Earring",
		left_ring="Weatherspoon Ring",
		right_ring="Stikini Ring",
		back=gear.SallyFCGeo
	}
	
    
    sets.midcast['Enfeebling Magic'] = set_combine(sets.midcast.Macc, {
        main="Solstice",
		sub="Amurrapi shield",
        ammo="Dunna",
        head="Mallquis chapeau +1",
		body="Mallquis saio +2",
		lear="Barkarole Earring", 
        rear="Malignance Earring",
        hands="Mallquis cuffs +1",
        neck="Incanter's torque", 
        ring1="Stikini ring", 
        ring2="Kishar Ring",
        waist="Eschan stone",
		legs="Mallquis trews +1",
		feet="Mallquis clogs +1"
    })
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast.Macc, {
        waist="Casso Sash",
        back="Lifestream Cape",
        lring="Globidonta Ring",
        feet="Bagua Sandals"
    })

	sets.midcast['Enhancing Magic'] = {
        --sub="Fulcio Grip", 
        --neck="Colossus's Torque", 
        --body="Anhur Robe",
        --hands="Ayao's Gloves"
	}
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    -- Resting sets
    sets.resting = {
        neck="Twilight Torque",
        body="Jhakri robe +2",
        hands="Geomancy Mitaines +2",
        ring1="Dark Ring",
        ring2="Paguroidea Ring",
        waist="Austerity Belt +1",
		legs="Assid. pants +1",
    }


    -- Idle sets
    sets.idle = {
        main="Daybreak",
        sub="Genmei Shield",
        range="Dunna",
        head="Befouled crown",
        neck="Loricate Torque +1",
        ear1="Moonshade Earring",
        ear2="Etiolation Earring",
        body="Jhakri robe +2",
        hands="Bagua Mitaines +1",
        ring1="Vocane Ring",
        ring2="Defending Ring",
        back=gear.SallyIdleGeoPet,
        waist="Fucho-no-Obi",
        legs="Assid. pants +1",
        feet=gear.SallyRefreshMerlinicCrackows
    }
    sets.idle.PDT = set_combine(sets.idle, {
		main="Malignance pole",
        neck="Loricate Torque +1",
		ring1="Vocane ring",
        ring2="Defending Ring",
        back=gear.SallyIdleGeoPet,
		
    })

    -- .Pet sets are for when Luopan is present.
    sets.idle.Pet = set_combine(sets.idle, {
		main="Idris",
		sub="Genmei Shield", --10
        head="Nyame Helm", --7
		neck="Loricate torque +1",
		ear1="Moonshade earring",
		ear2="Etiolation earring",
		body="Jhakri Robe +2",
		hands="Geomancy Mitaines +2",
		ring1="Vocane ring",
		ring2="Defending Ring",
        back=gear.SallyIdleGeoPet,
		waist="Isa belt",
		legs="Assid. Pants +1",
        feet="Nyame sollerets"
    })

    sets.idle.PDT.Pet = set_combine(sets.idle.Pet, {
		ring1="Vocane Ring",
        ring2="Defending Ring",
    })


    sets.idle.Town = sets.idle

    sets.idle.Weak = sets.idle

    -- Defense sets

    	
	sets.defense.PDT = {
		main="Idris",
		sub="Genmei shield",
		head="Nyame Helm",
        neck="Loricate torque +1",
        ear1="Telos Earring",
        ear2="Brutal Earring",
        body="Nyame mail",
		hands="Nyame Gauntlets",
        ring1="Rajas Ring",
        ring2="Defending Ring",
		back=gear.SallyIdleGeoPet,
        legs="Nyame Flanchard",
		feet="Nyame sollerets"
		
    }
	

    sets.defense.MDT = {
        main="Idris",
		sub="Genmei shield",
		head="Nyame Helm",
        neck="Loricate torque +1",
        ear1="Telos Earring",
        ear2="Brutal Earring",
        body="Nyame mail",
		hands="Nyame Gauntlets",
        ring1="Rajas Ring",
        ring2="Defending Ring",
		back=gear.SallyIdleGeoPet,
        legs="Nyame Flanchard",
		feet="Nyame sollerets"
        
    }

    sets.MoveSpeed = {feet="Geomancy Sandals +2"}

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
        main="Idris",
		sub="Genmei shield",
		head="Nyame Helm",
        neck="Lissome Necklace",
        ear1="Telos Earring",
        ear2="Brutal Earring",
        body="Nyame mail",
		hands="Nyame Gauntlets",
        ring1="Rajas Ring",
        ring2="Cacoethic ring",
        back="Kayapa Cape",
        waist="Cetl Belt",
		legs="Nyame Flanchard",
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
    set_macro_page(1, 1)
end

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