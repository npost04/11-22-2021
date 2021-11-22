-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job. Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
-- Initialization function for this job file.
require 'organizer-lib'
function get_sets()
mote_include_version = 2
-- Load and initialize the include file.
include('Mote-Include.lua')
end
-- Setup vars that are user-independent. state.Buff vars initialized here will automatically be tracked.
function job_setup()
state.Buff.Migawari = buffactive.migawari or false
state.Buff.Doom = buffactive.doom or false
state.Buff.Yonin = buffactive.Yonin or false
state.Buff.Innin = buffactive.Innin or false
state.Buff.Futae = buffactive.Futae or false
determine_haste_group()
end
-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job. Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------
-- Setup vars that are user-dependent. Can override this function in a sidecar file.
function user_setup()
state.OffenseMode:options('Normal', 'Acc', 'MultiHit', 'MultiHitAcc')
state.HybridMode:options('Normal', 'Evasion', 'PDT')
state.WeaponskillMode:options('Normal', 'Acc', 'Mod')
state.CastingMode:options('Normal', 'Resistant')
state.PhysicalDefenseMode:options('PDT', 'Evasion')
gear.MovementFeet = {name="Danzo Sune-ate"}
gear.DayFeet = "Danzo Sune-ate"
gear.NightFeet = "Ninja Kyahan +1"

gear.FCTaeonGloves = { name="Taeon Gloves", augments={'Mag. Acc.+12 "Mag.Atk.Bns."+12','"Fast Cast"+5','Phalanx +1',}}
gear.FCTaeonBoots = { name="Taeon Boots", augments={'"Mag.Atk.Bns."+19','"Fast Cast"+5','DEX+5',}}
gear.TPTaeonGloves = { name="Taeon Gloves", augments={'Accuracy+25','"Triple Atk."+2','STR+4',}}
gear.TPTaeonBoots = { name="Taeon Boots", augments={'Accuracy+16 Attack+16','"Dual Wield"+5','DEX+3',}}

select_movement_feet()
select_default_macro_book()
end
-- Define sets and vars used by this job file.
function init_gear_sets()
--------------------------------------
-- Precast sets
--------------------------------------
-- Precast sets to enhance JAs
sets.precast.JA['Mijin Gakure'] = {legs="Mochizuki Hakama"}
sets.precast.JA['Futae'] = {legs="Iga Tekko +2"}
sets.precast.JA['Sange'] = {legs="Mochizuki Chainmail"}

-- Waltz set (chr and vit)
sets.precast.Waltz = {ammo="Sonia's Plectrum",
head="Felistris Mask",
body="Hachiya Chainmail",
hands="Buremte Gloves",
ring1="Spiral Ring",
back="Iximulew Cape",
waist="Caudata Belt",
legs="Nahtirah Trousers",
feet="Otronif Boots +1"}
-- Uk'uxkaj Cap, Daihanshi Habaki

-- Don't need any special gear for Healing Waltz.
sets.precast.Waltz['Healing Waltz'] = {}

-- Set for acc on steps, since Yonin drops acc a fair bit
sets.precast.Step = {
head="Whirlpool Mask",
neck="Ej Necklace",
body="Otronif Harness +1",
hands="Buremte Gloves",
ring1="Patricius Ring",
back="Yokaze Mantle",
waist="Chaac Belt",
legs="Manibozho Brais",
feet="Otronif Boots +1"}

sets.precast.Flourish1 = {waist="Chaac Belt"}

-- Fast cast sets for spells
sets.precast.FC = {
ammo="Impatiens",
ear1="Loquacious Earring",
ear2="Enchanter earring +1",
hands=gear.FCTaeonGloves,
ring1="Prolix Ring",
ring2="Weatherspoon ring",
feet=gear.FCTaeonBoots}

sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Mochizuki Chainmail"})

-- Snapshot for ranged
sets.precast.RA = {hands="Manibozho Gloves",legs="Nahtirah Trousers",feet="Wurrukatte Boots"}

-- Weaponskill sets

-- Default set for any weaponskill that isn't any more specifically defined
sets.precast.WS = {
ammo="Yetshila",
head="Taeon Chapeau",
neck="Fotia Gorget",
ear1="Bladeborn Earring",
ear2="Steelflash Earring",
body="Khepri jacket",
hands=gear.TPTaeonGloves,
ring1="Oneiros Ring",
ring2="Epona's Ring",
back="Letalis Mantle",
waist="Fotia belt",
legs="Taeon tights",
feet=gear.TPTaeonBoots}

