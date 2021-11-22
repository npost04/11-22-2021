-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job. Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
--[[
require 'organizer-lib'
Custom commands:
gs c cycle treasuremode (set on ctrl-= by default): Cycles through the available treasure hunter modes.
Treasure hunter modes:
None - Will never equip TH gear
Tag - Will equip TH gear sufficient for initial contact with a mob (either melee, ranged hit, or Aeolian Edge AOE)
SATA - Will equip TH gear sufficient for initial contact with a mob, and when using SATA
Fulltime - Will keep TH gear equipped fulltime
--]]
-- Initialization function for this job file.
function get_sets()
mote_include_version = 2
-- Load and initialize the include file.
include('Mote-Include.lua')
include('Augments.lua')
end
-- Setup vars that are user-independent. state.Buff vars initialized here will automatically be tracked.
function job_setup()
include('Augments.lua')
state.Buff['Sneak Attack'] = buffactive['sneak attack'] or false
state.Buff['Trick Attack'] = buffactive['trick attack'] or false
state.Buff['Feint'] = buffactive['feint'] or false
include('Mote-TreasureHunter')
-- For th_action_check():
-- JA IDs for actions that always have TH: Provoke, Animated Flourish
info.default_ja_ids = S{35, 204}
-- Unblinkable JA IDs for actions that always have TH: Quick/Box/Stutter Step, Desperate/Violent Flourish
info.default_u_ja_ids = S{201, 202, 203, 205, 207}
end
-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job. Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------
-- Setup vars that are user-dependent. Can override this function in a sidecar file.
function user_setup()
state.OffenseMode:options('Normal', 'FullAcc', 'FullBuff', 'FullBuffAcc', 'STP', 'Crit')
state.HybridMode:options('Normal', 'PDT')
state.RangedMode:options('Normal', 'Acc')
state.WeaponskillMode:options('Normal', 'Acc', 'Mod')
state.PhysicalDefenseMode:options('PDT')
state.IdleMode:options('Normal', 'DT')
gear.default.weaponskill_neck = "Asperity Necklace"
gear.default.weaponskill_waist = "Fotia Belt"
gear.FCTaeonTabard = { name="Taeon Tabard", augments={'"Mag.Atk.Bns."+19','"Fast Cast"+5',}}
gear.FCTaeonGloves = { name="Taeon Gloves", augments={'Mag. Acc.+11 "Mag.Atk.Bns."+11','"Fast Cast"+5',}}
gear.FCTaeonBoots = {name="Taeon Boots", augments={'Mag. Acc.+10','"Fast Cast"+5',}}
-- Additional local binds
send_command('bind ^` input /ja "Flee" <me>')
send_command('bind ^= gs c cycle treasuremode')
send_command('bind !- gs c cycle targetmode')

send_command('bind ^q input /ra <t>')
send_command('bind !q input /ra <t>')

select_default_macro_book()
end
-- Called when this job file is unloaded (eg: job change)
function user_unload()
send_command('unbind ^`')
send_command('unbind !-')
end
-- Define sets and vars used by this job file.
function init_gear_sets()
include('Augments.lua')
--------------------------------------
-- Special sets (required by rules)
--------------------------------------
sets.Feint = {legs="Plun. Culottes"}
sets.TreasureHunter = {hands="Plunderer's armlets +1", waist="Chaac belt", feet={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+21','DEX+15','"Treasure Hunter"+1','Accuracy+20 Attack+20','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},}


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

-- Precast Sets

-- Precast sets to enhance JAs
sets.precast.JA['Collaborator'] = {head="Skulker's bonnet +1"}
sets.precast.JA['Accomplice'] = {head="Skulker's bonnet +1"}
sets.precast.JA['Flee'] = {feet="Pillager's Poulaines +1"}
sets.precast.JA['Hide'] = {body="Pillager's Vest +1"}
sets.precast.JA['Conspirator'] = {body="Raider's Vest +2"}
sets.precast.JA['Steal'] = {hands="Pillager's Armlets +1",legs="Pillager's Culottes +1",feet="Pillager's Poulaines +1"}
sets.precast.JA['Despoil'] = {legs="Raider's Culottes +2",feet="Raider's Poulaines +2"}
sets.precast.JA['Perfect Dodge'] = {hands="Plunderer's Armlets +1"}
sets.precast.JA['Feint'] = {legs="Plunderer's Culottes"}



