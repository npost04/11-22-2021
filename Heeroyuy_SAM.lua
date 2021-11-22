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
state.Buff.Hasso = buffactive.Hasso or false
state.Buff.Seigan = buffactive.Seigan or false
state.Buff.Sekkanoki = buffactive.Sekkanoki or false
state.Buff.Sengikori = buffactive.Sengikori or false
state.Buff['Meikyo Shisui'] = buffactive['Meikyo Shisui'] or false
end
-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job. Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------
-- Setup vars that are user-dependent.
function user_setup()
state.OffenseMode:options('Normal', 'Acc')
state.HybridMode:options('Normal', 'PDT', 'Reraise')
state.WeaponskillMode:options('Normal', 'Acc')
state.PhysicalDefenseMode:options('PDT', 'Reraise')
update_combat_form()
-- Additional local binds
send_command('bind ^` input /ja "Hasso" <me>')
send_command('bind !` input /ja "Seigan" <me>')
send_command('bind ^[ input //gs c cycle WeaponskillMode')
select_default_macro_book()
end
-- Called when this job file is unloaded (eg: job change)
function user_unload()
send_command('unbind ^`')
send_command('unbind !-')
end
-- Define sets and vars used by this job file.
function init_gear_sets()
--------------------------------------
-- Start defining the sets
-------------------------------

-- Precast Sets

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

-- Precast sets to enhance JAs
sets.precast.JA.Meditate = {head="Myochin Kabuto",hands="Saotome Kote +2"}

sets.precast.JA['Warding Circle'] = {head="Myochin Kabuto"}

sets.precast.JA['Blade Bash'] = {hands="Sakonji Kote"}

-- Waltz set (chr and vit)
sets.precast.Waltz = {ammo="Sonia's Plectrum",
head="Yaoyotl Helm",
body="Otronif Harness",hands="Buremte Gloves",ring1="Spiral Ring",
back="Iximulew Cape",waist="Caudata Belt",legs="Karieyh Brayettes +1",feet="Otronif Boots +1"}

-- Don't need any special gear for Healing Waltz.
sets.precast.Waltz['Healing Waltz'] = {}

-- Weaponskill sets
-- Default set for any weaponskill that isn't any more specifically defined

sets.precast.WS = {
head="Valorous mask",
neck="Fotia necklace",
ear1="Thrud Earring",
ear2="Moonshade Earring",
body="Flamma korazin +2",
hands="Flamma Manopolas +2",
ring1="Flamma Ring",
ring2="Apate Ring",
back="Takaha Mantle",
waist="Fotia belt",
legs="Hizamaru hizayoroi +2",
feet="Flamma Gambieras +2"}


sets.precast.WS.Acc = set_combine(sets.precast.WS, {hands="Umuthi gloves",ring2="Mars's ring", back="Takaha Mantle", legs="Wukong's hakama +1"})


-- Specific weaponskill sets. Uses the base set if an appropriate WSMod version isn't found.

sets.precast.WS['Tachi: Fudo'] = set_combine(sets.precast.WS, {neck="Fotia Gorget", ear1="Flame pearl", hands="Boor bracelets", legs="Wukong's hakama +1", back="Letalis mantle"})

sets.precast.WS['Tachi: Fudo'].Acc = set_combine(sets.precast.WS.Acc, {neck="Fotia Gorget", hands="Otronif gloves +1", legs="Wukong's hakama +1"})

sets.precast.WS['Tachi: Fudo'].Mod = set_combine(sets.precast.WS['Tachi: Fudo'], {waist="Fotia Belt"})

sets.precast.WS['Tachi: Shoha'] = set_combine(sets.precast.WS, {neck="Fotia Gorget"})

sets.precast.WS['Tachi: Shoha'].Acc = set_combine(sets.precast.WS.Acc, {neck="Fotia Gorget"})

sets.precast.WS['Tachi: Shoha'].Mod = set_combine(sets.precast.WS['Tachi: Shoha'], {waist="Fotia Belt"})