sets.precast.WS.Acc = set_combine(sets.precast.WS, {hands="Buremte Gloves",
back="Yokaze Mantle"})

-- Specific weaponskill sets. Uses the base set if an appropriate WSMod version isn't found.

sets.precast.WS['Blade: Jin'] = set_combine(sets.precast.WS,
{head="Uk'uxkaj cap",neck="Rancor Collar",ear1="Brutal Earring",ear2="Moonshade Earring",hands="Seiryu's kote",legs="Kaabnax trousers",feet="Manibozho boots"})

sets.precast.WS['Blade: Hi'] = set_combine(sets.precast.WS,
{head="Uk'uxkaj cap",
neck="Rancor collar",
ear1="Brutal earring",
ear2="Moonshade earring",
body="Khepri jacket",
hands=gear.TPTaeonGloves,
ring1="Stormsoul Ring",
legs="Byakko's haidate",
feet=gear.TPTaeonBoots})

sets.precast.WS['Blade: Shun'] = {
ammo="Yetshila",
head="Uk'uxkaj cap",
neck="Fotia Gorget",
ear1="Moonshade Earring",
ear2="Brutal Earring",
body="Taeon Tabard",
hands=gear.TPTaeonGloves,
ring1="Enlivened Ring",
ring2="Mars's Ring",
back="Kayapa cape",
waist="Fotia belt",
legs="Byakko's haidate",
feet=gear.TPTaeonBoots
}

sets.precast.WS['Aeolian Edge'] = {
head="Wayfarer Circlet",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Moonshade Earring",
body="Wayfarer Robe",hands="Wayfarer Cuffs",ring1="Acumen Ring",ring2="Demon's Ring",
back="Toro Cape",waist="Thunder Belt",legs="Shneddick Tights +1",feet="Daihanshi Habaki"}

--------------------------------------
-- Midcast sets
--------------------------------------
sets.midcast.FastRecast = {
ear1="Enchanter earring +1",
ear2="Loquacious Earring",
body="Taeon Tabard",
hands=gear.FCTaeonGloves,
ring1="Prolix Ring",
ring2="Weather. Ring",
legs="Hachiya Hakama",
feet=gear.FCTaeonBoots}

sets.midcast.Utsusemi = {ammo="Impatiens",
head="Athos's chapeau",
ear1="Loquacious Earring",
ear2="Enchanter earring +1",
body="Taeon Tabard",
hands=gear.FCTaeonGloves,
ring1="Prolix Ring",
ring2="Weatherspoon ring",
waist="Goading belt",
legs="Wukong's hakama +1",
feet="Iga Kyahan +2"}

sets.midcast.ElementalNinjutsu = {
head="Hachiya Hatsuburi",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Hecate's Earring",
body="Taeon Tabard",hands=gear.FCTaeonGloves,ring1="Arvina Ringlet +1",ring2="Acumen Ring",
back="Toro Cape",waist=gear.ElementalObi,legs="Nahtirah Trousers",feet=gear.FCTaeonBoots}

sets.midcast.ElementalNinjutsu.Resistant = set_combine(sets.midcast.Ninjutsu, {ear1="Enchanter Earring +1",ear2="Gwati Earring",
ring1="Sangoma ring", ring2="Weatherspoon ring",
back="Yokaze Mantle"})

sets.midcast.NinjutsuDebuff = {
head="Hachiya Hatsuburi",neck="Stoicheion Medal",ear1="Lifestorm Earring",ear2="Psystorm Earring",
hands="Mochizuki Tekko",ring2="Sangoma Ring",
back="Yokaze Mantle",feet="Hachiya Kyahan"}

sets.midcast.NinjutsuBuff = {head="Hachiya Hatsuburi",neck="Ej Necklace",back="Yokaze Mantle"}

sets.midcast.RA = {
head="Felistris Mask",neck="Ej Necklace",
body="Hachiya Chainmail +1",hands="Hachiya Tekko",ring1="Beeline Ring",
back="Yokaze Mantle",legs="Nahtirah Trousers",feet="Qaaxo Leggings"}
-- Hachiya Hakama/Thurandaut Tights +1

