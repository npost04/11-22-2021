
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
end
-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job. Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------
-- Setup vars that are user-dependent. Can override this function in a sidecar file.
function user_setup()
state.OffenseMode:options('None', 'Normal')
state.CastingMode:options('Normal', 'Resistant', 'Proc')
state.IdleMode:options('Normal', 'PDT')
state.MagicBurst = M(false, 'Magic Burst')
lowTierNukes = S{'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder',
'Stone II', 'Water II', 'Aero II', 'Fire II', 'Blizzard II', 'Thunder II',
'Stone III', 'Water III', 'Aero III', 'Fire III', 'Blizzard III', 'Thunder III',
'Stonega', 'Waterga', 'Aeroga', 'Firaga', 'Blizzaga', 'Thundaga',
'Stonega II', 'Waterga II', 'Aeroga II', 'Firaga II', 'Blizzaga II', 'Thundaga II'}
gear.macc_hagondes = {name="Hagondes Cuffs", augments={'Phys. dmg. taken -1%','Mag. Acc.+15'}}
-- Additional local binds
send_command('bind ^` input /ma Stun <t>')
send_command('bind @` gs c activate MagicBurst')
select_default_macro_book()
end
-- Called when this job file is unloaded (eg: job change)
function user_unload()
send_command('unbind ^`')
send_command('unbind @`')
end
-- Define sets and vars used by this job file.
function init_gear_sets()

-- Start defining the sets
---- Precast Sets ----

-- Precast sets to enhance JAs
sets.precast.JA['Mana Wall'] = {feet="Goetia Sabots +2"}
sets.precast.JA.Manafont = {body="Sorcerer's Coat +2"}
-- equip to maximize HP (for Tarus) and minimize MP loss before using convert
sets.precast.JA.Convert = {}
-- Fast cast sets for spells

sets.precast.FC = {
main="Marin staff",
sub="Oneiros grip",
head="Nahtirah Hat",
neck="Orunmila's torque",
ear1="Enchanter earring +1",
ear2="Loquacious Earring",
body="Anhur robe",
hands="Otomi gloves",
ring1="Prolix Ring",
ring2="Weatherspoon ring",
legs="Artsieq hose",
back="Swith Cape +1",
waist="Witful belt",
legs="Artsieq hose",
feet="Regal pumps"}

sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
waist="Siegel Sash"})

sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {
neck="Stoicheion Medal"})

sets.precast.FC.Cure = set_combine(sets.precast.FC, {
body="Heka's Kalasiris", 
back="Pahtli Cape"})

sets.precast.FC.Curaga = sets.precast.FC.Cure
-- Weaponskill sets
-- Default set for any weaponskill that isn't any more specifically defined
sets.precast.WS = {
head="Hagondes Hat",
neck="Asperity Necklace",
ear1="Brutal Earring",
ear2="Moonshade earring",
body="Hagondes Coat",
hands="Yaoyotl Gloves",
ring1="Rajas Ring",
ring2="Icesoul Ring",
back="Refraction Cape",
waist="Cognition Belt",
legs="Hagondes Pants +1",
feet="Hagondes Sabots"}

sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})

-- Specific weaponskill sets. Uses the base set if an appropriate WSMod version isn't found.
sets.precast.WS['Vidohunir'] = {
ammo="Dosis Tathlum",
head="Hagondes Hat",
neck="Eddy Necklace",
ear1="Friomisi Earring",
ear2="Hecate's Earring",
body="Hagondes Coat",
hands="Yaoyotl Gloves",
ring1="Icesoul Ring",
ring2="Acumen Ring",
back="Toro Cape",
waist="Thunder Belt",
legs="Hagondes Pants +1",
feet="Hagondes Sabots"}

---- Midcast Sets ----
sets.midcast.FastRecast = {
head="Nahtirah Hat",
ear1="Enchntr. Earring +1",
ear2="Loquacious Earring",
body="Anhur robe",
hands="Otomi gloves",
ring1="Prolix Ring",
ring2="Weather. ring",
back="Swith Cape +1",
waist="Witful belt",
legs="Artsieq hose",
feet="Hagondes Sabots"}

sets.midcast.Cure = {
main="Tamaxchi",
sub="Genbu's Shield",
head="Nahtirah Hat",
neck="Colossus's Torque",
ear2="Loquacious Earring",
body="Heka's Kalasiris",
hands="Bokwus gloves",
ring1="Ephedra Ring",
ring2="Sirona's Ring",
back="Pahtli Cape",
waist=gear.ElementalObi,
legs="Artsieq hose",
feet="Serpentes sabots"}

sets.midcast.Curaga = sets.midcast.Cure

