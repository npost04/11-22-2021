-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job. Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
-- Initialization function for this job file.
require 'organizer-lib'
function get_sets()
mote_include_version = 2
-- Load and initialize the include file.
include('Mote-Include.lua')
include('Augments.lua')
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

-- Precast sets to enhance JAs on use
sets.precast.JA['Hundred Fists'] = {legs="Hesychast's Hose"}

sets.precast.JA['Boost'] = {hands="Anchorite's Gloves"}

sets.precast.JA['Dodge'] = {feet="Anchorite's Gaiters"}

sets.precast.JA['Focus'] = {head="Anchorite's Crown"}

sets.precast.JA['Counterstance'] = {feet="Hesychast's Gaiters"}

sets.precast.JA['Chi Blast'] = {
head="Whirlpool mask",
body="Espial gambison",
hands="Hesychast's Gloves",
legs="Quiahuiz trousers",
feet="Thurandaut boots +1"}

sets.precast.JA['Footwork'] = {feet="Tantra Gaiters +2"}

sets.precast.JA['Formless Strikes'] = {body="Hesychast's Cyclas"}

sets.precast.JA['Mantra'] = {feet="Hesychast's Gaiters"}

sets.precast.JA['Chakra'] = {
ammo="Tantra tathlum",
head="Genmei Kabuto",
neck="Fortitude torque",
ear1="Soil pearl",
body="Anchorite's Cyclas",
hands="Hesychast's Gloves",
ring1="Spiral Ring",
ring2="Terrasoul ring",
back="Iximulew Cape",
waist="Caudata Belt",
legs="Kaabnax trousers",
feet="Thurandaut Boots +1"}


-- Waltz set (chr and vit)
sets.precast.Waltz = {
ammo="Tantra tathlum",
head="Uk'uxkaj cap",
body="Espial gambison",
hands="Otronif Gloves +1",
ring1="Spiral Ring",
back="Iximulew Cape",
waist="Caudata Belt",
legs="Kaabnax trousers",
Feet="Thurandaut boots +1"}

-- Don't need any special gear for Healing Waltz.
sets.precast.Waltz['Healing Waltz'] = {}

-- Fast cast sets for spells

sets.precast.FC = {
ammo="Impatiens",
head="Haruspex hat +1",
neck="Orunmila's torque",
ear1="Loquacious Earring",
ear2="Enchanter earring +1",
hands="Thaumas Gloves",
ring1="Prolix ring",
ring2="Weatherspoon ring",
back="Mujin mantle",
legs="Kaabnax trousers",
feet="Suzaku's sune-ate"}

sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})

       
-- Weaponskill sets
-- Default set for any weaponskill that isn't any more specifically defined
sets.precast.WS = {
head="Adhemar bonnet",
neck="Fotia gorget",
ear1="Moonshade Earring",
ear2="Sherida Earring",
body="Adhemar jacket +1",
hands="Adhemar Wristbands +1",
waist="Fotia belt",
legs="Hiza. Hizayoroi +2",
feet=gear.TAHerculeanBoots,
back=gear.MnkWSBack,
}

sets.precast.WS.Acc = set_combine(sets.precast.WS, {
ammo="Honed Tathlum",
neck="Iqabi necklace",
body="Emet harness +1",
back="Anchoret's Mantle"
})

sets.precast.WS.Mod = set_combine(sets.precast.WS, {
head="Felistris Mask",
legs="Hesychast's Hose +1",
feet="Qaaxo Leggings"})

-- Specific weaponskill sets. Uses the base set if an appropriate WSMod version isn't found.
sets.precast.WS["Victory Smite"] = set_combine(sets.precast.WS, {
body="Khepri jacket",
neck="Rancor Collar",
waist="Fotia belt",
legs="Byakko's haidate"})

sets.precast.WS["Victory Smite"].Acc = set_combine(sets.precast.WS.Acc, {})

sets.precast.WS["Victory Smite"].Mod = set_combine(sets.precast.WS["Victory Smite"], {
waist="Fotia Belt"})

sets.precast.WS['Shijin Spiral'] = set_combine(sets.precast.WS, {})

sets.precast.WS['Shijin Spiral'].Acc = set_combine(sets.precast.WS.Acc, {
neck="Fotia gorget",
back="Anchoret's mantle",
waist="Fotia Belt"
})