--------------------------------------
-- Idle/resting/defense/etc sets
--------------------------------------
-- Resting sets

sets.resting = {head="Ocelomeh Headpiece +1",neck="Wiglen Gorget",
ring1="Sheltered Ring",ring2="Paguroidea Ring"}

-- Idle sets

sets.idle = {
head="Ocelomeh Headpiece +1",neck="Wiglen Gorget",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Khepri Jacket",hands="Nomkahpa mittens +1" ,ring1="Sheltered Ring",ring2="Paguroidea Ring",
back="Repulse mantle",waist="Flume Belt +1",legs="Mochizuki Hakama",feet=gear.MovementFeet}


sets.idle.Weak = {
head="Whirlpool Mask",neck="Wiglen Gorget",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Hachiya Chainmail +1",hands="Otronif Gloves",ring1="Sheltered Ring",ring2="Paguroidea Ring",
back="Shadow Mantle",waist="Flume Belt +1",legs="Hachiya Hakama",feet=gear.MovementFeet}

-- Defense sets

sets.defense.Evasion = {
head="Felistris Mask",neck="Ej Necklace",
body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Beeline Ring",
back="Yokaze Mantle",waist="Flume Belt +1",legs="Nahtirah Trousers",feet="Otronif Boots +1"}

sets.defense.PDT = {ammo="Iron Gobbet",
head="Otronif Mask +1",neck="Twilight Torque",
body="Emet harness",hands="Umuthi Gloves",ring1="Defending Ring",ring2="Dark Ring",
back="Repulse mantle",waist="Flume Belt +1",legs="Otronif brais +1",feet="Otronif Boots +1"}

sets.defense.MDT = {ammo="Demonry Stone",
head="Whirlpool Mask",neck="Twilight Torque",
body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Shadow Ring",
back="Engulfer Cape",waist="Flume Belt +1",legs="Nahtirah Trousers",feet="Otronif Boots +1"}

sets.Kiting = {feet=gear.MovementFeet}
--------------------------------------
-- Engaged sets
--------------------------------------
-- Variations for TP weapon and (optional) offense/defense modes. Code will fall back on previous
-- sets if more refined versions aren't defined.
-- If you create a set with both offense and defense modes, the offense mode should be first.
-- EG: sets.engaged.Dagger.Accuracy.Evasion
-- Normal melee group

sets.engaged = {ammo="Happo shuriken",
head="Taeon Chapeau",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Mochizuki Chainmail",hands="Otronif Gloves +1",ring1="Oneiros Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Patentia sash",legs="Mochizuki Hakama",feet="Manibozho boots"}

sets.engaged.MultiHit = {ammo="Happo shuriken",
head="Taeon Chapeau",neck="Asperity Necklace",ear1="Steelflash earring",ear2="Bladeborn Earring",
body="Thaumas coat",hands=gear.TPTaeonGloves, ring1="Oneiros Ring",ring2="Epona's Ring",
back="Letalis Mantle",waist="Windbuffet belt +1",legs="Taeon Tights",feet=gear.TPTaeonBoots}

sets.engaged.Acc = {ammo="Happo shuriken",
head="Taeon Chapeau",
neck="Iqabi Necklace",
ear1="Dudgeon Earring",
ear2="Heartseeker Earring",
body="Mochizuki Chainmail",
hands=gear.TPTaeonGloves,
ring1="Enlivened Ring",
ring2="Patricius Ring",
back="Yokaze Mantle",
waist="Anguinus belt",
legs="Taeon Tights",
feet=gear.TPTaeonBoots}

sets.engaged.MultiHitAcc = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Asperity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
body="Mochizuki chainmail",hands="Otronif Gloves +1",ring1="Oneiros Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Anguinus belt",legs="Hachiya Hakama",feet="Manibozho Boots"}


sets.engaged.Evasion = {ammo="Happo shuriken",
head="Felistris Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Hachiya Chainmail +1",hands="Otronif Gloves",ring1="Beeline Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Patentia Sash",legs="Hachiya Hakama",feet="Otronif Boots +1"}

sets.engaged.Acc.Evasion = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Otronif Harness +1",hands="Otronif Gloves",ring1="Beeline Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Hachiya Hakama",feet="Otronif Boots +1"}

