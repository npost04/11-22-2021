-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job. Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
--[[
require 'organizer-lib'
Custom commands:
Shorthand versions for each strategem type that uses the version appropriate for
the current Arts.
Light Arts Dark Arts
gs c scholar light Light Arts/Addendum
gs c scholar dark Dark Arts/Addendum
gs c scholar cost Penury Parsimony
gs c scholar speed Celerity Alacrity
gs c scholar aoe Accession Manifestation
gs c scholar power Rapture Ebullience
gs c scholar duration Perpetuance
gs c scholar accuracy Altruism Focalization
gs c scholar enmity Tranquility Equanimity
gs c scholar skillchain Immanence
gs c scholar addendum Addendum: White Addendum: Black
--]]
-- Initialization function for this job file.
function get_sets()
mote_include_version = 2
-- Load and initialize the include file.
include('Mote-Include.lua')

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

sets.precast.JA['Tabula Rasa'] = {legs="Pedagogy Pants"}


-- Fast cast sets for spells

sets.precast.FC = {
ammo="Incantor stone",
head="Nahtirah Hat",
neck="Orunmila's torque",
ear1="Loquacious Earring",
ear2="Enchanter earring +1",
body="Anhur robe",
hands="Gendewitha Gages +1",
ring1="Prolix Ring",
ring2="Weatherspoon ring",
back="Swith Cape +1",
waist="Witful Belt",
legs="Artsieq hose",
feet="Pedagogy loafers"}

sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {neck="Orunmila's torque"})

sets.precast.FC.Cure = set_combine(sets.precast.FC, {body="Heka's Kalasiris",back="Pahtli Cape"})

sets.precast.FC.Curaga = sets.precast.FC.Cure

sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})

       
-- Midcast Sets

sets.midcast.FastRecast = {
ammo="Incantor Stone",
head="Nahtirah Hat",
neck="Orunmila's torque",
ear1="Loquacious Earring",
ear2="Enchanter earring +1",
body="Anhur robe",
hands="Gendewitha Gages +1",
ring1="Prolix Ring",
ring2="Weatherspoon ring",
back="Swith Cape +1",
waist="Ninurta's sash",
legs="Artsieq hose",
feet="Academic's Loafers +1"}

sets.midcast.Cure = {
main="Tamaxchi",
sub="Genbu's Shield",
ammo="Incantor Stone",
head="Gendewitha caubeen",
neck="Colossus's Torque",
ear1="Loquacious Earring",
ear2="Enchanter Earring +1",
body="Heka's Kalasiris",
hands="Gendewitha gages +1",
ring1="Ephedra Ring",
ring2="Sirona's Ring",
back="Swith Cape +1",
waist="Ninurta's sash",
legs="Artsieq hose",
feet="Rubeus boots"}

sets.midcast.CureWithLightWeather = {
main="Tamaxchi",
sub="Genbu's Shield",
ammo="Incantor Stone",
head="Gendewitha caubeen",
neck="Colossus's Torque",
ear1="Loquacious Earring",
ear2="Enchanter Earring +1",
body="Heka's Kalasiris",
hands="Gendewitha gages +1",
ring1="Ephedra Ring",
ring2="Sirona's Ring",
back="Swith Cape +1",
waist="Ninurta's sash",
legs="Artsieq hose",
feet="Rubeus boots"}

sets.midcast.Curaga = sets.midcast.Cure

sets.midcast.Regen = {main="Bolelabunga",head="Savant's Bonnet +2"}

sets.midcast.Cursna = {
neck="Malison Medallion",
hands="Hieros Mittens",
ring1="Ephedra Ring",
feet="Gendewitha Galoshes"}

sets.midcast['Enhancing Magic'] = {
main="Kirin's pole",
sub="Fulcio grip",
ammo="Savant's Treatise",
head="Savant's Bonnet +2",
neck="Colossus's Torque",
body="Anhur Robe",
hands="Savant's bracers +2",
back="Merciful cape",
waist="Cascade belt",
legs="Scholar's Pants",
feet="Rubeus boots"}

sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})

sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {feet="Pedagogy Loafers"})

sets.midcast.Protect = {ring1="Sheltered Ring"}
sets.midcast.Protectra = sets.midcast.Protect

sets.midcast.Shell = {ring1="Sheltered Ring"}
sets.midcast.Shellra = sets.midcast.Shell