sets.precast.JA['Sneak Attack'] = 
{ammo="Yetshila",
head="Pillager's bonnet +1",
neck="Love torque",
ear1="Dudgeon Earring",
ear2="Heartseeker Earring",
body="Pillager's Vest +1",
hands="Skulker's Armlets",
ring1="Rajas Ring",
ring2="Enlivened Ring",
back="Kayapa cape",
waist="Chiner's belt +1",
legs="Pillager's culottes +1",
feet="Plunderer's poulaines +1"}

sets.precast.JA['Trick Attack'] = 
{ammo="Yetshila",
head="Pillager's bonnet +1",
ear1="Altdorf's Earring",
ear2="Wilhelm's Earring",
body="Pillager's Vest +1",
hands="Pillager's Armlets +1",
ring1="Stormsoul Ring",
ring2="Stormsoul Ring",
back="Atheling Mantle",
waist="Elanid belt",
legs="Pillager's culottes +1",
feet="Plunderer's poulaines +1"}


-- Waltz set (chr and vit)
sets.precast.Waltz = 
{ammo="Sonia's Plectrum",
head="Haruspex hat +1",
neck="Phalaina locket",
ear1="Oneiros earring",
body="Emet harness +1",
hands="Slither gloves +1",
ring1="Asklepian ring",
ring2="Kunaji ring",
back="Iximulew Cape",
waist="Chuq'aba belt",
legs="Pillager's culottes +1",
feet="Plunderer's poulaines +1"}

-- Don't need any special gear for Healing Waltz.
sets.precast.Waltz['Healing Waltz'] = {}

-- Fast cast sets for spells

sets.precast.FC = 
{head="Haruspex Hat +1",
neck="Orunmila's torque",
ear1="Enchanter earring +1",
ear2="Loquacious Earring",
body={ name="Taeon Tabard", augments={'"Mag.Atk.Bns."+19','"Fast Cast"+5',}},
hands=gear.FCTaeonGloves,
ring1="Prolix Ring",
ring2="Weatherspoon ring",
waist="Pya'ekue belt",
legs="Enif Cosciales",
feet=gear.FCTaeonBoots,
}

sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})


-- Ranged snapshot gear
sets.precast.RangedAttack = 
{head="Aurore Beret",
hands="Iuitl Wristbands +1",
legs="Nahtirah Trousers",
feet="Iuitl gaiters +1"}

       
-- Weaponskill sets
-- Default set for any weaponskill that isn't any more specifically defined
gear.default.weaponskill_neck = "Asperity Necklace"
gear.default.weaponskill_waist = "Caudata Belt"

sets.precast.WS = 
{ammo="Yetshila",
head="Adhemar bonnet",
neck="Fotia gorget",
ear1="Brutal Earring",
ear2="Moonshade Earring",
body="Adhemar jacket +1",
hands="Meg. gloves +2",
ring1="Epona's Ring",
ring2="Rajas Ring",
back=gear.ThfSTPCape,
waist="Fotia belt",
legs="Lustr. subligar +1",
feet=gear.THHerculeanBoots}

sets.precast.WS.Acc = set_combine(sets.precast.WS, {ammo="Yetshila",body="Emet harness +1", back="Letalis Mantle"})

-- Specific weaponskill sets. Uses the base set if an appropriate WSMod version isn't found.

sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, 
{head="Uk'uxkaj cap",
neck="Fotia gorget",
ear1="Altdorf's earring",
ear2="Wilhelm's earring",
body="Khepri jacket",
hands="Iuitl wristbands +1",
ring1="Stormsoul Ring",
ring2="Stormsoul ring",
back="Atheling mantle",
waist="Fotia belt",
legs="Kaabnax Trousers",
feet="Plunderer's poulaines +1"})