sets.precast.WS['Tachi: Rana'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring",})

sets.precast.WS['Tachi: Rana'].Acc = set_combine(sets.precast.WS.Acc, {neck="Fotia Gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring",})

sets.precast.WS['Tachi: Rana'].Mod = set_combine(sets.precast.WS['Tachi: Rana'], {waist="Fotia Belt"})

sets.precast.WS['Tachi: Kasha'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",waist="Fotia Belt"})

sets.precast.WS['Tachi: Gekko'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",waist="Fotia Belt"})

sets.precast.WS['Tachi: Yukikaze'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",waist="Fotia Belt"})

sets.precast.WS['Tachi: Ageha'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",waist="Fotia Belt"})

sets.precast.WS['Tachi: Jinpu'] = set_combine(sets.precast.WS, {
head="Founder's Corona",
neck="Sanctity necklace",
ear1="Friomisi Earring",
ear2="Moonshade earring",
body="Founder's Breastplate",
hands="Founder's Gauntlets",
ring1="Acumen ring",
ring2="Mujun band",
back="Toro cape",
waist="Fotia Belt",
legs="Hizarmaru Hizayoroi +2",
feet="Founder's Greaves"})

sets.precast.WS['Apex Arrow'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",ear1="Altdorf's earring", ear2="Wilhelm's earring", body="Kyujutsugi", hands="Unkai kote +2",ring1="Stormsoul ring", ring2="Stormsoul ring", back="Buquwik cape",  waist="Fotia Belt", legs="Aetosaur trousers +1", feet="Wakido Sune-ate"})

-- Midcast Sets
sets.midcast.FastRecast = {
head="Yaoyotl Helm",
body="Otronif Harness +1",hands="Otronif Gloves +1",
legs="Phorcys Dirs",feet="Otronif Boots +1"}

-- Sets to return to when not performing an action.
-- Resting sets
sets.resting = {neck="Wiglen Gorget",ring1="Sheltered Ring",ring2="Paguroidea Ring"}

-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
sets.idle.Town = {main="Tsurumaru", sub="Bloodrain strap",ammo="Thew Bomblet",
head="Yaoyotl Helm",neck="Wiglen gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Kyujutsugi",hands="Otronif Gloves +1",ring1="Sheltered Ring",ring2="Paguroidea Ring",
back="Repulse Mantle",waist="Flume Belt +1",legs="Otronif brais +1",feet="Danzo Sune-ate"}

sets.idle.Field = {
head="Twilight Helm",neck="Wiglen Gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Mekira meikogai",hands="Otronif Gloves +1",ring1="Sheltered Ring",ring2="Paguroidea Ring",
back="Shadow Mantle",waist="Flume Belt +1",legs="Otronif brais +1",feet="Danzo Sune-ate"}

sets.idle.Weak = {
head="Twilight Helm",neck="Wiglen Gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Twilight Mail",hands="Buremte Gloves",ring1="Sheltered Ring",ring2="Paguroidea Ring",
back="Shadow Mantle",waist="Flume Belt +1",legs="Karieyh Brayettes +1",feet="Danzo Sune-ate"}

-- Defense sets
sets.defense.PDT = {ammo="Iron Gobbet",
head="Otronif mask +1",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Mekira meikogai",hands="Umuthi gloves",ring1="Defending Ring",ring2="Patricius ring",
back="Repulse Mantle",waist="Flume Belt +1",legs="Otronif brais +1",feet="Otronif Boots +1"}

sets.defense.Reraise = {
head="Twilight Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Twilight Mail",hands="Buremte Gloves",ring1="Defending Ring",ring2="Paguroidea Ring",
back="Shadow Mantle",waist="Flume Belt +1",legs="Karieyh Brayettes +1",feet="Otronif Boots +1"}

sets.defense.MDT = {ammo="Demonry Stone",
head="Yaoyotl Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Shadow Ring",
back="Engulfer Cape",waist="Flume Belt +1",legs="Karieyh Brayettes +1",feet="Otronif Boots +1"}

sets.Kiting = {feet="Danzo Sune-ate"}

sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}

-- Engaged sets
-- Variations for TP weapon and (optional) offense/defense modes. Code will fall back on previous
-- sets if more refined versions aren't defined.
-- If you create a set with both offense and defense modes, the offense mode should be first.
-- EG: sets.engaged.Dagger.Accuracy.Evasion
-- Normal melee group
-- Delay 450 GK, 25 Save TP => 65 Store TP for a 5-hit (25 Store TP in gear)

sets.engaged = {
head="Flamma Zucchetto +2",
neck="Lissome necklace",
ear1="Cessance Earring",
ear2="Telos Earring",
body="Valorous mail",
hands="Flamma Manopolas +2",
ring1="Chirich Ring",
ring2="Chirich Ring",
back="Takaha Mantle",
waist="Ioskeha belt",
legs="Hizamaru hizayoroi +2",
feet="Flamma Gambieras +2"}


-- Melee sets for in Adoulin, which has an extra 10 Save TP for weaponskills.
-- Delay 450 GK, 35 Save TP => 89 Store TP for a 4-hit (32 Store TP in gear), 0 Store TP for a 5-hit
sets.engaged.Adoulin = {
head="Flamma Zucchetto +2",
neck="Lissome necklace",
ear1="Cessance Earring",
ear2="Telos Earring",
body="Flamma korazin +2",
hands="Flamma Manopolas +2",
ring1="Chirich Ring",
ring2="Chirich Ring",
back="Takaha Mantle",
waist="Ioskeha belt",
legs="Hizamaru hizayoroi +2",
feet="Flamma Gambieras +2"}






sets.buff.Sekkanoki = {hands="Unkai Kote +2"}

sets.buff.Sengikori = {feet="Unkai Sune-ate +2"}

sets.buff['Meikyo Shisui'] = {feet="Sakonji Sune-ate"}


end
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
-- Set eventArgs.handled to true if we don't want any automatic target handling to be done.
function job_pretarget(spell, action, spellMap, eventArgs)
if spell.type == 'WeaponSkill' then
-- Change any GK weaponskills to polearm weaponskill if we're using a polearm.
if player.equipment.main=='Quint Spear' or player.equipment.main=='Quint Spear' then
if spell.english:startswith("Tachi:") then
send_command('@input /ws "Penta Thrust" '..spell.target.raw)
eventArgs.cancel = true
end
end
end
end
-- Run after the default precast() is done.
-- eventArgs is the same one used in job_precast, in case information needs to be persisted.
function job_post_precast(spell, action, spellMap, eventArgs)
if spell.type:lower() == 'weaponskill' then
if state.Buff.Sekkanoki then
equip(sets.buff.Sekkanoki)
end
if state.Buff.Sengikori then
equip(sets.buff.Sengikori)
end
if state.Buff['Meikyo Shisui'] then
equip(sets.buff['Meikyo Shisui'])
end
end
end
-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
-- Effectively lock these items in place.
if state.HybridMode.value == 'Reraise' or
(state.DefenseMode.value == 'Physical' and state.PhysicalDefenseMode.value == 'Reraise') then
equip(sets.Reraise)
end
end
-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------
-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
update_combat_form()
end
-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
end
-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
function update_combat_form()
if areas.Adoulin:contains(world.area) and buffactive.ionis then
state.CombatForm:set('Adoulin')
else
state.CombatForm:reset()
end
end
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
-- Default macro set/book
if player.sub_job == 'WAR' then
set_macro_page(1, 9)
elseif player.sub_job == 'DNC' then
set_macro_page(2, 9)
elseif player.sub_job == 'THF' then
set_macro_page(3, 9)
elseif player.sub_job == 'NIN' then
set_macro_page(4, 9)
else
set_macro_page(1, 9)
end
end