-- Custom spell classes
sets.midcast.MndEnfeebles = {
main={ name="Lehbrailg +2", augments={'DMG:+15','Elem. magic skill +6','Mag. Acc.+20',}},
sub="Mephitis Grip",
range="Aureole",
head="Nahtirah Hat",
neck="Eddy necklace",
ear1="Psystorm Earring",
ear2="Lifestorm Earring",
body="Savant's Gown +2",
hands="Hagondes cuffs",
ring1="Sangoma Ring",
ring2="Weatherspoon Ring",
back="Bookworm's Cape",
legs="Artsieq hose",
feet="Uk'uxkaj Boots"}

sets.midcast.IntEnfeebles = {
main={ name="Lehbrailg +2", augments={'DMG:+15','Elem. magic skill +6','Mag. Acc.+20',}},
sub="Mephitis Grip",
range="Aureole",
head="Nahtirah Hat",
neck="Eddy necklace",
ear1="Psystorm Earring",
ear2="Lifestorm Earring",
body="Savant's gown +2",
hands="Hagondes cuffs",
ring1="Icesoul Ring",
ring2="Sangoma Ring",
back="Bookworm's Cape",
legs="Artsieq hose",
feet="Uk'uxkaj Boots"}

sets.midcast.ElementalEnfeeble = sets.midcast.IntEnfeebles

sets.midcast['Dark Magic'] = {
main={ name="Lehbrailg +2", augments={'DMG:+15','Elem. magic skill +6','Mag. Acc.+20',}},
sub="Mephitis Grip",ammo="Incantor Stone",
head="Nahtirah Hat",neck="Aesir Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
body="Savant's gown +2",hands="Hagondes cuffs",ring1="Weatherspoon Ring",ring2="Sangoma Ring",
back="Bookworm's Cape",waist="Ninurta's sash",legs="Artsieq hose",feet="Umbani boots"}

sets.midcast.Kaustra = {
main={ name="Lehbrailg +2", augments={'DMG:+11','MND+5','"Mag.Atk.Bns."+18',}},
sub="Wizzan Grip",
ammo="Witchstone",
head="Hagondes Hat",
neck="Eddy necklace",
ear1="Hecate's Earring",
ear2="Friomisi Earring",
body="Hagondes Coat",
hands="Otomi Gloves",
ring1="Icesoul Ring",
ring2="Strendu Ring",
back="Toro Cape",
waist="Oneiros sash",
legs="Hagondes Pants +1",
feet="Hagondes Sabots"}

sets.midcast.Drain = {
main={ name="Lehbrailg +2", augments={'DMG:+15','Mag. Acc.+20','Elem. magic skill +6',}},
sub="Mephitis Grip",
ammo="Incantor Stone",
head="Nahtirah Hat",
neck="Aesir Torque",
ear1="Gwati Earring",
ear2="Hirudinea Earring",
body="Scholar's gown",
hands="Gendewitha Gages +1",
ring1="Excelsis Ring",
ring2="Sangoma Ring",
back="Bookworm's Cape",
waist="Fucho-no-obi",
legs="Pedagogy Pants",
feet="Academic's Loafers +1"}

sets.midcast.Aspir = sets.midcast.Drain

sets.midcast.Stun = {
main="Apamajas II",
sub="Arbuda Grip",
ammo="Incantor Stone",
head="Pedagogy mortarboard +1",
neck="Orunmila's torque",
ear1="Loquacious Earring",
ear2="Enchanter Earring +1",
body="Anhur Robe",
hands="Gendewitha Gages +1",
ring1="Prolix Ring",
ring2="Weatherspoon Ring",
back="Swith cape +1",
waist="Ninurta's sash",
legs="Artsieq hose",
feet="Academic's Loafers +1"}

sets.midcast.Stun.Resistant = set_combine(sets.midcast.Stun, {
main={ name="Lehbrailg +2", augments={'DMG:+15','Mag. Acc.+20','Elem. magic skill +6',}},
sub="Mephitis grip",
ear1="Gwati earring"})


-- Elemental Magic sets are default for handling low-tier nukes.
sets.midcast['Elemental Magic'] = {
main={ name="Lehbrailg +2", augments={'DMG:+11','MND+5','"Mag.Atk.Bns."+18',}},
sub="Elder's Grip +1",
ammo="Witchstone",
head="Buremte Hat",
neck="Eddy necklace",
ear1="Hecate's Earring",
ear2="Friomisi Earring",
body="Hagondes Coat",
hands="Otomi Gloves",
ring1="Acumen Ring",
ring2="Strendu Ring",
back="Bookworm's Cape",
waist=gear.ElementalObi,
legs="Hagondes Pants +1",
feet="Umbani boots"}