sets.precast.WS['Exenterator'].Acc = set_combine(sets.precast.WS['Exenterator'], 
{ammo="Yetshila",
head="Whirlpool mask",
ear1="Steelflash earring",
ear2="Bladeborn earring",
hands="Buremte gloves",
ring1="Mars's ring",
ring2="Enlivened ring",
back="Kayapa cape",
feet="Pillager's poulaines +1"})

sets.precast.WS['Exenterator'].Mod = set_combine(sets.precast.WS['Exenterator'], {waist="Fotia belt"})

sets.precast.WS['Exenterator'].SA = set_combine(sets.precast.WS['Exenterator'].Mod, 
{ammo="Yetshila",
neck=gear.ElementalGorget})

sets.precast.WS['Exenterator'].TA = set_combine(sets.precast.WS['Exenterator'].Mod, 
{ammo="Yetshila",
body="Pillager's Vest +1",
neck=gear.ElementalGorget})

sets.precast.WS['Exenterator'].SATA = set_combine(sets.precast.WS['Exenterator'].Mod, 
{ammo="Yetshila",
body="Pillager's Vest +1",
neck="Fotia Gorget"})

sets.precast.WS['Dancing Edge'] = set_combine(sets.precast.WS, {neck="Fotia Gorget"})

sets.precast.WS['Dancing Edge'].Acc = set_combine(sets.precast.WS['Dancing Edge'], {ammo="Yetshila", back="Letalis Mantle"})

sets.precast.WS['Dancing Edge'].Mod = set_combine(sets.precast.WS['Dancing Edge'], {waist="Fotia belt"})

sets.precast.WS['Dancing Edge'].SA = set_combine(sets.precast.WS['Dancing Edge'].Mod, {ammo="Yetshila",body="Pillager's Vest +1",
back="Cavaros mantle",
neck="Moepapa Medal"})

sets.precast.WS['Dancing Edge'].TA = set_combine(sets.precast.WS['Dancing Edge'].Mod, {ammo="Qirmiz Tathlum", back="Cavaros mantle", body="Pillager's Vest +1", neck="Moepapa Medal"})

sets.precast.WS['Dancing Edge'].SATA = set_combine(sets.precast.WS['Dancing Edge'].Mod, {ammo="Qirmiz Tathlum", body="Pillager's Vest +1",
back="Cavaros mantle",
neck="Moepapa Medal"})

sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {ear2="Moonshade Earring"})

sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS['Evisceration'], {ammo="Yetshila", back="Letalis Mantle"})

sets.precast.WS['Evisceration'].Mod = set_combine(sets.precast.WS['Evisceration'], {neck="Fotia gorget", waist="Fotia Belt"})

sets.precast.WS['Evisceration'].SA = set_combine(sets.precast.WS['Evisceration'].Mod, {neck="Moepapa Medal",back="Cavaros mantle", body="Pillager's Vest +1"})

sets.precast.WS['Evisceration'].TA = set_combine(sets.precast.WS['Evisceration'].Mod, {neck="Moepapa Medal", back="Cavaros mantle", body="Pillager's Vest +1"})

sets.precast.WS['Evisceration'].SATA = set_combine(sets.precast.WS['Evisceration'].Mod, {neck="Moepapa Medal",back="Cavaros mantle", body="Pillager's Vest +1"})

sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {
head="Malignance Chapeau",
neck="Fotia gorget",
ear1="Mache Earring",
ear2="Moonshade Earring",
body="Adhemar jacket +1",
hands="Meg. gloves +2",
ring1="Apate ring",
ring2="Rajas ring",
back=gear.ThfSTPCape,
waist="Fotia belt",
legs="Lustr. Subligar +1",
feet=gear.THHerculeanBoots})

sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS["Rudra's Storm"], {
head="Whirlpool Mask",
feet="Qaaxo leggings",
ammo="Yetshila",
back="Letalis Mantle",
waist="Fotia belt"})

