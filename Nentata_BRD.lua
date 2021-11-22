--[[
	Author: Tewl / Bismark
	Files: BRD.lua 
	Not all of this is my code, some was copied and altered for my own preferences.
	This lua is under alterations periodically, I am in no way finished but wanted to post for backup purposes
	and to share with friends that might be interested or could help with it.
	sets.MoveSpeed should be your movement speed feet that will be equiped while in motion
-]]
function get_sets()
    -- Load Macros
    send_command('input /macro book 20;wait 0.2;input /macro set 1;wait 1;input /lockstyleset 3')

    sets.MoveSpeed = { feet = "Fili cothurnes +1",}    --auto swaps when moving
    send_command('input //equipviewer pos 1603 904')

    -- Augments
    Kali = {}
    Kali.Skill      = { name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',} }
    Kali.MACC       = { name="Kali", augments={'MP+60','Mag. Acc.+20','"Refresh"+1',} }

    

    -- DummySongs
    DummySongs = T{'Knight\'s Minne', 'Knight\'s Minne II'}

    -- Gear sets

 sets.precast = { }
    sets.precast.FastCast = { -- Current: 73% | 80% w/ Kali
        
		main        ={ name="Kali", augments={'DMG:+15','CHR+15','Mag. Acc.+15',}}, --7
		sub         ={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
		head        = "Nahtirah Hat", -- 10
        body        = "Inyanga Jubbah +2", -- 14
        hands       = "Gende. Gages +1", -- 7
        legs        = "Aya. Cosciales +2", -- 5
        neck        = "Orunmila's Torque", -- 5
        waist       = "Pya'ekue belt", -- 5
        left_ear    = "Loquacious Earring", --2
        right_ear   = "Etiolation Earring", --1
        left_ring   = "Weatherspoon Ring", -- 5
        right_ring  = "Kishar Ring", -- 4 
        back        = { name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
    }
    sets.precast.BardSong = set_combine(sets.precast.FastCast,{
        head        = "Fili Calot +1", -- 14 song
		hands       = "Gende. Gages +1",-- 5 song 7FC
		waist       = "Pya'ekue belt", 
		legs        = "Gende. Spats +1",-- 10 song
        feet        = "Telchine Pigaches", -- 13 song
    })
	
    sets.precast.DummySong = set_combine(sets.precast.BardSong,{ 
        range       =  "Daurdabla",
    })
    sets.precast['Nightingale'] = {
        feet        = "Bihu Slippers"
    }
    sets.precast['Troubadour'] = {
        body        = "Bihu Justaucorps +2"
    }
    sets.precast['Soul Voice'] = {
        legs        = "Bihu Cannions"
    }

    sets.midcast = { }
	
	sets.midcast.DummySong = set_combine(sets.precast.BardSong,{ 
        range       =  "Daurdabla",
    })
	
    sets.midcast.BardSong = {        
	    main        = { name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
		sub         = { name="Kali", augments={'DMG:+15','CHR+15','Mag. Acc.+15',}}, --7
        range       = "Gjallarhorn",
        head        = "Fili Calot +1",
        body        = "Fili Hongreline +1",
        hands       = "Fili Manchettes +1",
        legs        = "Inyanga Shalwar +2",
        feet        = "Brioso Slippers +2",
        neck        = "Moonbow Whistle +1",
        waist       = "Luminary Sash",
        left_ring   = "Stikini Ring",
        right_ring  = "Stikini Ring",
        back        = { name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}}
    }

    sets.midcast.Debuff =  {
		main        = "Tauret",
		sub         = { name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
		range       = "Gjallarhorn",
        head        = "Brioso roundlet +2",
		neck        = "Moonbow Whistle +1",
		body        = "Brioso justaucorps +2",
        hands       = "Inyan. Dastanas +2",
		left_ring   = "Stikini Ring",
        right_ring  = "Stikini Ring",
        legs        = "Inyanga shalwar +2",
		waist       = "Eschan Stone",
        feet        = "Brioso slippers +2",
		back        ={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
        
	}
	sets.midcast.Elegy = set_combine(sets.midcast.Debuff,{
		range       = "Gjallarhorn",
        head        = "Brioso roundlet +2",
		neck        = "Moonbow Whistle +1",
		body        = "Brioso justaucorps +2",
        hands       = "Inyan. Dastanas +2",
		left_ring   = "Stikini Ring",
        right_ring  = "Stikini Ring",
        legs        = "Inyanga shalwar +2",
        feet        = "Brioso slippers +2",
		back        ={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
	})
	sets.midcast.Requiem = set_combine(sets.midcast.Debuff,{
	})
    sets.midcast.Threnody = set_combine(sets.midcast.Debuff,{
        body        = "Mousai Manteel"
    })
    sets.midcast.Carol = {
        hands       = "Mousai Gages"
    }
    sets.midcast.Minne = {
        legs        = "Mousai Seraweels"
    }
    sets.midcast.Etude = {
        head        = "Mousai Turban"
    }
    sets.midcast.Mambo = {
        feet        = "Mousai Crackows"
    }
    sets.midcast.Ballad = {
        legs        = "Fili Rhingrave +1"
    }
    sets.midcast.Minuet = {
        body        = "Fili Hongreline +1"
    }
    sets.midcast.March = {
        hands       = "Fili Manchettes +1"
    }
    sets.midcast.Madrigal = {
        head        = "Fili Calot +1"
    }
    sets.midcast.Lullaby = set_combine(sets.midcast.Debuff, {
		range		= "Marsyas",
        hands       = "Brioso Cuffs +2"
    })
    sets.midcast.Paeon = {
        hands       = "Brioso Roundlet +2"
    }

    sets.Weaponskill = { 
        body        = "Ayanmo Corraza +2"
    }
	
	sets.midcast['Enfeebling Magic'] = {        
	    main        = { name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
		sub         = "Genbu's shield",
        range       = "Gjallarhorn",
        head        = "Ayanmo zucchetto +2",
        body        = "Ayanmo corazza +2",
        hands       = "Inyanga dastanas +2",
        legs        = "Inyanga Shalwar +2",
        feet        = "Aya. gambieras +2",
        neck        = "Moonbow Whistle +1",
        waist       = "Eschan stone",
        left_ring   = "Stikini Ring",
        right_ring  = "Stikini Ring",
        back        = { name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}}
    }
	
    sets.aftercast = { }
    sets.aftercast.Idle = {        
		main        = "Aeneas",
        sub         = "Tauret",
		range       = "Gjallarhorn",
        head        = "Nyame Helm",
        body        = "Nyame mail",
        hands       = "Nyame Gauntlets",
        legs        = "Nyame Flanchard",
        feet        = "Nyame Sollerets",
        neck        = "Bathy Choker",
        waist       = "Flume Belt +1",
        left_ear    = "Genmei Earring",
        right_ear   = "Etiolation Earring",
        left_ring   = "Defending Ring",
        right_ring  = "Dark ring",
        back        = "Kumbira cape"
    }
    sets.Engaged = {
	    main        = "Aeneas",
		sub         = "Tauret",
        range       = { name="Linos", augments={'Accuracy+15','"Dbl.Atk."+2','Quadruple Attack +3',}},
        head        = "Aya. Zucchetto +2",
        body        = "Ayanmo Corazza +2",
        hands       = "Nyame Gauntlets",
        legs        = "Nyame Flanchard",
        feet        = "Chironic Slippers",
        neck        = "Bard's charm +1",
        waist       = "Windbuffet Belt +1",
        left_ear    = "Brutal Earring",
        right_ear   = "Suppanomimi",
        left_ring   = "Oneiros Ring", 
        right_ring  = "Ayanmo Ring", 
        back        = { name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dual Wield"+7',}},
    }
    sets.precast.WS = {
        range       = { name="Linos", augments={'Accuracy+11 Attack+11','Weapon skill damage +2%','DEX+7',}},
        head        = "Nyame helm",
        body        = "Bihu Jstcorps. +2",
        hands       = "Nyame gauntlets",
        legs        = "Nyame flanchard",
        feet        = "Nyame sollerets",
        neck        = "Fotia Gorget",
        waist       = "Fotia Belt",
        left_ear    = "Moonshade Earring",
        right_ear   = "Ishvara Earring",
        left_ring   = "Epaminondas's Ring",
        right_ring  = "Karieyh Ring",
        back        = { name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20', 'Weapon skill damage +10%',}},
    }
    
end

    
function precast(spell)
    if spell.action_type == 'Magic' then
        if buffactive.Silence then
            cancel_spell()
            if player.inventory['Echo Drops'] then
                send_command('@input /item "Echo Drops" <me>')
            else
                add_to_chat(123,'Silenced, you are out of Echo Drops!!!')	
            end
            return
        end

        local Precast = sets.precast.FastCast
        if spell.type == 'BardSong' then 
            Precast = sets.precast.BardSong
        end
        if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
            Precast = set_combine(Precast, Offhand)
        end
        if spell.name == 'Honor March' then
            Precast = set_combine(Precast, {range="Marsyas"})
        elseif sets.precast[spell.name] then
            Precast = set_combine(Precast, sets.precast[spell.name])
        elseif DummySongs:contains(spell.name) then
            Precast = set_combine(Precast,sets.precast.DummySong)
        end
        equip(Precast)
    elseif sets.precast[spell.name] then
        equip(sets.precast[spell.name])
    elseif spell.type == 'WeaponSkill' then
        if sets.precast.WS[spell.name] then
            equip(sets.precast.WS[spell.name])
        else
            equip(sets.precast.WS)
        end
    end
end

function midcast(spell)
    if spell.type == 'BardSong' then 
        if DummySongs:contains(spell.name) then
            add_to_chat(121,'--- Singing Dummy Song ---')
            return
        end
        
        local Midcast = sets.midcast.BardSong
        if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
            Midcast = set_combine(Midcast, Offhand)
        end
		if string.find(spell.name,'Elegy') then
            Midcast = set_combine(Midcast,sets.midcast.Elegy)
        elseif string.find(spell.name,'Ballad') then
            Midcast = set_combine(Midcast,sets.midcast.Ballad)
        elseif string.find(spell.name,'Carol') then
            Midcast = set_combine(Midcast,sets.midcast.Carol)
        elseif string.find(spell.name,'Minne') then
            Midcast = set_combine(Midcast,sets.midcast.Minne)
        elseif string.find(spell.name,'Threnody') then
            Midcast = set_combine(Midcast,sets.midcast.Threnody)
        elseif string.find(spell.name,'Mambo') then
            Midcast = set_combine(Midcast,sets.midcast.Mambo)
        elseif string.find(spell.name,'Etude') then
            Midcast = set_combine(Midcast,sets.midcast.Etude)
        elseif string.find(spell.name,'Minuet') then
            Midcast = set_combine(Midcast,sets.midcast.Minuet)
        elseif string.find(spell.name,'Paeon') then
            Midcast = set_combine(Midcast,sets.midcast.Paeon)
        elseif string.find(spell.name,'Scherzo') then
            Midcast = set_combine(Midcast,sets.midcast.Scherzo)
        elseif string.find(spell.name,'March') then
            Midcast = set_combine(Midcast,sets.midcast.March)
            if spell.name == 'Honor March' then 
                Midcast = set_combine(Midcast,{range="Marsyas"})
            end
        elseif string.find(spell.name,'Madrigal') then
            Midcast = set_combine(Midcast,sets.midcast.Madrigal)
        elseif string.find(spell.name,'Lullaby') then
            Midcast = set_combine(Midcast,sets.midcast.Lullaby)
            if spell.name:startswith('Horde') then
                Midcast = set_combine(Midcast,{range="Daurdabla"})
            end
        end
        equip(Midcast)
    end
end

function aftercast(spell)
    goIdle()
end

function status_change(new,old)
    if T{'Idle','Resting','Engaged'}:contains(new) then
        goIdle()
    end
end

function goIdle()
    local Aftercast = sets.aftercast.Idle
    if player.status == 'Engaged' then
        Aftercast = sets.Engaged
    end
    if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
        equip(set_combine(Aftercast,Offhand))
    else
        equip(Aftercast)
    end
end

function self_command(commandArgs)
    if commandArgs == 'goIdle' then
        goIdle()
    end
end

function buff_change(buff,gain)
    if buff == 'silence' and gain then
        if player.inventory['Echo Drops'] then
            send_command('@input /item "Echo Drops" <me>')
        else
            add_to_chat(123,'Silenced, you are out of Echo Drops!!!')	
        end
    end
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
                send_command('gs c goIdle')
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