sets.midcast['Elemental Magic'].Resistant = {
main={ name="Lehbrailg +2", augments={'DMG:+15','Mag. Acc.+20','Elem. magic skill +6',}},
sub="Elder's Grip +1",
ammo="Witchstone",
head="Hagondes Hat",
neck="Eddy necklace",
ear1="Psystorm Earring",
ear2="Lifestorm Earring",
body="Hagondes Coat",
hands="Otomi Gloves",
ring1="Sangoma Ring",
ring2="Weatherspoon Ring",
back="Bookworm's Cape",
waist=gear.ElementalObi,
legs="Hagondes Pants +1",
feet="Umbani boots"}

-- Custom classes for high-tier nukes.
sets.midcast.HighTierNuke = {
main={ name="Lehbrailg +2", augments={'DMG:+15','Mag. Acc.+20','Elem. magic skill +6',}},
sub="Elder's Grip +1",
ammo="Witchstone",
head="Hagondes Hat",
neck="Eddy necklace",
ear1="Hecate's Earring",
ear2="Friomisi Earring",
body="Hagondes Coat",
hands="Otomi Gloves",
ring1="Icesoul Ring",
ring2="Strendu Ring",
back="Toro Cape",
waist=gear.ElementalObi,
legs="Hagondes Pants +1",
feet="Hagondes Sabots"}

sets.midcast.HighTierNuke.Resistant = {
main={ name="Lehbrailg +2", augments={'DMG:+15','Mag. Acc.+20','Elem. magic skill +6',}},
sub="Mephitis Grip",
ammo="Witchstone",
head="Hagondes Hat",
neck="Eddy necklace",
ear1="Psystorm Earring",
ear2="Lifestorm Earring",
body="Hagondes Coat",
hands="Otomi Gloves",
ring1="Icesoul Ring",
ring2="Strendu Ring",
back="Toro Cape",
waist=gear.ElementalObi,
legs="Hagondes Pants +1",
feet="Umbani boots"}

-- Sets for helixes
sets.midcast.Helix = {
main={ name="Lehbrailg +2", augments={'DMG:+11','MND+5','"Mag.Atk.Bns."+18',}},
sub="Wizzan Grip",ammo="Witchstone",
head="Hagondes Hat",neck="Eddy necklace",ear1="Hecate's Earring",ear2="Friomisi Earring",
body="Hagondes Coat",hands="Otomi Gloves",ring1="Acumen Ring",ring2="Strendu Ring",
back="Toro Cape",waist=gear.ElementalObi,legs="Hagondes Pants +1",feet="Umbani boots"}

sets.midcast.Helix.Resistant = {
main={ name="Lehbrailg +2", augments={'DMG:+15','Mag. Acc.+20','Elem. magic skill +6',}},
sub="Mephitis Grip",ammo="Witchstone",
head="Hagondes Hat",neck="Eddy necklace",ear1="Psystorm Earring",ear2="Lifestorm Earring",
body="Hagondes Coat",hands="Otomi Gloves",ring1="Icesoul Ring",ring2="Strendu Ring",
back="Toro Cape",waist=gear.ElementalObi,legs="Hagondes Pants +1",feet="Umbani boots"}

sets.midcast.Impact = {
main={ name="Lehbrailg +2", augments={'DMG:+15','Mag. Acc.+20','Elem. magic skill +6',}},
sub="Mephitis Grip",ammo="Witchstone",
head=empty,neck="Eddy necklace",ear1="Psystorm Earring",ear2="Lifestorm Earring",
body="Twilight Cloak",hands="Hagondes cuffs",ring1="Sangoma Ring",ring2="Weatherspoon Ring",
back="Ogapepo Cape",waist=gear.ElementalObi,legs="Artsieq hose",feet="Umbani Boots"}


-- Sets to return to when not performing an action.

-- Resting sets
sets.resting = {main="Bolelabunga",sub="Genbu's shield",
head="Nefer Khat",neck="Wiglen Gorget",
body="Heka's Kalasiris",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
waist="Fucho-no-obi",legs="Assiduity pants +1",feet="Serpentes Sabots"}


-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

sets.idle.Town = {main="Bolelabunga",sub="Genbu's Shield",ammo="Incantor Stone",
head="Nahtirah hat",neck="Wiglen Gorget",ear1="Loquacious Earring",
body="Councilor's garb",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
back="Umbra Cape",waist="Fucho-no-obi",legs="Assiduity pants +1", feet="Serpentes sabots"}