sets.precast.WS["Rudra's Storm"].Mod = set_combine(sets.precast.WS["Rudra's Storm"], {
head="Adhemar bonnet",
neck="Fotia gorget",
ear1="Mache Earring",
ear2="Moonshade Earring",
hands="Meghanada gloves +2",
lring="Ramuh ring",
rring="Rajas ring",
back="Kayapa cape",
waist="Fotia belt",
legs="Samnuha tights",
feet="Plunderer's poulaines +1"})

sets.precast.WS["Rudra's Storm"].SA = set_combine(sets.precast.WS["Rudra's Storm"].Mod, {
ammo="Yetshila",
head="Adhemar bonnet",
body="Pillager's Vest +1",
hands="Skulker's Armlets",
legs="Pillager's culottes +1"})

sets.precast.WS["Rudra's Storm"].TA = set_combine(sets.precast.WS["Rudra's Storm"].Mod, {
ammo="Yetshila",
neck="Fotia Gorget",
head="Pillager's bonnet +1",
body="Pillager's Vest +1",
hands="Pillager's Armlets +1",
legs="Pillager's culottes +1",
waist="Fotia belt",
back="Cavaros mantle"})

sets.precast.WS["Rudra's Storm"].SATA = set_combine(sets.precast.WS["Rudra's Storm"].Mod, {
ammo="Yetshila",
head="Pillager's bonnet +1",
neck="Fotia Gorget",
body="Pillager's Vest +1",
hands=gear.TPTaeonGLoves,
legs="Pillager's culottes +1",
back="Cavaros mantle",
waist="Fotia belt"})

sets.precast.WS["Shark Bite"] = set_combine(sets.precast.WS, {
head="Pillager's Bonnet +1",
neck="Fotia gorget",
ear1="Brutal Earring",
ear2="Moonshade Earring",
waist="Fotia belt"})

sets.precast.WS['Shark Bite'].Acc = set_combine(sets.precast.WS['Shark Bite'], {
ammo="Yetshila",
back="Letalis Mantle"})

sets.precast.WS['Shark Bite'].Mod = set_combine(sets.precast.WS['Shark Bite'], {
neck="Fotia gorget",
waist="Fotia Belt"})

sets.precast.WS['Shark Bite'].SA = set_combine(sets.precast.WS['Shark Bite'].Mod, {
ammo="Yetshila",
neck="Fotia gorget",
back="Cavaros mantle",
body="Pillager's Vest +1",
waist="Fotia belt"})

sets.precast.WS['Shark Bite'].TA = set_combine(sets.precast.WS['Shark Bite'].Mod, {
ammo="Yetshila",
neck="Fotia gorget",
back="Cavaros mantle",
body="Pillager's Vest +1",
waist="Fotia belt"})

sets.precast.WS['Shark Bite'].SATA = set_combine(sets.precast.WS['Shark Bite'].Mod, {
ammo="Yetshila",
neck="Fotia gorget",
back="Cavaros mantle",
body="Pillager's Vest +1",
waist="Fotia belt"})

sets.precast.WS['Mandalic Stab'] = set_combine(sets.precast.WS, 
{head="Uk'uxkaj cap",
neck="Fotia gorget",
ear1="Brutal Earring",
ear2="Moonshade Earring",
body="Khepri jacket",
hands="Buremte gloves",
ring1="Epona's ring",
ring2="Rajas ring",
back="Kayapa cape",
waist="Fotia belt",
legs="Manibozho brais",
feet="Iuitl gaiters +1"})

sets.precast.WS['Mandalic Stab'].Acc = set_combine(sets.precast.WS['Mandalic Stab'], 
{ammo="Yetshila",
back="Kayapa cape"})

sets.precast.WS['Mandalic Stab'].Mod = set_combine(sets.precast.WS['Mandalic Stab'], 
{waist="Fotia belt"})

sets.precast.WS['Mandalic Stab'].SA = set_combine(sets.precast.WS['Mandalic Stab'].Mod, 
{ammo="Yetshila",
head="Pillager's bonnet +1",
body="Pillager's Vest +1",
legs="Pillager's culottes +1",
back="Cavaros mantle",
neck="Fotia gorget",
waist="Fotia belt"})

