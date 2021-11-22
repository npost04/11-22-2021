-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job. Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
-- Initialization function for this job file.
function get_sets()
mote_include_version = 2
-- Load and initialize the include file.
include('Mote-Include.lua')
end
-- Setup vars that are user-independent. state.Buff vars initialized here will automatically be tracked.
function job_setup()
state.Buff['Afflatus Solace'] = buffactive['Afflatus Solace'] or false
state.Buff['Afflatus Misery'] = buffactive['Afflatus Misery'] or false
end
-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job. Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------
-- Setup vars that are user-dependent. Can override this function in a sidecar file.
function user_setup()
state.OffenseMode:options('None', 'Normal')
state.CastingMode:options('Normal', 'Resistant')
state.IdleMode:options('Normal', 'PDT')
select_default_macro_book()
end
-- Define sets and vars used by this job file.
function init_gear_sets()
--------------------------------------
-- Start defining the sets

-- Waltz set (chr and vit)
sets.precast.Waltz = {
head="Nahtirah Hat",ear1="Roundel Earring",
body="Vanir Cotehardie",hands="Yaoyotl Gloves",
back="Refraction Cape",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}


-- Weaponskill sets

-- Default set for any weaponskill that isn't any more specifically defined
gear.default.weaponskill_neck = "Asperity Necklace"
gear.default.weaponskill_waist = ""
sets.precast.WS = {
head="Nahtirah Hat",
neck=gear.ElementalGorget,
ear1="Bladeborn Earring",
ear2="Steelflash Earring",
body="Vanir Cotehardie",
hands="Yaoyotl Gloves",
ring1="Rajas Ring",
ring2="K'ayres Ring",
back="Refraction Cape",
waist=gear.ElementalBelt,
legs="Gendewitha Spats",
feet="Gendewitha Galoshes"}

sets.precast.WS['Flash Nova'] = {
head="Nahtirah Hat",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Hecate's Earring",
body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="Strendu Ring",
back="Toro Cape",waist="Thunder Belt",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}


-- Midcast Sets

sets.midcast.FastRecast = {
head="Natirah Hat",
ear2="Loquacious Earring",
body="Vanir Cotehardie",
hands="Dynasty Mitts",
ring1="Prolix Ring",
back="Swith Cape",
waist="Goading Belt",
legs="Orvail pants +1",
feet="Gendewitha Galoshes"}

-- Cure sets
gear.default.obi_waist = "Goading Belt"
gear.default.obi_back = "Mending Cape"

sets.midcast.CureSolace = {
    main={ name="Tamaxchi", augments={'Mag. Acc.+30','Enmity-10',}},
    sub={ name="Genbu's Shield", augments={'"Cure" potency +4%','"Cure" spellcasting time -6%',}},
    ammo="Clarus Stone",
    head={ name="Gende. Caubeen +1", augments={'Phys. dmg. taken -1%','Magic dmg. taken -3%','"Cure" potency +7%',}},
    body="Orison Bliaud +2",
    hands="Inyanga dastanas +2",
    legs="Sifahir slacks",
    feet="Hygieia Clogs",
    neck="Incanter's Torque",
    waist="Bougonia Rope",
    left_ear="Mendi. Earring",
    right_ear="Gifted Earring",
    left_ring="Ephedra Ring",
    right_ring="Sirona's Ring",
    back={ name="Mending Cape", augments={'Healing magic skill +8','Enha.mag. skill +5','Mag. Acc.+5',}},}

sets.midcast.Cure = {main="Tamaxchi",sub="Sors Shield",ammo="Incantor Stone",
head="Gendewitha Caubeen +1",neck="Orison Locket",ear1="Lifestorm Earring",ear2="Orison Earring",
body="Vanir Cotehardie",hands="Theophany Mitts",ring1="Prolix Ring",ring2="Sirona's Ring",
back="Tempered Cape +1",waist=gear.ElementalObi,legs="Orison Pantaloons +2",feet="Piety Duckbills +1"}

sets.midcast.Curaga = {
	main="Tamaxchi",
	sub="Sors Shield",
	ammo="Clarus Stone",
	head="Gendewitha Caubeen +1",
	neck="Healing torque",
	ear1="Magnetic earring",
	ear2="Novia Earring",
	body="Gendewitha bliaut",
	hands="Thrift gloves +1",
	ring1="Ephedra Ring",
	ring2="Sirona's Ring",
	back="Mending Cape",
	waist="Pythia sash +1",
	legs="Orison Pantaloons +2",
	feet="Gende. Galoshes"}