sets.precast.WS['Shijin Spiral'].Mod = set_combine(sets.precast.WS['Shijin Spiral'], {
head="Felistris Mask",
waist="Fotia Belt",
legs="Hesychast's Hose +1"})

sets.precast.WS['Asuran Fists'] = set_combine(sets.precast.WS, {
neck="Fotia Gorget",})

sets.precast.WS['Asuran Fists'].Acc = set_combine(sets.precast.WS.Acc, {
neck="Fotia Gorget",
ring2="Spiral Ring"})

sets.precast.WS['Asuran Fists'].Mod = set_combine(sets.precast.WS['Asuran Fists'], {
waist="Fotia Belt",
feet="Qaaxo leggings"})

sets.precast.WS["Ascetic's Fury"] = set_combine(sets.precast.WS, {
neck="Rancor Collar",
ear1="Brutal Earring",
ear2="Moonshade Earring",
ring1="Spiral Ring"})

sets.precast.WS["Ascetic's Fury"].Acc = set_combine(sets.precast.WS.Acc, {
neck="Rancor Collar",
ear1="Brutal Earring",
ear2="Moonshade Earring",
ring1="Spiral Ring"})

sets.precast.WS["Ascetic's Fury"].Mod = set_combine(sets.precast.WS["Ascetic's Fury"], {
waist="Fotia Belt"})

sets.precast.WS['Cataclysm'] = {
head="Thaumas Hat",
neck="Stoicheion Medal",
ear1="Friomisi Earring",
ear2="Hecate's Earring",
body="Otronif Harness +1",
hands="Otronif Gloves +1",
ring1="Acumen Ring",
ring2="Demon's Ring",
back="Toro Cape",
waist="Fotia Belt",
feet="Qaaxo Leggings"}


-- Midcast Sets
sets.midcast.FastRecast = {
head="Haruspex hat +1",
ear2="Loquacious Earring",
body="Otronif Harness +1",
hands="Thaumas Gloves",
waist="Black Belt",
feet="Suzaku's sune-ate"}

-- Specific spells
sets.midcast.Utsusemi = {
head="Whirlpool Mask",
ear2="Loquacious Earring",
body="Otronif Harness +1",
hands="Thaumas Gloves",
waist="Black Belt",
legs="Qaaxo Tights",
feet="Otronif Boots"}


-- Sets to return to when not performing an action.

-- Resting sets
sets.resting = {
head="Ocelomeh Headpiece +1",
neck="Wiglen Gorget",
body="Hesychast's Cyclas",
ring1="Sheltered Ring",
ring2="Paguroidea Ring",
feet="Hermes' sandals"}


-- Idle sets
sets.idle = {
ammo="Staunch tathlum +1",
neck="Wiglen Gorget",
ear1="Infused Earring",
body="Hizamaru haramaki +1",
hands="Garden bangles",
ring1="Sheltered Ring",
ring2="Paguroidea Ring",
back="Moonbeam cape",
waist="Black Belt",
feet="Hermes' sandals"}

sets.idle.Town = sets.idle

sets.idle.Weak = {
ammo="Thew Bomblet",
head="Ocelomeh Headpiece +1",
neck="Wiglen Gorget",
ear1="Bladeborn Earring",
ear2="Steelflash Earring",
body="Hesychast's Cyclas",
hands="Garden bangles",
ring1="Sheltered Ring",
ring2="Paguroidea Ring",
back="Repulse mantle",
waist="Black Belt",
legs="Kaabnax trousers",
feet="Hermes' sandals"}

-- Defense sets
sets.defense.PDT = {
ammo="Staunch Tathlum +1",
head="Malignance Chapeau",
neck="Loricate torque +1",
body="Malignance Tabard",
--hands="",
ring1="Dark Ring",
ring2="Defending Ring",
back="Moonbeam Cape",
waist="Black Belt",
legs="Mummu kecks +2",
--feet=""
}

sets.defense.HP = {
ammo="Iron Gobbet",
head="Whirlpool Mask",
neck="Lavalier +1",
ear1="Brutal Earring",
ear2="Bloodgem Earring",
body="Hesychast's Cyclas",
hands="Hesychast's Gloves +1",
ring1="K'ayres Ring",
ring2="Meridian Ring",
back="Shadow Mantle",
waist="Black Belt",
legs="Hesychast's Hose +1",
feet="Hesychast's Gaiters"}