sets.precast.WS['Mandalic Stab'].TA = set_combine(sets.precast.WS['Mandalic Stab'].Mod, 
{ammo="Yetshila",
neck="Fotia gorget",
head="Pillager's bonnet +1",
body="Pillager's Vest +1",
back="Cavaros mantle",
waist="Fotia belt",
legs="Pillager's culottes +1",})

sets.precast.WS['Mandalic Stab'].SATA = set_combine(sets.precast.WS['Mandalic Stab'].Mod, 
{ammo="Yetshila",
neck="Fotia gorget",
back="Cavaros mantle",
body="Pillager's Vest +1",
waist="Fotia belt"})

sets.precast.WS['Aeolian Edge'] = {
ammo="Jukukik Feather",
head=gear.MDTaeonChapeau,
neck="Sanctity necklace",
ear1="Friomisi Earring",
ear2="Hecate's Earring",
body="Taeon Tabard",
hands=gear.FCTaeonGloves,
ring1="Acumen Ring",
ring2="Arvina Ringlet +1",
back="Toro Cape",
waist="Fotia Belt",
legs=gear.MABHerculeanTights,
feet=gear.FCTaeonBoots,}


-- Midcast Sets

sets.midcast.FastRecast = {
head="Haruspex hat +1",
neck="Orunmila's torque",
ear1="Enchanter earring +1",
ear2="Loquacious Earring",
body={ name="Taeon Tabard", augments={'"Mag.Atk.Bns."+19','"Fast Cast"+5',}},
hands=gear.FCTaeonGloves,
ring1="Weatherspoon ring",
ring2="Prolix ring",
back="Ik Cape",
waist="Pya'ekue Belt",
legs="Enif cosciales",
feet=gear.FCTaeonBoots,}


-- Specific spells
sets.midcast.Utsusemi = sets.midcast.FastRecast

-- Ranged gear -- acc + TH
sets.midcast.RangedAttack = {
head="Umbani cap",
neck="Iqabi necklace",
ear1="Clearview Earring",
ear2="Volley Earring",
body="Skadi's cuirie +1",
hands="Buremte Gloves",
ring1="Paqichikaji Ring",
ring2="Hajduk Ring",
back="Libeccio Mantle",
waist="Elanid Belt",
legs="Thurandaut Tights +1",
feet="Pillager's poulaines +1"}

sets.midcast.RangedAttack.TH = {
head="Umbani cap",
neck="Iqabi necklace",
ear1="Clearview Earring",
ear2="Volley Earring",
body="Skadi's Cuirie +1",
hands="Buremte Gloves",
ring1="Paqichikajo Ring",
ring2="Hajduk Ring",
back="Libeccio Mantle",
waist="Elanid Belt",
legs="Thurandaut Tights +1",
feet="Pillager's poulaines +1"}

sets.midcast.RangedAttack.Acc = {
head="Umbani cap",
neck="Iqabi necklace",
ear1="Clearview Earring",
ear2="Volley Earring",
body="Iuitl Vest",
hands="Buremte Gloves",
ring1="Paqichikajo Ring",
ring2="Hajduk Ring",
back="Libeccio Mantle",
waist="Elanid Belt",
legs="Thurandaut Tights +1",
feet="Pillager's poulaines +1"}

-- Sets to return to when not performing an action.

-- Resting sets
sets.resting = {head="Ocelomeh Headpiece +1",neck="Wiglen Gorget",hands="Garden bangles",
ring1="Sheltered Ring",ring2="Paguroidea Ring"}


-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

sets.idle =  {
head="Meghanada visor +2",
neck="Wiglen Gorget",
ear1="Infused earring",
ear2="Etiolation earring",
body="Meghanada cuirie +2",
hands="Meghanada gloves +2",
ring1="Defending ring",
ring2="Meghanada Ring",
back="Moonbeam Cape",
waist="Flume Belt +1",
legs="Meghanada chausses +2",
feet="Jute boots +1"}