sets.midcast['Enhancing Magic'] = {
main="Kirin's pole",
sub="Fulcio grip",
head="Umuthi hat",
neck="Colossus's Torque",
body="Anhur robe",
hands="Ayao's Gages",
legs="Portent Pants"}

sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
main="Kirin's pole",
sub="Fulcio grip",
neck="Stone gorget",
waist="Siegel Sash",})

sets.midcast.Impact = {
main={name="Lehbrailg +2", augments={'DMG:+15','Mag. Acc.+20','Elem. magic skill +6',}},
sub="Mephitis Grip",
ammo="Witchstone",
head=empty,
neck="Eddy necklace",
ear1="Psystorm Earring",
ear2="Lifestorm Earring",
body="Twilight Cloak",
hands={name="Hagondes cuffs", augments={'Mag. Acc+15', 'Phys. dmg. taken -1%',}},
ring1="Sangoma Ring",
ring2="Weatherspoon Ring",
back="Bane Cape",
waist="Ovate rope",
legs="Artsieq hose",
feet="Hagondes sabots"}


sets.midcast['Enfeebling Magic'] = {
main={ name="Lehbrailg +2", augments={'DMG:+15','Elem. magic skill +6','Mag. Acc.+20',}},
sub="Mephitis Grip",
ranged="Aureole",
head="Buremte Hat",
neck="Eddy necklace",
ear1="Enchanter Earring +1",
ear2="Gwati Earring",
body="Helios jacket",
hands={name="Hagondes cuffs", augments={'Mag. Acc+15', 'Phys. dmg. taken -1%',}},
ring1="Sangoma Ring",
ring2="Weather. Ring",
back="Bane Cape",
waist="Ovate rope",
legs="Artsieq hose",
feet="Hagondes sabots"}

sets.midcast.Sleep = {
main={ name="Lehbrailg +2", augments={'DMG:+15','Elem. magic skill +6','Mag. Acc.+20',}},
sub="Mephitis Grip",
ranged="Aureole",
head="Buremte Hat",
neck="Eddy necklace",
ear1="Enchanter Earring +1",
ear2="Gwati Earring",
body="Helios jacket",
hands={name="Hagondes cuffs", augments={'Mag. Acc+15', 'Phys. dmg. taken -1%',}},
ring1="Sangoma Ring",
ring2="Weather. Ring",
back="Bane Cape",
waist="Ovate rope",
legs="Artsieq hose",
feet="Hagondes sabots"}

sets.midcast.Sleep2 = {
main={ name="Lehbrailg +2", augments={'DMG:+15','Elem. magic skill +6','Mag. Acc.+20',}},
sub="Mephitis Grip",
ranged="Aureole",
head="Buremte Hat",
neck="Eddy necklace",
ear1="Enchanter Earring +1",
ear2="Gwati Earring",
body="Helios jacket",
hands={name="Hagondes cuffs", augments={'Mag. Acc+15', 'Phys. dmg. taken -1%',}},
ring1="Sangoma Ring",
ring2="Weather. Ring",
back="Bane Cape",
waist="Ovate rope",
legs="Artsieq hose",
feet="Hagondes sabots"}


sets.midcast.ElementalEnfeeble = sets.midcast['Enfeebling Magic']

sets.midcast['Dark Magic'] = {
main={ name="Lehbrailg +2", augments={'DMG:+15','Elem. magic skill +6','Mag. Acc.+20',}},
sub="Mephitis Grip",
ranged="Aureole",
head="Nahtirah Hat",
neck="Aesir Torque",
ear1="Psystorm Earring",
ear2="Lifestorm Earring",
body="Vanir Cotehardie",
hands={name="Hagondes cuffs", augments={'Mag. Acc+15', 'Phys. dmg. taken -1%',}},
ring1="Weather. Ring",
ring2="Sangoma Ring",
back="Refraction Cape",
waist="Ovate rope",
legs="Artsieq hose",
feet="Uk'uxkaj boots"}

sets.midcast.Drain = {
main={ name="Lehbrailg +2", augments={'DMG:+15','Elem. magic skill +6','Mag. Acc.+20',}},
sub="Mephitis Grip",
ranged="Aureole",
head="Pixie hairpin +1",
neck="Eddy necklace",
ear1="Psystorm Earring",
ear2="Lifestorm Earring",
body="Helios jacket",
hands={name="Hagondes cuffs", augments={'Mag. Acc+15', 'Phys. dmg. taken -1%',}},
ring1="Archon Ring",
ring2="Sangoma Ring",
back="Bane Cape",
waist="Fucho-no-Obi",
legs="Artsieq hose",
feet="Goetia Sabots +2"}

sets.midcast.Aspir = sets.midcast.Drain