sets.idle.Field = {main="Bolelabunga",sub="Genbu's Shield",ammo="Incantor Stone",
head="Nefer Khat",neck="Wiglen Gorget",ear1="Loquacious Earring",
body="Heka's Kalasiris",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
back="Umbra Cape",waist="Fucho-no-obi",legs="Assiduity pants +1",feet="Serpentes sabots"}



sets.idle.Field.PDT = {main="Terra's staff" ,sub="Oneiros grip",ammo="Incantor Stone",
head="Nahtirah Hat",neck="Wiglen Gorget",ear1="Loquacious Earring",ear2="Gwati Earring",
body="Hagondes Coat",hands="Hagondes cuffs",ring1="Dark Ring",ring2="Defending Ring",
back="Umbra Cape",waist="Fucho-no-obi",legs="Hagondes Pants +1",feet="Hagondes sabots"}

sets.idle.Field.Stun = {main="Apamajas II",sub="Mephitis Grip",ammo="Incantor Stone",
head="Nahtirah Hat",neck="Aesir Torque",ear1="Loquacious earring",ear2="Enchanter earring +1",
body="Anhur robe",hands="Gendewitha Gages +1",ring1="Prolix Ring",ring2="Weatherspoon Ring",
back="Swith Cape +1",waist="Ninurta's sash",legs="Artsieq hose",feet="Academic's Loafers +1"}

sets.idle.Weak = {main="Bolelabunga" ,sub="Genbu's shield",ammo="Incantor Stone",
head="Hagondes Hat",neck="Wiglen Gorget",ear1="Loquacious Earring",ear2="Gwati Earring",
body="Hagondes Coat",hands="Hagondes cuffs",ring1="Dark Ring",ring2="Defending Ring",
back="Umbra Cape",waist="Fucho-no-obi",legs="Hagondes Pants +1",feet="Hagondes sabots"}

-- Defense sets

sets.defense.PDT = {main="Terra's staff",sub="Oneiros Grip",ammo="Incantor Stone",
head="Nahtirah Hat",neck="Twilight Torque", ear2="Loquacious Earring",
body="Hagondes Coat",hands="Hagondes cuffs",ring1="Dark Ring",ring2="Defending Ring",
back="Umbra Cape",waist="Fucho-no-obi",legs="Hagondes Pants +1",feet="Hagondes Sabots"}

sets.defense.MDT = {main=gear.Staff.PDT,sub="Oneiros grip",ammo="Incantor Stone",
head="Nahtirah Hat",neck="Twilight Torque",ear2="Loquacious Earring",
body="Vanir Cotehardie",hands="Gendewitha gages +1",ring1="Dark Ring",ring2="Defending Ring", legs="Hagondes pants +1",feet="Hagondes Sabots"}

sets.Kiting = {feet="Desert boots +1"}

-- Engaged sets

-- Variations for TP weapon and (optional) offense/defense modes. Code will fall back on previous
-- sets if more refined versions aren't defined.
-- If you create a set with both offense and defense modes, the offense mode should be first.
-- EG: sets.engaged.Dagger.Accuracy.Evasion

-- Normal melee group
sets.engaged = {
head="Gendewitha caubeen",
body="Vanir Cotehardie",ring1="Rajas Ring",
waist="Ninurta's sash",legs="Hagondes Pants +1",feet="Hagondes Sabots"}



-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
sets.buff['Ebullience'] = {head="Savant's Bonnet +2"}
sets.buff['Rapture'] = {head="Savant's Bonnet +2"}
sets.buff['Perpetuance'] = {hands="Savant's Bracers +2"}
sets.buff['Immanence'] = {hands="Savant's Bracers +2"}
sets.buff['Penury'] = {legs="Savant's Pants +2"}
sets.buff['Parsimony'] = {legs="Savant's Pants +2"}
sets.buff['Celerity'] = {feet="Pedagogy Loafers"}
sets.buff['Alacrity'] = {head="Nahtirah hat", feet="Pedagogy Loafers"}

sets.buff['Klimaform'] = {feet="Savant's Loafers +2"}

sets.buff.FullSublimation = {head="Academic's Mortarboard",ear1="Savant's Earring",body="Argute Gown +2"}
sets.buff.PDTSublimation = {head="Academic's Mortarboard",ear1="Savant's Earring"}

sets.buff['Sandstorm'] = {feet="Desert Boots +1",}