sets.defense.MDT = {
ammo="Demonry Stone",
head="Haruspex hat +1",
neck="Twilight Torque",
body="Otronif Harness +1",
hands="Anchorite's Gloves +1",
ring1="Dark Ring",
ring2="Shadow Ring",
back="Engulfer Cape",
waist="Black Belt",
legs="Qaaxo Tights",
feet="Daihanshi Habaki"}

sets.Kiting = {feet="Hermes' sandals"}

-- Engaged sets

-- Variations for TP weapon and (optional) offense/defense modes. Code will fall back on previous
-- sets if more refined versions aren't defined.
-- If you create a set with both offense and defense modes, the offense mode should be first.
-- EG: sets.engaged.Dagger.Accuracy.Evasion

-- Normal melee sets
sets.engaged = {
ammo="Ginsen",
head="Malignance Chapeau",
neck="Asperity necklace",
ear1="Cessance earring",
ear2="Sherida earring",
body="Malignance Tabard",
hands="Adhemar wristbands +1",
ring1="Chirich Ring",
ring2="Chirich Ring",
back=gear.MnkSTPBack,
waist="Windbuffet Belt +1",
legs="Samnuha Tights",
feet=gear.TAHerculeanBoots}

sets.engaged.Acc = {
ammo="Ginsen",
head="Whirlpool Mask",
neck="Iqabi necklace",
ear1="Bladeborn Earring",
ear2="Steelflash Earring",
body="Emet harness +1",
hands="Hesychast's Gloves",
ring1="Mars's Ring",
ring2="Enlivened Ring",
back="Anchoret's Mantle",
waist="Anguinus Belt",
legs="Wukong's hakama +1",
feet="Qaaxo leggings"}

sets.engaged.Multi = {
ammo="Thew Bomblet",
head="Uk'uxkaj cap",
neck="Asperity Necklace",
ear1="Bladeborn Earring",
ear2="Steelflash Earring",
body="Thaumas coat",
hands="Nomkahpa mittens +1",
ring1="Oneiros Ring",
ring2="Epona's Ring",
back="Letalis Mantle",
waist="Windbuffet Belt +1",
legs="Kaabnax trousers",
feet="Manibozho boots"}

-- Defensive melee hybrid sets
sets.engaged.PDT = {
ammo="Thew Bomblet",
head="Otronif Mask",
neck="Twilight Torque",
ear1="Bladeborn Earring",
ear2="Steelflash Earring",
body="Emet harness +1",
hands="Otronif Gloves +1",
ring1="Patricius Ring",
ring2="Defending Ring",
back="Iximulew Cape",
waist="Windbuffet Belt +1",
legs="Otronif brais +1",
feet="Qaaxo leggings"}

sets.engaged.Acc.PDT = {
ammo="Honed Tathlum",
head="Whirlpool Mask",
neck="Twilight Torque",
ear1="Bladeborn Earring",
ear2="Steelflash Earring",
body="Emet harness +1",
hands="Otronif Gloves +1",
ring1="Patricius Ring",
ring2="Defending Ring",
back="Anchoret's Mantle",
waist="Anguinus Belt",
legs="Otronif brais +1",
feet="Qaaxo Leggings"}

sets.engaged.Counter = {
ammo="Thew Bomblet",
head="Whirlpool Mask",
neck="Asperity Necklace",
ear1="Bladeborn Earring",
ear2="Steelflash Earring",
body="Otronif Harness +1",
hands="Otronif Gloves +1",
ring1="K'ayres Ring",
ring2="Epona's Ring",
back="Atheling Mantle",
waist="Windbuffet Belt +1",
legs="Anchorite's Hose",
feet="Otronif Boots +1"}

sets.engaged.Acc.Counter = {
ammo="Honed Tathlum",
head="Whirlpool Mask",
neck="Ej Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Emet harness +1",
hands="Hesychast's Gloves +1",
ring1="Patricius Ring",
ring2="Epona's Ring",
back="Letalis Mantle",
waist="Anguinus Belt",
legs="Anchorite's Hose",
feet="Otronif Boots +1"}