sets.idle.DT = {
head="Malignance Chapeau",
neck="Wiglen Gorget",
ear1="Infused earring",
ear2="Etiolation earring",
body="Malignance Tabard",
hands="Meghanada gloves +2",
ring1="Defending ring",
ring2="Meghanada Ring",
back="Moonbeam Cape",
waist="Flume Belt +1",
legs="Meghanada chausses +2",
feet="Jute boots +1"}


sets.idle.Weak = sets.idle.DT

sets.ExtraRegen = {feet="Jute boots +1"}


-- Defense sets

sets.defense.Evasion = {
head="Pillager's bonnet +1",
body="Emet harness +1",
hands="Pillager's Armlets +1",
ring1="Beeline Ring",
ring2="Dark Ring",
back="Ik Cape",
waist="Flume Belt +1",
legs="Kaabnax Trousers",
feet="Iuitl Gaiters +1"}

sets.defense.PDT = {
ammo="Staunch tathlum",
head="Malignance Chapeau",
ear1="Cessance earring",
ear2="Telos earring",
neck="Loricate Torque +1",
body="Malignance Tabard",
hands="Meg. Gloves +2",
ring1="Defending Ring",
ring2="Moonbeam Ring",
back="Moonbeam cape",
waist="Flume Belt +1",
legs="Meg. Chausses +2",
feet="Meg. Jam. +2"}

sets.defense.MDT = {
head="Malignance Chapeau",
neck="Loricate Torque +1",
body="Malignance Tabard",
hands="Meghanada gloves +2",
ring1="Defending Ring",
ring2="Meghanada ring",
back="Mubvum. Mantle",
waist="Flume belt +1",
legs="Samnuha tights",
feet="Jute boots +1"}

sets.MoveSpeed = {feet="Jute boots +1"}

-- Engaged sets

-- Variations for TP weapon and (optional) offense/defense modes. Code will fall back on previous
-- sets if more refined versions aren't defined.
-- If you create a set with both offense and defense modes, the offense mode should be first.
-- EG: sets.engaged.Dagger.Accuracy.Evasion

-- Normal melee group
sets.engaged = {
ammo="Ginsen",
head="Nyame Helm",
neck="Anu Torque",
ear1="Suppanomimi",
ear2="Sherida Earring",
body="Nyame Mail",
hands=gear.AdhemarWristbandsMelee,
ring1="Oneiros Ring",
ring2="Epona's Ring",
back=gear.ThfSTPCape,
waist="Windbuffet belt +1",
legs="Nyame Flanchard",
feet="Nyame Sollerets"}



sets.engaged.FullAcc = {
ammo="Raider's boomerang",
head="Skulker's bonnet +1",
neck="Iqabi Necklace",
ear1="Dudgeon earring",
ear2="Heartseeker Earring",
body="Samnuha Coat",
hands="Herculean gloves",
ring1="Patricius Ring",
ring2="Enlivened Ring",
back="Letalis mantle",
waist="Anguinus belt",
legs="Taeon tights",
feet=gear.THHerculeanBoots,}

sets.engaged.FullBuff = {
ammo="Ginsen",
head="Dampening Tam",
neck="Asperity Necklace",
ear1="Cessance earring",
ear2="Telos Earring",
body="Adhemar jacket +1",
hands=gear.AdhemarWristbandsMelee,
ring1="Oneiros Ring",
ring2="Epona's Ring",
back=gear.ThfSTPCape,
waist="Windbuffet belt +1",
legs="Samnuha tights",
feet=gear.TAHerculeanBoots,}


sets.engaged.FullBuffAcc = {
ammo="Jukukik feather",
head="Dampening Tam",
neck="Erudition necklace",
ear1="Cessance earring",
ear2="Telos Earring",
body="Adhemar jacket +1",
hands=gear.AdhemarWristbandsMelee,
ring1="Enlivened Ring",
ring2="Patricius Ring",
back="Letalis mantle",
waist="Windbuffet belt +1",
legs="Adhemar Kecks",
feet=gear.TAHerculeanBoots}