sets.engaged.PDT = {ammo="Happo shuriken",
head="Felistris Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Patentia Sash",legs="Hachiya Hakama",feet="Otronif Boots +1"}

sets.engaged.Acc.PDT = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Hachiya Hakama",feet="Otronif Boots +1"}

-- Custom melee group: High Haste (~20% DW)

sets.engaged.HighHaste = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Hachiya Chainmail",hands="Otronif Gloves +1",ring1="Rajas Ring",ring2="Epona's Ring",
back="Atheling Mantle",waist="Patentia Sash",legs="Hachiya Hakama",feet="Manibozho Boots"}

sets.engaged.Acc.HighHaste = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Mochizuki Chainmail",hands="Otronif Gloves",ring1="Rajas Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Anguinus belt",legs="Wukong's hakama +1",feet="Manibozho Boots"}

sets.engaged.Evasion.HighHaste = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Hachiya Chainmail +1",hands="Otronif Gloves",ring1="Beeline Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Patentia Sash",legs="Hachiya Hakama",feet="Otronif Boots +1"}

sets.engaged.Acc.Evasion.HighHaste = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Otronif Harness +1",hands="Otronif Gloves",ring1="Beeline Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Hachiya Hakama",feet="Otronif Boots +1"}

sets.engaged.PDT.HighHaste = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Patentia Sash",legs="Hachiya Hakama",feet="Otronif Boots +1"}

sets.engaged.Acc.PDT.HighHaste = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Hachiya Hakama",feet="Otronif Boots +1"}

-- Custom melee group: Embrava Haste (7% DW)

sets.engaged.EmbravaHaste = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Qaaxo Harness",hands="Otronif Gloves",ring1="Rajas Ring",ring2="Epona's Ring",
back="Atheling Mantle",waist="Windbuffet Belt",legs="Manibozho Brais",feet="Manibozho Boots"}

sets.engaged.Acc.EmbravaHaste = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Mochizuki Chainmail",hands="Otronif Gloves",ring1="Rajas Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Manibozho Brais",feet="Manibozho Boots"}

sets.engaged.Evasion.EmbravaHaste = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Otronif Harness +1",hands="Otronif Gloves",ring1="Beeline Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Windbuffet Belt",legs="Hachiya Hakama",feet="Otronif Boots +1"}

sets.engaged.Acc.Evasion.EmbravaHaste = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Otronif Harness +1",hands="Otronif Gloves",ring1="Beeline Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Hachiya Hakama",feet="Otronif Boots +1"}

sets.engaged.PDT.EmbravaHaste = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Windbuffet Belt",legs="Manibozho Brais",feet="Otronif Boots +1"}

sets.engaged.Acc.PDT.EmbravaHaste = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Manibozho Brais",feet="Otronif Boots +1"}

-- Custom melee group: Max Haste (0% DW)

sets.engaged.MaxHaste = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Thaumas coat",hands="Nomkahpa mittens +1",ring1="Oneiros Ring",ring2="Epona's Ring",
back="Letalis Mantle",waist="Windbuffet Belt +1",legs="Mochizuki hakama",feet="Manibozho Boots"}

sets.engaged.MultiHit.MaxHaste = sets.engaged.Multihit

sets.engaged.MultiHitAcc.MaxHaste = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Thaumas coat",hands="Nomkahpa mittens +1",ring1="Oneiros Ring",ring2="Epona's Ring",
back="Letalis Mantle",waist="Windbuffet Belt +1",legs="Mochizuki hakama",feet="Manibozho Boots"}


sets.engaged.Acc.MaxHaste = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Otronif Harness +1",hands="Otronif Gloves",ring1="Rajas Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Manibozho Brais",feet="Manibozho Boots"}

sets.engaged.Evasion.MaxHaste = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Ej Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Otronif Harness +1",hands="Otronif Gloves",ring1="Beeline Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Windbuffet Belt",legs="Hachiya Hakama",feet="Otronif Boots +1"}

sets.engaged.Acc.Evasion.MaxHaste = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Ej Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Otronif Harness +1",hands="Otronif Gloves",ring1="Beeline Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Hachiya Hakama",feet="Otronif Boots +1"}

sets.engaged.PDT.MaxHaste = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Windbuffet Belt",legs="Manibozho Brais",feet="Otronif Boots +1"}