-- Hundred Fists/Impetus melee set mods
sets.engaged.HF = set_combine(sets.engaged)
sets.engaged.HF.Impetus = set_combine(sets.engaged, {body="Bhikku Cyclas"})
sets.engaged.Acc.HF = set_combine(sets.engaged.Acc)
sets.engaged.Acc.HF.Impetus = set_combine(sets.engaged.Acc, {body="Bhikku Cyclas"})
sets.engaged.Counter.HF = set_combine(sets.engaged.Counter)
sets.engaged.Counter.HF.Impetus = set_combine(sets.engaged.Counter, {body="Bhikku Cyclas"})
sets.engaged.Acc.Counter.HF = set_combine(sets.engaged.Acc.Counter)
sets.engaged.Acc.Counter.HF.Impetus = set_combine(sets.engaged.Acc.Counter, {body="Bhikku Cyclas"})


-- Footwork combat form
sets.engaged.Footwork = {
ammo="Thew Bomblet",
head="Felistris Mask",
neck="Asperity Necklace",
ear1="Bladeborn Earring",
ear2="Steelflash Earring",
body="Qaaxo Harness",
hands="Hesychast's Gloves +1",
ring1="Rajas Ring",
ring2="Epona's Ring",
back="Atheling Mantle",
waist="Windbuffet Belt +1",
legs="Hesychast's Hose +1",
feet="Anchorite's Gaiters +1"}

sets.engaged.Footwork.Acc = {
ammo="Honed Tathlum",
head="Whirlpool Mask",
neck="Asperity Necklace",
ear1="Bladeborn Earring",
ear2="Steelflash Earring",
body="Emet harness +1",
hands="Hesychast's Gloves +1",
ring1="Rajas Ring",
ring2="Epona's Ring",
back="Letalis Mantle",
waist="Anguinus Belt",
legs="Hesychast's Hose +1",
feet="Anchorite's Gaiters +1"}

-- Quick sets for post-precast adjustments, listed here so that the gear can be Validated.
sets.impetus_body = {body="Bhikku Cyclas"}
sets.footwork_kick_feet = {feet="Anchorite's Gaiters"}

end
-- Setup vars that are user-independent. state.Buff vars initialized here will automatically be tracked.
function job_setup()
state.Buff.Footwork = buffactive.Footwork or false
state.Buff.Impetus = buffactive.Impetus or false
state.FootworkWS = M(false, 'Footwork on WS')
info.impetus_hit_count = 0
windower.raw_register_event('action', on_action_for_impetus)
end
-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job. Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------
-- Setup vars that are user-dependent. Can override this function in a sidecar file.
function user_setup()
state.OffenseMode:options('Normal', 'Acc', 'Multi')
state.WeaponskillMode:options('Normal', 'Acc')
state.HybridMode:options('Normal', 'PDT', 'Counter')
state.PhysicalDefenseMode:options('PDT', 'HP')
update_combat_form()
update_melee_groups()
select_default_macro_book()
end
-- Define sets and vars used by this job file.
function init_gear_sets()
--------------------------------------
-- Start defining the sets
--------------------------------------
-- Precast Sets
-- Precast sets to enhance JAs on use