sets.midcast.Stun = {
main="Apamajas II",
sub="Mephitis Grip",
ammo="Sturm's Report",
head="Nahtirah Hat",
neck="Orunmila's torque",
ear1="Loquacious Earring",
ear2="Enchntr. Earring +1",
body="Helios jacket",
hands={name="Hagondes cuffs", augments={'Mag. Acc+15', 'Phys. dmg. taken -1%',}},
ring1="Prolix Ring",
ring2="Weather Ring",
back="Swith Cape +1",
waist="Witful Belt",
legs="Artsieq hose",
feet="Hagondes sabots"}


sets.midcast.Stun.Resistant = {
main={ name="Lehbrailg +2", augments={'DMG:+15','Elem. magic skill +6','Mag. Acc.+20',}},
sub="Mephitis Grip",
ammo="Sturm's Report",
head="Nahtirah Hat",
neck="Orunmila's torque",
ear1="Loquacious Earring",
ear2="Enchntr. Earring +1",
body="Anhur robe",
hands={name="Hagondes cuffs", augments={'Mag. Acc+15', 'Phys. dmg. taken -1%',}},
ring1="Prolix Ring",
ring2="Weather Ring",
back="Swith Cape +1",
waist="Witful Belt",
legs="Artsieq hose",
feet="Hagondes sabots"}

sets.midcast.BardSong = {main="Lehbrailg +2",sub="Mephitis Grip",ammo="Sturm's Report",
head="Nahtirah Hat",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Strendu Ring",ring2="Sangoma Ring",
back="Refraction Cape",legs="Bokwus Slops",feet="Bokwus Boots"}

-- Elemental Magic sets
sets.midcast['Elemental Magic'] = {
main={ name="Lehbrailg +2", augments={'DMG:+11','MND+5','"Mag.Atk.Bns."+18',}},
sub="Elder's Grip +1",
ammo="Dosis tathlum",
head="Buremte hat",
neck="Eddy Necklace",
ear1="Hecate's Earring",
ear2="Friomisi Earring",
body="Hagondes Coat",
hands="Otomi Gloves",
ring1="Strendu Ring",
ring2="Acumen Ring",
back="Bane Cape",
waist="Sekhmet corset",
legs="Hagondes Pants +1",
feet="Umbani boots"}



sets.midcast['Elemental Magic'].Resistant = {
main={ name="Lehbrailg +2", augments={'DMG:+15','Elem. magic skill +6','Mag. Acc.+20',}},
sub="Mephitis Grip",
ranged="Aureole",
head="Buremte hat",
neck="Eddy Necklace",
ear1="Hecate's Earring",
ear2="Friomisi Earring",
body="Hagondes Coat",
hands={name="Hagondes cuffs", augments={'Mag. Acc+15', 'Phys. dmg. taken -1%',}},
ring1="Sangoma Ring",
ring2="Weather. Ring",
back="Bane cape",
waist=gear.ElementalObi,
legs="Hagondes Pants +1",
feet="Umbani boots"}

sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {
ammo="Witchstone",
sub="Elder's grip +1",
head="Helios band",
back="Toro cape",
waist=gear.ElementalObi})

sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'], {
ranged="Aureole",
sub="Elder's grip +1",
head="Buremte hat",
back="Bane cape",
waist=gear.ElementalObi})

-- Minimal damage gear for procs.
sets.midcast['Elemental Magic'].Proc = {
main="Earth Staff",
sub="Mephitis Grip",
ammo="Impatiens",
head="Nahtirah Hat",
neck="Twilight Torque",
ear1="Bloodgem Earring",
ear2="Loquacious Earring",
body="Manasa Chasuble",
hands="Serpentes Cuffs",
ring1="Sheltered Ring",
ring2="Paguroidea Ring",
back="Swith Cape +1",
waist="Witful Belt",
legs="Nares Trews",
feet="Chelona Boots +1"}

-- Sets to return to when not performing an action.
-- Resting sets
sets.resting = {
main="Chatoyant Staff",
ammo="Clarus Stone",
head="Nefer Khat",
neck="Grandiose Chain",
body="Heka's Kalasiris",
hands="Serpentes Cuffs",
ring1="Sheltered Ring",
ring2="Paguroidea Ring",
waist="Austerity Belt",
legs="Assiduity pants +1",
feet="Serpentes Sabots"}

-- Idle sets
-- Normal refresh idle set
sets.idle = {
main="Bolelabunga",
sub="Genbu's shield",
head="Nefer Khat",
neck="Wiglen Gorget",
body="Heka's Kalasiris",
hands="Serpentes Cuffs",
ring1="Dark Ring",augments={'Phys. dmg. taken -5%','Magic dmg. taken -4%'},
ring2="Defending Ring",
back="Umbra Cape",
waist="Fucho-no-obi",
legs="Assiduity pants +1",
feet="Serpentes sabots"}