sets.engaged.STP = {
ammo="Yetshila",
head="Malignance Chapeau",
neck="Erudition necklace",
ear1="Cessance earring",
ear2="Telos Earring",
body="Malignance Tabard",
hands=gear.AdhemarWristbandsMelee,
ring1="Rajas Ring",
ring2="Epona's Ring",
back=gear.ThfSTPCape,
waist="Windbuffet belt +1",
legs="Samnuha Tights",
feet=gear.TAHerculeanBoots}


sets.engaged.Acc = {
ammo="Honed Tathlum",
head=gear.TPTaeonChapeau,
neck="Iqabi necklace",
ear1="Dudgeon Earring",
ear2="Heartseeker Earring",
body="Pillager's Vest +1",
hands=gear.TPTaeonGloves,
ring1="Mars's Ring",
ring2="Enlivened Ring",
back="Canny cape",
waist="Anguinus belt",
legs="Taeon Tights",
feet=gear.TPTaeonBoots}

sets.engaged.Crit = {
head="Mummu bonnet +2",
neck="Erudition necklace",
ear1="Cessance Earring",
ear2="Telos Earring",
body="Mummu jacket +2",
hands="Mummu Wrists +2",
ring1="Mummu ring",
ring2="Epona's Ring",
back=gear.ThfSTPCape,
waist="Chaac Belt",
legs="Mummu kecks +2",
feet=gear.THHerculeanBoots}


sets.engaged.Evasion = {
ammo="Thew Bomblet",
head="Felistris Mask",
neck="Torero Torque",
ear1="Dudgeon Earring",
ear2="Heartseeker Earring",
body="Emet harness +1",
hands="Pillager's Armlets +1",
ring1="Beeline Ring",
ring2="Epona's Ring",
back="Canny Cape",
waist="Patentia Sash",
legs="Kaabnax Trousers",
feet="Iuitl Gaiters +1"}

sets.engaged.Acc.Evasion = {
ammo="Yetshila",
head="Whirlpool Mask",
neck="Torero Torque",
ear1="Dudgeon Earring",
ear2="Heartseeker Earring",
body="Emet harness +1",
hands="Pillager's Armlets +1",
ring1="Beeline Ring",
ring2="Epona's Ring",
back="Letalis Mantle",
waist="Hurch'lan Sash",
legs="Kaabnax Trousers",
feet="Iuitl Gaiters +1"}

sets.engaged.PDT = {
ammo="Staunch tathlum",
head="Meghanada visor +2",
ear1="Cessance earring",
ear2="Telos earring",
neck="Liricate Torque +1",
body="Meghanada cuirie +2",
hands="Meg. Gloves +12",
ring1="Defending Ring",
ring2="Moonbeam Ring",
back="Moonbeam cape",
waist="Flume Belt +1",
legs="Meg. Chausses +12",
feet="Meg. Jam. +12"}

sets.engaged.Acc.PDT = {
ammo="Staunch tathlum",
head="Meghanada visor +2",
ear1="Cessance earring",
ear2="Telos earring",
neck="Liricate Torque +1",
body="Malignance tabard",
hands="Meg. Gloves +2",
ring1="Defending Ring",
ring2="Moonbeam Ring",
back="Moonbeam cape",
waist="Flume Belt +1",
legs="Meg. Chausses +2",
feet="Meg. Jam. +2"}