end
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
-- Don't gearswap for weaponskills when Defense is on.
if spell.type == 'WeaponSkill' and state.DefenseMode.current ~= 'None' then
eventArgs.handled = true
end
end
-- Run after the general precast() is done.
function job_post_precast(spell, action, spellMap, eventArgs)
if spell.type == 'WeaponSkill' and state.DefenseMode.current ~= 'None' then
if state.Buff.Impetus and (spell.english == "Ascetic's Fury" or spell.english == "Victory Smite") then
-- Need 6 hits at capped dDex, or 9 hits if dDex is uncapped, for Tantra to tie or win.
if (state.OffenseMode.current == 'Fodder' and info.impetus_hit_count > 5) or (info.impetus_hit_count > 8) then
equip(sets.impetus_body)
end
elseif state.Buff.Footwork and (spell.english == "Dragon's Kick" or spell.english == "Tornado Kick") then
equip(sets.footwork_kick_feet)
end
-- Replace Moonshade Earring if we're at cap TP
if player.tp == 3000 then
equip(sets.precast.MaxTP)
end
end
end
function job_aftercast(spell, action, spellMap, eventArgs)
if spell.type == 'WeaponSkill' and not spell.interrupted and state.FootworkWS and state.Buff.Footwork then
send_command('cancel Footwork')
end
end
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------
-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
-- Set Footwork as combat form any time it's active and Hundred Fists is not.
if buff == 'Footwork' and gain and not buffactive['hundred fists'] then
state.CombatForm:set('Footwork')
elseif buff == "Hundred Fists" and not gain and buffactive.footwork then
state.CombatForm:set('Footwork')
else
state.CombatForm:reset()
end
-- Hundred Fists and Impetus modify the custom melee groups
if buff == "Hundred Fists" or buff == "Impetus" then
classes.CustomMeleeGroups:clear()
if (buff == "Hundred Fists" and gain) or buffactive['hundred fists'] then
classes.CustomMeleeGroups:append('HF')
end
if (buff == "Impetus" and gain) or buffactive.impetus then
classes.CustomMeleeGroups:append('Impetus')
end
end
-- Update gear if any of the above changed
if buff == "Hundred Fists" or buff == "Impetus" or buff == "Footwork" then
handle_equipping_gear(player.status)
end
end
-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------
function customize_idle_set(idleSet)
if player.hpp < 75 then
idleSet = set_combine(idleSet, sets.ExtraRegen)
end
return idleSet
end
-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
update_combat_form()
update_melee_groups()
end
-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
function update_combat_form()
if buffactive.footwork and not buffactive['hundred fists'] then
state.CombatForm:set('Footwork')
else
state.CombatForm:reset()
end
end
function update_melee_groups()
classes.CustomMeleeGroups:clear()
if buffactive['hundred fists'] then
classes.CustomMeleeGroups:append('HF')
end
if buffactive.impetus then
classes.CustomMeleeGroups:append('Impetus')
end
end
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
-- Default macro set/book
if player.sub_job == 'DNC' then
set_macro_page(8, 2)
elseif player.sub_job == 'NIN' then
set_macro_page(2, 2)
elseif player.sub_job == 'THF' then
set_macro_page(4, 2)
elseif player.sub_job == 'RUN' then
set_macro_page(1, 2)
else
set_macro_page(3, 2)
end
end
-------------------------------------------------------------------------------------------------------------------
-- Custom event hooks.
-------------------------------------------------------------------------------------------------------------------
-- Keep track of the current hit count while Impetus is up.
function on_action_for_impetus(action)
if state.Buff.Impetus then
-- count melee hits by player
if action.actor_id == player.id then
if action.category == 1 then
for _,target in pairs(action.targets) do
for _,action in pairs(target.actions) do
-- Reactions (bitset):
-- 1 = evade
-- 2 = parry
-- 4 = block/guard
-- 8 = hit
-- 16 = JA/weaponskill?
-- If action.reaction has bits 1 or 2 set, it missed or was parried. Reset count.
if (action.reaction % 4) > 0 then
info.impetus_hit_count = 0
else
info.impetus_hit_count = info.impetus_hit_count + 1
end
end
end
elseif action.category == 3 then
-- Missed weaponskill hits will reset the counter. Can we tell?
-- Reaction always seems to be 24 (what does this value mean? 8=hit, 16=?)
-- Can't tell if any hits were missed, so have to assume all hit.
-- Increment by the minimum number of weaponskill hits: 2.
for _,target in pairs(action.targets) do
for _,action in pairs(target.actions) do
-- This will only be if the entire weaponskill missed or was parried.
if (action.reaction % 4) > 0 then
info.impetus_hit_count = 0
else
info.impetus_hit_count = info.impetus_hit_count + 2
end
end
end
end
elseif action.actor_id ~= player.id and action.category == 1 then
-- If mob hits the player, check for counters.
for _,target in pairs(action.targets) do
if target.id == player.id then
for _,action in pairs(target.actions) do
-- Spike effect animation:
-- 63 = counter
-- ?? = missed counter
if action.has_spike_effect then
-- spike_effect_message of 592 == missed counter
if action.spike_effect_message == 592 then
info.impetus_hit_count = 0
elseif action.spike_effect_animation == 63 then
info.impetus_hit_count = info.impetus_hit_count + 1
end
end
end
end
end
end
--add_to_chat(123,'Current Impetus hit count = ' .. tostring(info.impetus_hit_count))
else
info.impetus_hit_count = 0
end
end