sets.midcast.CureMelee = {ammo="Incantor Stone",
head="Gendewitha Caubeen +1",neck="Orison Locket",ear1="Lifestorm Earring",ear2="Orison Earring",
body="Vanir Cotehardie",hands="Bokwus Gloves",ring1="Prolix Ring",ring2="Sirona's Ring",
back="Tuilha Cape",waist=gear.ElementalObi,legs="Orison Pantaloons +2",feet="Piety Duckbills +1"}

sets.midcast.Cursna = {main="Beneficus",sub="Sors Shield",
head="Orison Cap +2",neck="Malison Medallion",
body="Orison Bliaud +2",hands="Hieros Mittens",ring1="Ephedra Ring",ring2="Ephedra Ring",
back="Mending Cape",waist="Goading Belt",legs="Theophany Pantaloons",feet="Gendewitha Galoshes"}

sets.midcast.StatusRemoval = {
head="Orison Cap +2",legs="Orison Pantaloons +2"}

-- 110 total Enhancing Magic Skill; caps even without Light Arts
sets.midcast['Enhancing Magic'] = {main="Beneficus",sub="Genbu's Shield",
head="Umuthi Hat",neck="Colossus's Torque",
body="Manasa Chasuble",hands="Dynasty Mitts",
back="Mending Cape",waist="Olympus Sash",legs="Piety Pantaloons",feet="Orison Duckbills +2"}

sets.midcast.Stoneskin = {
head="Umuthi Hat",neck="Orison Locket",ear2="Loquacious Earring",
body="Vanir Cotehardie",hands="Dynasty Mitts",
back="Swith Cape",waist="Siegel Sash",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}

sets.midcast.Auspice = {hands="Dynasty Mitts",feet="Orison Duckbills +2"}

sets.midcast.BarElement = {main="Beneficus",sub="Genbu's Shield",
head="Orison Cap +2",neck="Colossus's Torque",
body="Orison Bliaud +2",hands="Orison Mitts +2",
back="Mending Cape",waist="Olympus Sash",legs="Piety Pantaloons",feet="Orison Duckbills +2"}

sets.midcast.Regen = {main="Bolelabunga",sub="Genbu's Shield",
body="Piety Briault",hands="Orison Mitts +2",
legs="Theophany Pantaloons"}

sets.midcast.Protectra = {ring1="Sheltered Ring",feet="Piety Duckbills"}

sets.midcast.Shellra = {ring1="Sheltered Ring",legs="Piety Pantaloons"}



sets.midcast['Divine Magic'] = {main="Bolelabunga",sub="Genbu's Shield",
head="Nahtirah Hat",neck="Colossus's Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring2="Sangoma Ring",
back="Refraction Cape",waist=gear.ElementalObi,legs="Theophany Pantaloons",feet="Gendewitha Galoshes"}


sets.midcast['Elemental Magic'] = {main="Eminent staff",sub="Wizzan grip", ammo="Witchstone",
head="Buremte Hat",neck="Stoicheion medal",ear1="Friomisi Earring",ear2="Novio Earring",
body="Artsieq jubbah",hands="Otomi Gloves",ring2="Sangoma Ring", ring1="Icesoul ring",
back="Refraction Cape",waist=gear.ElementalObi,legs="Gendewitha spats",feet="Gendewitha Galoshes"}

sets.midcast['Dark Magic'] = {main="Bolelabunga", sub="Genbu's Shield",
head="Nahtirah Hat",neck="Aesir Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Strendu Ring",ring2="Sangoma Ring",
back="Refraction Cape",waist="Demonry Sash",legs="Bokwus Slops",feet="Piety Duckbills +1"}

-- Custom spell classes
sets.midcast.MndEnfeebles = {main="Lehbrailg +2", sub="Mephitis Grip",
head="Nahtirah Hat",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Aquasoul Ring",ring2="Sangoma Ring",
back="Refraction Cape",waist="Demonry Sash",legs="Bokwus Slops",feet="Piety Duckbills +1"}

sets.midcast.IntEnfeebles = {main="Lehbrailg +2", sub="Mephitis Grip",
head="Nahtirah Hat",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Icesoul Ring",ring2="Sangoma Ring",
back="Refraction Cape",waist="Demonry Sash",legs="Bokwus Slops",feet="Piety Duckbills +1"}


-- Sets to return to when not performing an action.

-- Resting sets
sets.resting = {main=gear.Staff.HMP,
body="Gendewitha Bliaut",hands="Serpentes Cuffs",
waist="Austerity Belt",legs="Nares Trews",feet="Chelona Boots +1"}


-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
sets.idle = {main="Bolelabunga", sub="Genbu's Shield",ammo="Incantor Stone",
head="Nahtirah Hat",neck="Twilight Torque",ear1="Beatific Earring",ear2="Gifted Earring",
body="Shamash robe",hands="Serpentes Cuffs",ring1="Dark Ring",ring2="Dark Ring",
back="Cheviot cape",waist="Cleric's belt",legs="Nares Trews",feet="Serpentes sabots"}