end
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
-- Run after the general precast() is done.
function job_post_precast(spell, action, spellMap, eventArgs)
if spell.english == 'Aeolian Edge' and state.TreasureMode.value ~= 'None' then
equip(sets.TreasureHunter)
elseif spell.english=='Sneak Attack' or spell.english=='Trick Attack' or spell.type == 'WeaponSkill' then
if state.TreasureMode.value == 'SATA' or state.TreasureMode.value == 'Fulltime' then
equip(sets.TreasureHunter)
end
end
end
-- Run after the general midcast() set is constructed.
function job_post_midcast(spell, action, spellMap, eventArgs)
if state.TreasureMode.value ~= 'None' and spell.action_type == 'Ranged Attack' then
equip(sets.TreasureHunter)
end
end
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
-- Weaponskills wipe SATA/Feint. Turn those state vars off before default gearing is attempted.
if spell.type == 'WeaponSkill' and not spell.interrupted then
state.Buff['Sneak Attack'] = false
state.Buff['Trick Attack'] = false
state.Buff['Feint'] = false
end
end
-- Called after the default aftercast handling is complete.
function job_post_aftercast(spell, action, spellMap, eventArgs)
-- If Feint is active, put that gear set on on top of regular gear.
-- This includes overlaying SATA gear.
check_buff('Feint', eventArgs)
end
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------
-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
if state.Buff[buff] ~= nil then
if not midaction() then
handle_equipping_gear(player.status)
end
end
end
-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------
function get_custom_wsmode(spell, spellMap, defaut_wsmode)
local wsmode
if state.Buff['Sneak Attack'] then
wsmode = 'SA'
end
if state.Buff['Trick Attack'] then
wsmode = (wsmode or '') .. 'TA'
end
return wsmode
end
-- Called any time we attempt to handle automatic gear equips (ie: engaged or idle gear).
function job_handle_equipping_gear(playerStatus, eventArgs)
-- Check that ranged slot is locked, if necessary
check_range_lock()
-- Check for SATA when equipping gear. If either is active, equip
-- that gear specifically, and block equipping default gear.
check_buff('Sneak Attack', eventArgs)
check_buff('Trick Attack', eventArgs)
end
function customize_idle_set(idleSet)
if player.hpp < 80 then
idleSet = set_combine(idleSet, sets.ExtraRegen)
end
return idleSet
end
function customize_melee_set(meleeSet)
if state.TreasureMode.value == 'Fulltime' then
meleeSet = set_combine(meleeSet, sets.TreasureHunter)
end
return meleeSet
end
-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
th_update(cmdParams, eventArgs)
end
-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
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
msg = msg .. ', ' .. 'Defense: ' .. state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')'
end
if state.Kiting.value == true then
msg = msg .. ', Kiting'
end
if state.PCTargetMode.value ~= 'default' then
msg = msg .. ', Target PC: '..state.PCTargetMode.value
end
if state.SelectNPCTargets.value == true then
msg = msg .. ', Target NPCs'
end
msg = msg .. ', TH: ' .. state.TreasureMode.value
add_to_chat(122, msg)
eventArgs.handled = true
end
-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
-- State buff checks that will equip buff gear and mark the event as handled.
function check_buff(buff_name, eventArgs)
if state.Buff[buff_name] then
equip(sets.buff[buff_name] or {})
if state.TreasureMode.value == 'SATA' or state.TreasureMode.value == 'Fulltime' then
equip(sets.TreasureHunter)
end
eventArgs.handled = true
end
end
-- Check for various actions that we've specified in user code as being used with TH gear.
-- This will only ever be called if TreasureMode is not 'None'.
-- Category and Param are as specified in the action event packet.
function th_action_check(category, param)
if category == 2 or -- any ranged attack
--category == 4 or -- any magic action
(category == 3 and param == 30) or -- Aeolian Edge
(category == 6 and info.default_ja_ids:contains(param)) or -- Provoke, Animated Flourish
(category == 14 and info.default_u_ja_ids:contains(param)) -- Quick/Box/Stutter Step, Desperate/Violent Flourish
then return true
end
end
-- Function to lock the ranged slot if we have a ranged weapon equipped.
function check_range_lock()
if player.equipment.range ~= 'empty' then
disable('range', 'ammo')
else
enable('range', 'ammo')
end
end
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
-- Default macro set/book
if player.sub_job == 'DNC' then
set_macro_page(1, 6)
elseif player.sub_job == 'WAR' then
set_macro_page(2, 6)
elseif player.sub_job == 'NIN' then
set_macro_page(3, 6)
else
set_macro_page(2, 6)
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