end
-- Setup vars that are user-independent. state.Buff vars initialized here will automatically be tracked.
function job_setup()
info.addendumNukes = S{"Stone IV", "Water IV", "Aero IV", "Fire IV", "Blizzard IV", "Thunder IV",
"Stone V", "Water V", "Aero V", "Fire V", "Blizzard V", "Thunder V"}
state.Buff['Sublimation: Activated'] = buffactive['Sublimation: Activated'] or false
update_active_strategems()
end
-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job. Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------
-- Setup vars that are user-dependent. Can override this function in a sidecar file.
function user_setup()
state.OffenseMode:options('None', 'Normal')
state.CastingMode:options('Normal', 'Resistant')
state.IdleMode:options('Normal', 'PDT')
info.low_nukes = S{"Stone", "Water", "Aero", "Fire", "Blizzard", "Thunder"}
info.mid_nukes = S{"Stone II", "Water II", "Aero II", "Fire II", "Blizzard II", "Thunder II",
"Stone III", "Water III", "Aero III", "Fire III", "Blizzard III", "Thunder III",
"Stone IV", "Water IV", "Aero IV", "Fire IV", "Blizzard IV", "Thunder IV",}
info.high_nukes = S{"Stone V", "Water V", "Aero V", "Fire V", "Blizzard V", "Thunder V"}
gear.macc_hagondes = {name="Hagondes Cuffs", augments={'Phys. dmg. taken -3%','Mag. Acc.+29'}}
send_command('bind ^` input /ma Stun <t>')
select_default_macro_book()
end
function user_unload()
send_command('unbind ^`')
end
-- Define sets and vars used by this job file.
function init_gear_sets()
--------------------------------------
-- Start defining the sets
end
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
-- Run after the general midcast() is done.
function job_post_midcast(spell, action, spellMap, eventArgs)
if spell.action_type == 'Magic' then
apply_grimoire_bonuses(spell, action, spellMap, eventArgs)
end
end
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------
-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
if buff == "Sublimation: Activated" then
handle_equipping_gear(player.status)
end
end
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
if default_spell_map == 'Cure' or default_spell_map == 'Curaga' then
if world.weather_element == 'Light' then
return 'CureWithLightWeather'
end
elseif spell.skill == 'Enfeebling Magic' then
if spell.type == 'WhiteMagic' then
return 'MndEnfeebles'
else
return 'IntEnfeebles'
end
elseif spell.skill == 'Elemental Magic' then
if info.low_nukes:contains(spell.english) then
return 'LowTierNuke'
elseif info.mid_nukes:contains(spell.english) then
return 'MidTierNuke'
elseif info.high_nukes:contains(spell.english) then
return 'HighTierNuke'
end
end
end
end
function customize_idle_set(idleSet)
if state.Buff['Sublimation: Activated'] then
if state.IdleMode.value == 'Normal' then
idleSet = set_combine(idleSet, sets.buff.FullSublimation)
elseif state.IdleMode.value == 'PDT' then
idleSet = set_combine(idleSet, sets.buff.PDTSublimation)
end
end
if player.mpp < 51 then
idleSet = set_combine(idleSet, sets.latent_refresh)
end
return idleSet
end
-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
if cmdParams[1] == 'user' and not (buffactive['light arts'] or buffactive['dark arts'] or
buffactive['addendum: white'] or buffactive['addendum: black']) then
if state.IdleMode.value == 'Stun' then
send_command('@input /ja "Dark Arts" <me>')
else
send_command('@input /ja "Light Arts" <me>')
end
end
update_active_strategems()
update_sublimation()
end
-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
display_current_caster_state()
eventArgs.handled = true
end
-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------
-- Called for direct player commands.
function job_self_command(cmdParams, eventArgs)
if cmdParams[1]:lower() == 'scholar' then
handle_strategems(cmdParams)
eventArgs.handled = true
end
end
-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
-- Reset the state vars tracking strategems.
function update_active_strategems()
state.Buff['Ebullience'] = buffactive['Ebullience'] or false
state.Buff['Rapture'] = buffactive['Rapture'] or false
state.Buff['Perpetuance'] = buffactive['Perpetuance'] or false
state.Buff['Immanence'] = buffactive['Immanence'] or false
state.Buff['Penury'] = buffactive['Penury'] or false
state.Buff['Parsimony'] = buffactive['Parsimony'] or false
state.Buff['Celerity'] = buffactive['Celerity'] or false
state.Buff['Alacrity'] = buffactive['Alacrity'] or false
state.Buff['Klimaform'] = buffactive['Klimaform'] or false
end
function update_sublimation()
state.Buff['Sublimation: Activated'] = buffactive['Sublimation: Activated'] or false
end
-- Equip sets appropriate to the active buffs, relative to the spell being cast.
function apply_grimoire_bonuses(spell, action, spellMap)
if state.Buff.Perpetuance and spell.type =='WhiteMagic' and spell.skill == 'Enhancing Magic' then
equip(sets.buff['Perpetuance'])
end
if state.Buff.Rapture and (spellMap == 'Cure' or spellMap == 'Curaga') then
equip(sets.buff['Rapture'])
end
if spell.skill == 'Elemental Magic' and spellMap ~= 'ElementalEnfeeble' then
if state.Buff.Ebullience and spell.english ~= 'Impact' then
equip(sets.buff['Ebullience'])
end
if state.Buff.Immanence then
equip(sets.buff['Immanence'])
end
if state.Buff.Klimaform and spell.element == world.weather_element then
equip(sets.buff['Klimaform'])
end
end
if state.Buff.Penury then equip(sets.buff['Penury']) end
if state.Buff.Parsimony then equip(sets.buff['Parsimony']) end
if state.Buff.Celerity then equip(sets.buff['Celerity']) end
if state.Buff.Alacrity then equip(sets.buff['Alacrity']) end
end
-- General handling of strategems in an Arts-agnostic way.
-- Format: gs c scholar <strategem>
function handle_strategems(cmdParams)
-- cmdParams[1] == 'scholar'
-- cmdParams[2] == strategem to use
if not cmdParams[2] then
add_to_chat(123,'Error: No strategem command given.')
return
end
local strategem = cmdParams[2]:lower()
if strategem == 'light' then
if buffactive['light arts'] then
send_command('input /ja "Addendum: White" <me>')
elseif buffactive['addendum: white'] then
add_to_chat(122,'Error: Addendum: White is already active.')
else
send_command('input /ja "Light Arts" <me>')
end
elseif strategem == 'dark' then
if buffactive['dark arts'] then
send_command('input /ja "Addendum: Black" <me>')
elseif buffactive['addendum: black'] then
add_to_chat(122,'Error: Addendum: Black is already active.')
else
send_command('input /ja "Dark Arts" <me>')
end
elseif buffactive['light arts'] or buffactive['addendum: white'] then
if strategem == 'cost' then
send_command('input /ja Penury <me>')
elseif strategem == 'speed' then
send_command('input /ja Celerity <me>')
elseif strategem == 'aoe' then
send_command('input /ja Accession <me>')
elseif strategem == 'power' then
send_command('input /ja Rapture <me>')
elseif strategem == 'duration' then
send_command('input /ja Perpetuance <me>')
elseif strategem == 'accuracy' then
send_command('input /ja Altruism <me>')
elseif strategem == 'enmity' then
send_command('input /ja Tranquility <me>')
elseif strategem == 'skillchain' then
add_to_chat(122,'Error: Light Arts does not have a skillchain strategem.')
elseif strategem == 'addendum' then
send_command('input /ja "Addendum: White" <me>')
else
add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
end
elseif buffactive['dark arts'] or buffactive['addendum: black'] then
if strategem == 'cost' then
send_command('input /ja Parsimony <me>')
elseif strategem == 'speed' then
send_command('input /ja Alacrity <me>')
elseif strategem == 'aoe' then
send_command('input /ja Manifestation <me>')
elseif strategem == 'power' then
send_command('input /ja Ebullience <me>')
elseif strategem == 'duration' then
add_to_chat(122,'Error: Dark Arts does not have a duration strategem.')
elseif strategem == 'accuracy' then
send_command('input /ja Focalization <me>')
elseif strategem == 'enmity' then
send_command('input /ja Equanimity <me>')
elseif strategem == 'skillchain' then
send_command('input /ja Immanence <me>')
elseif strategem == 'addendum' then
send_command('input /ja "Addendum: Black" <me>')
else
add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
end
else
add_to_chat(123,'No arts has been activated yet.')
end
end
-- Gets the current number of available strategems based on the recast remaining
-- and the level of the sch.
function get_current_strategem_count()
-- returns recast in seconds.
local allRecasts = windower.ffxi.get_ability_recasts()
local stratsRecast = allRecasts[231]
local maxStrategems = (player.main_job_level + 10) / 20
local fullRechargeTime = 4*60
local currentCharges = math.floor(maxStrategems - maxStrategems * stratsRecast / fullRechargeTime)
return currentCharges
end
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
set_macro_page(1, 19)
end