sets.engaged.Acc.PDT.MaxHaste = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Manibozho Brais",feet="Otronif Boots +1"}

--------------------------------------
-- Custom buff sets
--------------------------------------
sets.buff.Migawari = {body="Iga Ningi +2"}
sets.buff.Doom = {ring2="Saida Ring"}
sets.buff.Yonin = {}
sets.buff.Innin = {}

end
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
-- Run after the general midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
if state.Buff.Doom then
equip(sets.buff.Doom)
end
end
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
if not spell.interrupted and spell.english == "Migawari: Ichi" then
state.Buff.Migawari = true
end
end
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------
-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
-- If we gain or lose any haste buffs, adjust which gear set we target.
if S{'haste','march','embrava','haste samba'}:contains(buff:lower()) then
determine_haste_group()
handle_equipping_gear(player.status)
elseif state.Buff[buff] ~= nil then
handle_equipping_gear(player.status)
end
end
function job_status_change(new_status, old_status)
if new_status == 'Idle' then
select_movement_feet()
end
end
-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------
-- Get custom spell maps
function job_get_spell_map(spell, default_spell_map)
if spell.skill == "Ninjutsu" then
if not default_spell_map then
if spell.target.type == 'SELF' then
return 'NinjutsuBuff'
else
return 'NinjutsuDebuff'
end
end
end
end
-- Modify the default idle set after it was constructed.
function customize__set(idleSet)
if state.Buff.Migawari then
idleSet = set_combine(idleSet, sets.buff.Migawari)
end
if state.Buff.Doom then
idleSet = set_combine(idleSet, sets.buff.Doom)
end
return idleSet
end
-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
if state.Buff.Migawari then
meleeSet = set_combine(meleeSet, sets.buff.Migawari)
end
if state.Buff.Doom then
meleeSet = set_combine(meleeSet, sets.buff.Doom)
end
return meleeSet
end
-- Called by the default 'update' self-command.
function job_update(cmdParams, eventArgs)
select_movement_feet()
determine_haste_group()
end
-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
function determine_haste_group()
-- We have three groups of DW in gear: Hachiya body/legs, Iga head + Patentia Sash, and DW earrings
-- Standard gear set reaches near capped delay with just Haste (77%-78%, depending on HQs)
-- For high haste, we want to be able to drop one of the 10% groups.
-- Basic gear hits capped delay (roughly) with:
-- 1 March + Haste
-- 2 March
-- Haste + Haste Samba
-- 1 March + Haste Samba
-- Embrava
-- High haste buffs:
-- 2x Marches + Haste Samba == 19% DW in gear
-- 1x March + Haste + Haste Samba == 22% DW in gear
-- Embrava + Haste or 1x March == 7% DW in gear
-- For max haste (capped magic haste + 25% gear haste), we can drop all DW gear.
-- Max haste buffs:
-- Embrava + Haste+March or 2x March
-- 2x Marches + Haste
-- So we want four tiers:
-- Normal DW
-- 20% DW -- High Haste
-- 7% DW (earrings) - Embrava Haste (specialized situation with embrava and haste, but no marches)
-- 0 DW - Max Haste
classes.CustomMeleeGroups:clear()
if buffactive.embrava and (buffactive.march == 2 or (buffactive.march and buffactive.haste)) then
classes.CustomMeleeGroups:append('MaxHaste')
elseif buffactive.march == 2 and buffactive.haste then
classes.CustomMeleeGroups:append('MaxHaste')
elseif buffactive.embrava and (buffactive.haste or buffactive.march) then
classes.CustomMeleeGroups:append('EmbravaHaste')
elseif buffactive.march == 1 and buffactive.haste and buffactive['haste samba'] then
classes.CustomMeleeGroups:append('HighHaste')
elseif buffactive.march == 2 then
classes.CustomMeleeGroups:append('HighHaste')
end
end
function select_movement_feet()
if world.time >= 17*59 or world.time < 7*59 then
gear.MovementFeet.name = gear.NightFeet
else
gear.MovementFeet.name = gear.DayFeet
end
end
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
-- Default macro set/book
if player.sub_job == 'DNC' then
set_macro_page(2, 7)
elseif player.sub_job == 'THF' then
set_macro_page(2, 7)
else
set_macro_page(1, 7)
end
end

