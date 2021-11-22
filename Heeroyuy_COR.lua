-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job. Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
require 'organizer-lib'
--[[
gs c toggle LuzafRing -- Toggles use of Luzaf Ring on and off
Offense mode is melee or ranged. Used ranged offense mode if you are engaged
for ranged weaponskills, but not actually meleeing.
Weaponskill mode, if set to 'Normal', is handled separately for melee and ranged weaponskills.
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
-- Whether to use Luzaf's Ring
state.LuzafRing = M(false, "Luzaf's Ring")
-- Whether a warning has been given for low ammo
state.warned = M(false)
define_roll_values()
end
-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job. Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------
-- Setup vars that are user-dependent. Can override this function in a sidecar file.
function user_setup()
state.OffenseMode:options('Ranged', 'Normal', 'Acc', 'DW', 'STP')
state.RangedMode:options('Normal', 'Acc')
state.WeaponskillMode:options('Normal', 'Acc')
state.CastingMode:options('Normal', 'Resistant', 'Empy')
state.IdleMode:options('Normal', 'PDT', 'Refresh', 'RefreshPDT', 'MDT')
gear.RAbullet = "Chrono Bullet"
gear.WSbullet = "Chrono bullet"
gear.MAbullet = "Devastating Bullet"
gear.QDbullet = "Animikii Bullet"
gear.defaultobi = "Fotia belt"

options.ammo_warning_limit = 15
-- Additional local binds
send_command('bind ^` input /ja "Double-up" <me>')
send_command('bind !` input /ja "Bolter\'s Roll" <me>')
send_command('bind !q input /ra <t>')
send_command('bind ^q input /ra <t>')
send_command('bind ^= input //gs c toggle LuzafRing')
select_default_macro_book()
end
-- Called when this job file is unloaded (eg: job change)
function user_unload()
send_command('unbind ^`')
send_command('unbind !`')
end
-- Define sets and vars used by this job file.
function init_gear_sets()

include('Augments.lua')
--------------------------------------
-- Start defining the sets
--------------------------------------
sets.Obi = {waist="Hachirin-no-Obi"}
sets.goldsmithing = {
	head="Shaded spectacles",
	neck="Goldsmith's torque",
	body="Goldsmith's smock",
	ring1="Craftkeeper's ring",
	ring2="Craftmaster's ring"}


sets.precast.JA['Triple Shot'] = {body="Chasseur's Frac +1"}
sets.precast.JA['Snake Eye'] = {legs="Lanun trews"}
sets.precast.JA['Wild Card'] = {feet="Lanun Bottes +2"}
sets.precast.JA['Random Deal'] = {body="Lanun Frac"}



sets.precast.CorsairRoll = {head="Lanun Tricorne",hands="Chasseur's Gants +1",back="Camulus's mantle", legs="Desultor tassets", ring1="Barataria ring"}
sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Navarch's Culottes +2", ring1="Barataria ring"})
sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chasseur's Bottes +1", legs="Desultor tassets", ring1="Barataria ring"})
sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chasseur's Tricorne +1", legs="Desultor tassets", ring1="Barataria ring"})
sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac +1", legs="Desultor tassets", ring1="Barataria ring"})
sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants +1", legs="Desultor tassets", ring1="Barataria ring"})




sets.precast.LuzafRing = {ring2="Luzaf's Ring", ring1="Barataria ring"}
sets.precast.DoubleUp = {head="Lanun Tricorne",hands="Chasseur's Gants +1",back="Gunslinger's cape", ring1="Barataria ring"}
sets.precast.CorsairShot = {head="Blood mask", body="Mirke wardecors", ammo="Animikii bullet"}


-- Waltz set (chr and vit)
sets.precast.Waltz = {}

-- Don't need any special gear for Healing Waltz.
sets.precast.Waltz['Healing Waltz'] = {}

-- Fast cast sets for spells

sets.precast.FC = {
head="Carmine mask +1",
neck="Orunmila's torque",
ear1="Enchanter earring +1",
ear2="Loquacious Earring",
body=gear.FCTaeonTabard,
hands="Leyline gloves",
ring1="Prolix Ring",
legs="Rawhide trousers",
feet=gear.FCTaeonBoots}

sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Orunmila's torque"})


sets.precast.RA = {
ammo=gear.RAbullet,
head="Chasseur's Tricorne +1", 
body=gear.SnapTaeonTabard,
hands="Carmine Fin. Ga. +1",
back="Navarch's Mantle",
waist="Impulse Belt",
legs="Adhemar kecks +1",
feet="Meg. Jam. +2"}

       
-- Weaponskill sets
-- Default set for any weaponskill that isn't any more specifically defined
sets.precast.WS = {
head="Dampening Tam",
neck="Fotia gorget",
ear1="Bladeborn Earring",
ear2="Steelflash Earring",
body="Adhemar jacket +1",
hands="Meg. gloves +2",
ring1="Rajas Ring",
ring2="Epona's Ring",
back=gear.CorTPBack,
waist="Fotia Belt",
legs=gear.AdhemarKecksMelee,
feet="Meghanada jambeaux +2"}

 
-- Specific weaponskill sets. Uses the base set if an appropriate WSMod version isn't found.

sets.precast.WS['Savage Blade'] = {
head="Meghanada Visor +2",
neck="Fotia Gorget",
left_ear="Ishvara Earring",
right_ear= "Moonshade Earring", 
body="Laksa. Frac +2",
hands="Meg. Gloves +2",
left_ring="Apate ring",
right_ring="Rufescent Ring",
back=gear.CorMeleeWSBack,
waist="Fotia Belt",
legs="Meg. Chausses +2",
feet="Lanun Bottes +2"

}

sets.precast.WS['Evisceration'] = sets.precast.WS

sets.precast.WS['Exenterator'] = sets.precast.WS

sets.precast.WS['Requiescat'] = sets.precast.WS

sets.precast.WS['Last Stand'] = {
ammo="Chrono Bullet",
head="Meghanada Visor +2",
body="Laksamana's frac +2",
hands="Meg. Gloves +2",
legs="Meg. Chausses +2",
feet="Lanun Bottes +2",
neck="Fotia Gorget",
waist="Fotia Belt",
left_ear="Ishvara Earring",
right_ear="Moonshade Earring",
left_ring="Apate Ring",
right_ring="Hajduk Ring +1",
back=gear.CorRangedWSBack}

sets.precast.WS['Last Stand'].Acc = sets.precast.WS['Last Stand']


sets.precast.WS['Leaden Salute'] = {
ammo="Devastating bullet",
head="Pixie hairpin +1",
neck="Sanctity Necklace",
ear1="Friomisi Earring",
ear2="Moonshade Earring",
body="Samnuha coat",
hands="Carmine Fin. Ga. +1",
ring1="Archon Ring",
ring2="Arvina Ringlet +1",
back=gear.CorMagicalWSBack,
waist="Fotia belt",
legs=gear.MABHerculeanTrousers,
feet="Lanun Bottes +2"}



sets.precast.WS['Wildfire']= {
ammo=gear.MAbullet,
head="Nyame helm",
neck="Sanctity Necklace",
ear1="Friomisi Earring",
ear2="Hecate's Earring",
body="Samnuha coat",
hands="Carmine Fin. Ga. +1",
ring1="Arvina Ringlet +1",
ring2="Acumen ring",
back=gear.CorMagicalWSBack,
waist="Fotia belt",
legs=gear.MABWSDHerculeanTrousers,
feet="Lanun Bottes +2"}



-- Midcast Sets
sets.midcast.FastRecast = {
head="Carmine mask +1",
ear1="Loquacious earring",
ear2="Enchanter earring +1",
neck="Orunmila's torque",
body=gear.FCTaeonTabard,
hands="Leyline gloves",
ring1="Prolix ring",
ring2="Weatherspoon ring",
waist="Pya'ekue belt",
legs="Rawhide trousers",
feet=gear.FCTaeonBoots}

-- Specific spells
sets.midcast.Utsusemi = sets.midcast.FastRecast
sets.midcast.Cure = {
neck="Phalaina locket",
legs="Desultor tassets"
}
sets.precast.CorsairShot = {
ammo="Animikii bullet",
head="Nyame Helm",
neck="Sanctity Necklace",
ear1="Friomisi Earring",
ear2="Hecate's Earring",
body="Samnuha coat",
hands="Carmine Fin. Ga. +1",
ring1="Acumen Ring",
ring2="Arvina Ringlet +1",
back=gear.CorMagicalWSBack,
waist="Eschan stone",
legs=gear.MABHerculeanTrousers,
feet="Lanun Bottes +2"}

sets.precast.CorsairShot.Acc = {
ammo="Animikii bullet",
head="Malignance Chapeau",
neck="Sanctity Necklace",
ear1="Digni. Earring",
ear2="Gwati Earring",
body="Malignance Tabard",
hands="Nyame Gauntlets",
ring1="Stikini Ring",
ring2="Sangoma Ring",
back=gear.CorMagicalWSBack,
waist="Eschan stone",
legs="Nyame Flanchard",
feet="Nyame sollerets"}

sets.precast.CorsairShot.Empy = {
ammo="Animikii bullet",
head=gear.MABHerculeanHelm,
neck="Sanctity Necklace",
ear1="Friomisi earring",
ear2="Hecate's Earring",
body="Samnuha coat",
hands="Leyline gloves",
ring1="Acumen Ring",
ring2="Arvina ringlet +1",
back="Gunslinger's cape",
waist="Eschan stone",
legs=gear.MABHerculeanTrousers,
feet="Chasseur's bottes +1"}


sets.precast.CorsairShot['Light Shot'] = {
ammo="Animikii bullet",
head="Dampening tam",
neck="Sanctity necklace",
ear1="Enchanter Earring +1",
ear2="Gwati Earring",
body="Samnuha coat",
hands="Leyline gloves",
ring1="Weatherspoon Ring",
ring2="Sangoma Ring",
back=gear.CorMagicalWSBack,
waist="Eschan stone",
legs="Rawhide trousers",
feet="Chasseur's bottes +1"}

sets.precast.CorsairShot['Dark Shot'] = {
ammo="Animikii bullet",
head="Dampening tam",
neck="Sanctity necklace",
ear1="Enchanter Earring +1",
ear2="Gwati Earring",
body="Samnuha coat",
hands="Leyline gloves",
ring1="Weatherspoon Ring",
ring2="Sangoma Ring",
back=gear.CorMagicalWSBack,
waist="Eschan stone",
legs="Rawhide trousers",
feet="Chasseur's bottes +1"}


-- Ranged gear
sets.midcast.RA = {
ammo=gear.RAbullet,
head="Chasseur's Tricorne +1",
neck="Ocachi Gorget",
ear1="Enervating Earring",
ear2="Telos Earring",
body="Nisroch jerkin",
hands="Adhemar wristbands +1",
ring1="Rajas Ring",
ring2="Hajduk Ring +1",
back=gear.CorRangedTPBack,
waist="Yemaya belt",
legs="Adhemar kecks +1",
feet="Meg. Jam. +2"}

sets.midcast.RA.Acc = {
ammo=gear.RAbullet,
head="Malignance Chapeau",
neck="Marked gorget",
ear1="Enervating Earring",
ear2="Telos Earring",
body="Nisroch Jerkin",
hands="Adhemar wristbands +1",
ring1="Hajduk Ring +1",
ring2="Hajduk Ring +1",
back=gear.CorRangedTPBack,
waist="Kwahu kachina belt +1",
legs="Adhemar kecks +1",
feet="Meg. Jam. +2"}


-- Sets to return to when not performing an action.

-- Resting sets
sets.resting = {neck="Wiglen Gorget",ring1="Sheltered Ring",ring2="Paguroidea Ring"}


-- Idle sets
sets.idle = {ammo=empty,
head="Meghanada Visor +2",
neck="Wiglen Gorget",
ear1="Infused Earring",
ear2="Telos Earring",
body="Meg. Cuirie +2",
hands="Meg. Gloves +2",
ring1="Sheltered Ring",
ring2="Meghanada Ring",
back="Moonbeam Cape",
waist="Flume Belt +1",
legs="Carmine Cuisses +1",
feet="Meg. Jam. +2"}

sets.idle.Refresh = {ammo=empty,
head=gear.RefreshHerculeanHelm,
neck="Wiglen Gorget",
ear1="Infused Earring",
ear2="Telos Earring",
body="Mekosu. Harness",
hands="Garden bangles",
ring1="Sheltered Ring",
ring2="Paguroidea Ring",
back="Repulse mantle",
waist="Flume Belt +1",
legs="Rawhide Trousers",
feet="Skadi's Jambeaux +1"}

sets.idle.RefreshPDT = {ammo=empty,
head="Rawhide mask",
neck="Loricate Torque +1",
ear1="Infused Earring",
ear2="Telos Earring",
body="Mekosu. harness",
hands="Umuthi gloves",
ring1="Defending Ring",
ring2="Dark ring",
back="Repulse Mantle",
waist="Flume Belt +1",
legs="Rawhide trousers",
feet="Skadi's jambeaux +1"}

sets.idle.PDT = {
head="Nyame Helm",
neck="Loricate Torque +1",
ear1="Infused Earring",
ear2="Telos Earring",
body="Nyame Mail",
hands="Nyame Gauntlets",
ring1="Defending Ring",
ring2="Vocane ring",
back="Moonbeam cape",
waist="Flume Belt +1",
legs="Carmine cuisses +1",
feet="Nyame Sollerets"}

sets.idle.MDT = {
head="Dampening Tam",
neck="Loricate Torque +1",
ear1="Clearview Earring",
ear2="Etiolation Earring",
body="Samnuha coat",
hands="Floral gauntlets",
ring1="Defending Ring",
ring2="Vocane ring",
back="Mubvum. Mantle",
waist="Flume Belt +1",
legs="Samnuha tights",
feet="Herculean boots"}

-- Defense sets
sets.defense.PDT = {
head="Nyame Helm",
neck="Loricate torque +1",
ear1="Cessance Earring",
ear2="Telos Earring",
body="Nyame Mail",
hands="Nyame Gauntlets",
ring1="Defending Ring",
ring2="Vocane ring",
back="Repulse Mantle",
waist="Flume Belt +1",
legs="Nyame Flanchard",
feet="Nyame Sollerets"}

sets.defense.MDT = {
head="Nyame Helm",
neck="Loricate torque +1",
ear1="Cessance Earring",
ear2="Telos Earring",
body="Nyame Mail",
hands="Nyame Gauntlets",
ring1="Defending Ring",
ring2="Vocane ring",
back="Repulse Mantle",
waist="Flume Belt +1",
legs="Nyame Flanchard",
feet="Nyame Sollerets"}


sets.Kiting = {feet="Carmine cuisses +1"}

-- Engaged sets

-- Variations for TP weapon and (optional) offense/defense modes. Code will fall back on previous
-- sets if more refined versions aren't defined.
-- If you create a set with both offense and defense modes, the offense mode should be first.
-- EG: sets.engaged.Dagger.Accuracy.Evasion

-- Normal  group
sets.engaged = {ammo=empty,
head="Nyame Helm",
neck="Lissome necklace",
ear1="Suppanomimi",
ear2="Eabani earring",
body="Nyame Mail",
hands="Nyame Gauntlets",
ring1="Chirich Ring +1",
ring2="Chirich Ring",
back=gear.CorTPBack,
waist="Windbuffet Belt +1",
legs="Nyame Flanchard",
feet="Nyame Sollerets"}

sets.engaged.Acc = {ammo=empty,
head=gear.DWTaeonChapeau,
neck="Ej Necklace",
ear1="Cessance Earring",
ear2="Telos Earring",
body="Mekosu. harness",
hands=gear.TAHerculeanGloves,
ring1="Enlivened Ring",
ring2="Oneiros Ring",
back="Letalis mantle",
waist="Anguinus belt",
legs="Taeon tights",
feet="Meghanada jambeaux +2"}

sets.engaged.DW = {ammo=empty,
main="Naegling",
sub="Blurred knife +1",
head="Malignance Chapeau",
neck="Lissome necklace",
ear1="Suppanomimi",--5
ear2="Telos Earring",
body="Malignance Tabard",
hands=gear.AdhemarWristbandsMelee,
ring1="Chirich Ring",
ring2="Chirich Ring +1",
back=gear.CorTPBack,
waist="Kentarch belt +1",
legs="Carmine cuisses +1",--6
feet=gear.TAHerculeanBoots}

sets.engaged.STP = {ammo=empty,
head="Malignance Chapeau",
neck="Lissome Necklace",
ear1="Cessance Earring",
ear2="Telos Earring",
body="Adhemar jacket +1", --6
hands=gear.AdhemarWristbandsMelee,
ring1="Chirich Ring",
ring2="Chirich ring +1",
back=gear.CorTPBack,
waist="Kentarch belt +1",
legs="Carmine Cuisses +1", --6
feet=gear.TAHerculeanBoots}


sets.engaged.Ranged = sets.defense.PDT

sets.buff['Triple Shot'] = {body="Chasseur's frac +1"}

sets.goldsmithing = {
head="Shaded specs.",
neck="Goldsmith's torque",
body="Goldsmith's smock",
ring1="Craftmaster's ring",
ring2="Artificer's ring"}
 

end
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
	
-- Check that proper ammo is available if we're using ranged attacks or similar.
if spell.action_type == 'Ranged Attack' or spell.type == 'WeaponSkill' or spell.type == 'CorsairShot' then
do_bullet_checks(spell, spellMap, eventArgs)
end
-- gear sets
if (spell.type == 'CorsairRoll' or spell.english == "Double-Up") and state.LuzafRing.value then
equip(sets.precast.LuzafRing)
elseif spell.type == 'CorsairShot' and state.CastingMode.value == 'Resistant' then
classes.CustomClass = 'Acc'
elseif spell.type == 'CorsairShot' and state.CastingMode.value == 'Empy' then
classes.CustomClass = 'Empy'

elseif spell.english == 'Fold' and buffactive['Bust'] == 2 then
if sets.precast.FoldDoubleBust then
equip(sets.precast.FoldDoubleBust)
eventArgs.handled = true


end
end


function job_post_midcast (spell, action, spellMap, eventArgs)
    -- Equip obi if weather/day matches for WS/Quick Draw.
    if spell.type == 'WeaponSkill' or spell.type == 'CorsairShot' then
        if spell.english == 'Leaden Salute' then
            if world.weather_element == 'Dark' or world.day_element == 'Dark' then
                equip(sets.Obi)
            end
            
        elseif spell.english == 'Wildfire' and (world.weather_element == 'Fire' or world.day_element == 'Fire') then
            equip(sets.Obi)
		
        elseif spell.type == 'CorsairShot' and (spell.element == world.weather_element or spell.element == world.day_element) then
				equip(sets.Obi)
            if spell.english ~= "Light Shot" and spell.english ~= "Dark Shot" then
                equip(sets.Obi)
            end
        end
    end
end


-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
if spell.type == 'CorsairRoll' and not spell.interrupted then
display_roll_info(spell)
end
end
end
-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------
-- Return a customized weaponskill mode to use for weaponskill sets.
-- Don't return anything if you're not overriding the default value.
function get_custom_wsmode(spell, spellMap, default_wsmode)
if buffactive['Transcendancy'] then
return 'Brew'
end
end
-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
if newStatus == 'Engaged' and player.equipment.main == 'Chatoyant Staff' then
state.OffenseMode:set('Ranged')
end
end
-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
local msg = ''
msg = msg .. 'Off.: '..state.OffenseMode.current
msg = msg .. ', Rng.: '..state.RangedMode.current
msg = msg .. ', WS.: '..state.WeaponskillMode.current
msg = msg .. ', QD.: '..state.CastingMode.current
if state.DefenseMode.value ~= 'None' then
local defMode = state[state.DefenseMode.value ..'DefenseMode'].current
msg = msg .. ', Defense: '..state.DefenseMode.value..' '..defMode
end
if state.Kiting.value then
msg = msg .. ', Kiting'
end
if state.PCTargetMode.value ~= 'default' then
msg = msg .. ', Target PC: '..state.PCTargetMode.value
end
if state.SelectNPCTargets.value then
msg = msg .. ', Target NPCs'
end
msg = msg .. ', Roll Size: ' .. ((state.LuzafRing.value and 'Large') or 'Small')
add_to_chat(122, msg)
eventArgs.handled = true
end
-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
function define_roll_values()
rolls = {
["Corsair's Roll"] = {lucky=5, unlucky=9, bonus="Experience Points"},
["Ninja Roll"] = {lucky=4, unlucky=8, bonus="Evasion"},
["Hunter's Roll"] = {lucky=4, unlucky=8, bonus="Accuracy"},
["Chaos Roll"] = {lucky=4, unlucky=8, bonus="Attack"},
["Magus's Roll"] = {lucky=2, unlucky=6, bonus="Magic Defense"},
["Healer's Roll"] = {lucky=3, unlucky=7, bonus="Cure Potency Received"},
["Puppet Roll"] = {lucky=4, unlucky=8, bonus="Pet Magic Accuracy/Attack"},
["Choral Roll"] = {lucky=2, unlucky=6, bonus="Spell Interruption Rate"},
["Monk's Roll"] = {lucky=3, unlucky=7, bonus="Subtle Blow"},
["Beast Roll"] = {lucky=4, unlucky=8, bonus="Pet Attack"},
["Samurai Roll"] = {lucky=2, unlucky=6, bonus="Store TP"},
["Evoker's Roll"] = {lucky=5, unlucky=9, bonus="Refresh"},
["Rogue's Roll"] = {lucky=5, unlucky=9, bonus="Critical Hit Rate"},
["Warlock's Roll"] = {lucky=4, unlucky=8, bonus="Magic Accuracy"},
["Fighter's Roll"] = {lucky=5, unlucky=9, bonus="Double Attack Rate"},
["Drachen Roll"] = {lucky=3, unlucky=7, bonus="Pet Accuracy"},
["Gallant's Roll"] = {lucky=3, unlucky=7, bonus="Defense"},
["Wizard's Roll"] = {lucky=5, unlucky=9, bonus="Magic Attack"},
["Dancer's Roll"] = {lucky=3, unlucky=7, bonus="Regen"},
["Scholar's Roll"] = {lucky=2, unlucky=6, bonus="Conserve MP"},
["Bolter's Roll"] = {lucky=3, unlucky=9, bonus="Movement Speed"},
["Caster's Roll"] = {lucky=2, unlucky=7, bonus="Fast Cast"},
["Courser's Roll"] = {lucky=3, unlucky=9, bonus="Snapshot"},
["Blitzer's Roll"] = {lucky=4, unlucky=9, bonus="Attack Delay"},
["Tactician's Roll"] = {lucky=5, unlucky=8, bonus="Regain"},
["Allies's Roll"] = {lucky=3, unlucky=10, bonus="Skillchain Damage"},
["Miser's Roll"] = {lucky=5, unlucky=7, bonus="Save TP"},
["Companion's Roll"] = {lucky=2, unlucky=10, bonus="Pet Regain and Regen"},
["Avenger's Roll"] = {lucky=4, unlucky=8, bonus="Counter Rate"},
}
end

function display_roll_info(spell)
rollinfo = rolls[spell.english]
local rollsize = (state.LuzafRing.value and 'Large') or 'Small'
if rollinfo then
add_to_chat(104, spell.english..' provides a bonus to '..rollinfo.bonus..'. Roll size: '..rollsize)
add_to_chat(104, 'Lucky roll is '..tostring(rollinfo.lucky)..', Unlucky roll is '..tostring(rollinfo.unlucky)..'.')
end
end
-- Determine whether we have sufficient ammo for the action being attempted.
function do_bullet_checks(spell, spellMap, eventArgs)
local bullet_name
local bullet_min_count = 1
if spell.type == 'WeaponSkill' then
if spell.skill == "Marksmanship" then
if spell.element == 'None' then
-- physical weaponskills
bullet_name = gear.WSbullet
else
-- magical weaponskills
bullet_name = gear.MAbullet
end
else
-- Ignore non-ranged weaponskills
return
end
elseif spell.type == 'CorsairShot' then
bullet_name = gear.QDbullet
elseif spell.action_type == 'Ranged Attack' then
bullet_name = gear.RAbullet
if buffactive['Triple Shot'] then
bullet_min_count = 3
end
end

local available_bullets = player.inventory[bullet_name] or player.wardrobe[bullet_name]
-- If no ammo is available, give appropriate warning and end.
if not available_bullets then
if spell.type == 'CorsairShot' and player.equipment.ammo ~= 'empty' then
add_to_chat(104, 'No Quick Draw ammo left. Using what\'s currently equipped ('..player.equipment.ammo..').')
return
elseif spell.type == 'WeaponSkill' and player.equipment.ammo == gear.RAbullet then
add_to_chat(104, 'No weaponskill ammo left. Using what\'s currently equipped (standard ranged bullets: '..player.equipment.ammo..').')
return
else
add_to_chat(104, 'No ammo ('..tostring(bullet_name)..') available for that action.')
eventArgs.cancel = true
return
end
end
-- Don't allow shooting or weaponskilling with ammo reserved for quick draw.
if spell.type ~= 'CorsairShot' and bullet_name == gear.QDbullet and available_bullets.count <= bullet_min_count then
add_to_chat(104, 'No ammo will be left for Quick Draw. Cancelling.')
eventArgs.cancel = true
return
end
-- Low ammo warning.
if spell.type ~= 'CorsairShot' and state.warned.value == false
and available_bullets.count > 1 and available_bullets.count <= options.ammo_warning_limit then
local msg = '***** LOW AMMO WARNING: '..bullet_name..' *****'
--local border = string.repeat("*", #msg)
local border = ""
for i = 1, #msg do
border = border .. "*"
end
add_to_chat(104, border)
add_to_chat(104, msg)
add_to_chat(104, border)
state.warned:set()
elseif available_bullets.count > options.ammo_warning_limit and state.warned then
state.warned:reset()
end
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
set_macro_page(1, 17)
end