-- Idle mode that keeps PDT gear on, but doesn't prevent normal gear swaps for precast/etc.
sets.idle.PDT = {
main="Terra's Staff",
sub="Mephitis Grip",
ammo="Impatiens",
head="Hagondes Hat",
neck="Twilight Torque",
ear1="Bloodgem Earring",
ear2="Loquacious Earring",
body="Hagondes Coat",
hands={name="Hagondes cuffs", augments={'Mag. Acc+15', 'Phys. dmg. taken -1%',}},
ring1="Defending Ring",
ring2="Dark Ring",augments={'Phys. dmg. taken -5%','Magic dmg. taken =4%'},
back="Umbra Cape",
waist="Fucho-no-obi",
legs="Hagondes Pants +1",
feet="Herald's Gaiters"}

-- Idle mode scopes:
-- Idle mode when weak.
sets.idle.Weak = {main="Bolelabunga",sub="Genbu's Shield",ammo="Impatiens",
head="Hagondes Hat",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Paguroidea Ring",
back="Umbra Cape",waist="Hierarch Belt",legs="Assiduity pants +1",feet="Hagondes Sabots"}


-- Defense sets
sets.defense.PDT = {main="Bolelabunga", sub="Genbu's shield",
head="Hagondes hat", neck="Twilight Torque",
body="Hagondes Coat",hands="Hagondes cuffs",ring1="Defending Ring",ring2="Dark Ring",
back="Umbra Cape",waist="Chaac Belt",legs="Hagondes Pants +1",feet="Hagondes Sabots"}

sets.defense.MDT = {ammo="Demonry Stone",
head="Nahtirah Hat",neck="Twilight Torque",
body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Shadow Ring",
back="Tuilha Cape",waist="Hierarch Belt",legs="Bokwus Slops",feet="Hagondes Sabots"}

sets.Kiting = {feet="Herald's gaiters"}

sets.latent_refresh = {waist="Fucho-no-obi"}



-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
sets.buff['Mana Wall'] = {feet="Goetia Sabots +2"}
-- Engaged sets
-- Variations for TP weapon and (optional) offense/defense modes. Code will fall back on previous
-- sets if more refined versions aren't defined.
-- If you create a set with both offense and defense modes, the offense mode should be first.
-- EG: sets.engaged.Dagger.Accuracy.Evasion
-- Normal melee group

sets.engaged = {
head="Umuthi hat",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Helios jacket",hands="Otomi gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
back="Kayapa Cape",waist="Windbuffet Belt +1",legs="Telchine braconi",feet="Umbani boots"}

sets.engaged.PDT = {main="Bolelabunga", sub="Genbu's shield",
head="Hagondes hat", neck="Twilight Torque",
body="Hagondes Coat",hands="Hagondes cuffs",ring1="Defending Ring",ring2="Dark Ring",
back="Umbra Cape",waist="Chaac Belt",legs="Hagondes Pants +1",feet="Hagondes Sabots"}

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
if spellMap == 'Cure' or spellMap == 'Curaga' then
gear.default.obi_waist = "Goading belt"
elseif spell.skill == 'Elemental Magic' then
gear.default.obi_waist = "Sekhmet Corset"
if state.CastingMode.value == 'Proc' then
classes.CustomClass = 'Proc'
end
end
end
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
end
function job_post_midcast(spell, action, spellMap, eventArgs)
if spell.skill == 'Elemental Magic' and state.MagicBurst.value then
equip(sets.magic_burst)
end
-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Elemental Magic' then
        if spell.element == world.day_element or spell.element == world.weather_element then
            equip(sets.midcast['Elemental Magic'], {waist="Hachirin-No-Obi"})
        end
    end
end
end
function job_aftercast(spell, action, spellMap, eventArgs)
-- Lock feet after using Mana Wall.
if not spell.interrupted then
if spell.english == 'Mana Wall' then
enable('feet')
equip(sets.buff['Mana Wall'])
disable('feet')
elseif spell.skill == 'Elemental Magic' then
state.MagicBurst:reset()
end
end
end
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------
-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
-- Unlock feet when Mana Wall buff is lost.
if buff == "Mana Wall" and not gain then
enable('feet')
handle_equipping_gear(player.status)
end
end
-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
if stateField == 'Offense Mode' then
if newValue == 'Normal' then
disable('main','sub','range','ammo')
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
if spell.skill == 'Elemental Magic' and default_spell_map ~= 'ElementalEnfeeble' then

if lowTierNukes:contains(spell.english) then
return 'LowTierNuke'
else
return 'HighTierNuke'
end
end
end


-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
if player.mpp < 51 then
idleSet = set_combine(idleSet, sets.latent_refresh)
end
return idleSet
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
set_macro_page(1, 3)
end