sets.idle.PDT = {main="Bolelabunga", sub="Genbu's Shield",ammo="Incantor Stone",
head="Nahtirah Hat",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
body="Gendewitha Bliaut",hands="Gendewitha Gages",ring1="Dark Ring",ring2="Dark Ring",
back="Umbra Cape",waist="Witful Belt",legs="Gendewitha Spats",feet="Serpentes sabots"}

sets.idle.Town = sets.idle

sets.idle.Weak = {main="Bolelabunga", sub="Genbu's Shield",ammo="Incantor Stone",
head="Nahtirah Hat",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
body="Gendewitha Bliaut",hands="Gendewitha Gages",ring1="Dark Ring",ring2="Dark Ring",
back="Umbra Cape",waist="Witful Belt",legs="Gendewitha Spats",feet="Herald's Gaiters"}

-- Defense sets

sets.defense.PDT = {main=gear.Staff.PDT,sub="Achaq Grip",
head="Gendewitha Caubeen",neck="Twilight Torque",
body="Gendewitha Bliaut",hands="Gendewitha Gages",ring1="Dark Ring",ring2="Dark Ring",
back="Umbra Cape",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}

sets.defense.MDT = {main=gear.Staff.PDT,sub="Achaq Grip",
head="Nahtirah Hat",neck="Twilight Torque",
body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Dark Ring",ring2="Shadow Ring",
back="Tuilha Cape",legs="Bokwus Slops",feet="Gendewitha Galoshes"}

sets.Kiting = {feet="Herald's Gaiters"}

-- Engaged sets

-- Variations for TP weapon and (optional) offense/defense modes. Code will fall back on previous
-- sets if more refined versions aren't defined.
-- If you create a set with both offense and defense modes, the offense mode should be first.
-- EG: sets.engaged.Dagger.Accuracy.Evasion

-- Basic set for if no TP weapon is defined.
sets.engaged = {
main="Sharur",
    sub="Bolelabunga",
    ammo="Incantor Stone",
    head={ name="Telchine Cap", augments={'Accuracy+10','"Dbl.Atk."+2',}},
    body={ name="Telchine Chas.", augments={'Attack+6','"Dbl.Atk."+3',}},
    hands={ name="Telchine Gloves", augments={'"Store TP"+6',}},
    legs="Rubeus Spats",
    feet={ name="Telchine Pigaches", augments={'Accuracy+10','"Store TP"+6',}},
    neck="Peacock Amulet",
    waist="Windbuffet Belt",
    left_ear="Brutal Earring",
    right_ear="Suppanomimi",
    left_ring="Enlivened Ring",
    right_ring="Rajas Ring",
    back="Kayapa Cape",}


-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
sets.buff['Divine Caress'] = {hands="Orison Mitts +2",back="Mending Cape"}

end
--------------------------------------
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
if spell.english == "Paralyna" and buffactive.Paralyzed then
-- no gear swaps if we're paralyzed, to avoid blinking while trying to remove it.
eventArgs.handled = true
end
if spell.skill == 'Healing Magic' then
gear.default.obi_back = "Mending Cape"
else
gear.default.obi_back = "Toro Cape"
end
end
function job_post_midcast(spell, action, spellMap, eventArgs)
-- Apply Divine Caress boosting items as highest priority over other gear, if applicable.
if spellMap == 'StatusRemoval' and buffactive['Divine Caress'] then
equip(sets.buff['Divine Caress'])
end
end
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------
-- Handle notifications of general user state change.
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
-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
if spell.action_type == 'Magic' then
if (default_spell_map == 'Cure' or default_spell_map == 'Curaga') and player.status == 'Engaged' then
return "CureMelee"
elseif default_spell_map == 'Cure' and state.Buff['Afflatus Solace'] then
return "CureSolace"
elseif spell.skill == "Enfeebling Magic" then
if spell.type == "WhiteMagic" then
return "MndEnfeebles"
else
return "IntEnfeebles"
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
if cmdParams[1] == 'user' and not areas.Cities:contains(world.area) then
local needsArts =
player.sub_job:lower() == 'sch' and
not buffactive['Light Arts'] and
not buffactive['Addendum: White'] and
not buffactive['Dark Arts'] and
not buffactive['Addendum: Black']
if not buffactive['Afflatus Solace'] and not buffactive['Afflatus Misery'] then
if needsArts then
send_command('@input /ja "Afflatus Solace" <me>;wait 1.2;input /ja "Light Arts" <me>')
else
send_command('@input /ja "Afflatus Solace" <me>')
end
end
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
-- Default macro set/book
set_macro_page(1, 2)
end
