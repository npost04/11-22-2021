-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
require 'organizer-lib'

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff['Burst Affinity'] = buffactive['Burst Affinity'] or false
    state.Buff['Chain Affinity'] = buffactive['Chain Affinity'] or false
    state.Buff.Convergence = buffactive.Convergence or false
    state.Buff.Diffusion = buffactive.Diffusion or false
    state.Buff.Efflux = buffactive.Efflux or false
    
    state.Buff['Unbridled Learning'] = buffactive['Unbridled Learning'] or false


    blue_magic_maps = {}
    
    -- Mappings for gear sets to use for various blue magic spells.
    -- While Str isn't listed for each, it's generally assumed as being at least
    -- moderately signficant, even for spells with other mods.
    
    -- Physical Spells --
    
    -- Physical spells with no particular (or known) stat mods
    blue_magic_maps.Physical = S{
        'Bilgestorm'
    }

    -- Spells with heavy accuracy penalties, that need to prioritize accuracy first.
    blue_magic_maps.PhysicalAcc = S{
        'Heavy Strike',
    }

    -- Physical spells with Str stat mod
    blue_magic_maps.PhysicalStr = S{
        'Battle Dance','Bloodrake','Death Scissors','Dimensional Death',
        'Empty Thrash','Quadrastrike','Sinker Drill','Spinal Cleave',
        'Uppercut','Vertical Cleave'
    }
        
    -- Physical spells with Dex stat mod
    blue_magic_maps.PhysicalDex = S{
        'Amorphic Spikes','Asuran Claws','Barbed Crescent','Claw Cyclone','Disseverment',
        'Foot Kick','Frenetic Rip','Goblin Rush','Hysteric Barrage','Paralyzing Triad',
        'Seedspray','Sickle Slash','Smite of Rage','Terror Touch','Thrashing Assault',
        'Vanity Dive'
    }
        
    -- Physical spells with Vit stat mod
    blue_magic_maps.PhysicalVit = S{
        'Body Slam','Cannonball','Delta Thrust','Glutinous Dart','Grand Slam',
        'Power Attack','Quad. Continuum','Sprout Smack','Sub-zero Smash'
    }
        
    -- Physical spells with Agi stat mod
    blue_magic_maps.PhysicalAgi = S{
        'Benthic Typhoon','Feather Storm','Helldive','Hydro Shot','Jet Stream',
        'Pinecone Bomb','Spiral Spin','Wild Oats'
    }

    -- Physical spells with Int stat mod
    blue_magic_maps.PhysicalInt = S{
        'Mandibular Bite','Queasyshroom'
    }

    -- Physical spells with Mnd stat mod
    blue_magic_maps.PhysicalMnd = S{
        'Ram Charge','Screwdriver','Tourbillion'
    }

    -- Physical spells with Chr stat mod
    blue_magic_maps.PhysicalChr = S{
        'Bludgeon'
    }

    -- Physical spells with HP stat mod
    blue_magic_maps.PhysicalHP = S{
        'Final Sting'
    }

    -- Magical Spells --

    -- Magical spells with the typical Int mod
    blue_magic_maps.Magical = S{
        'Blastbomb','Blazing Bound','Bomb Toss','Cursed Sphere','Dark Orb','Death Ray',
        'Diffusion Ray','Droning Whirlwind','Embalming Earth','Firespit','Foul Waters',
        'Ice Break','Leafstorm','Maelstrom','Rail Cannon','Regurgitation','Rending Deluge',
        'Retinal Glare','Subduction','Tem. Upheaval','Water Bomb', 'Spectral Floe', 'Tenebral Crush', 'Blinding Fulgor', 'Entomb', 'Anvil Lightning',
    }

    -- Magical spells with a primary Mnd mod
    blue_magic_maps.MagicalMnd = S{
        'Acrid Stream','Evryone. Grudge','Magic Hammer','Mind Blast'
    }

    -- Magical spells with a primary Chr mod
    blue_magic_maps.MagicalChr = S{
        'Eyes On Me','Mysterious Light'
    }

    -- Magical spells with a Vit stat mod (on top of Int)
    blue_magic_maps.MagicalVit = S{
        'Thermal Pulse'
    }

    -- Magical spells with a Dex stat mod (on top of Int)
    blue_magic_maps.MagicalDex = S{
        'Charged Whisker','Gates of Hades'
    }
            
    -- Magical spells (generally debuffs) that we want to focus on magic accuracy over damage.
    -- Add Int for damage where available, though.
    blue_magic_maps.MagicAccuracy = S{
        '1000 Needles','Absolute Terror','Actinic Burst','Auroral Drape','Awful Eye',
        'Blank Gaze','Blistering Roar','Blood Drain','Blood Saber','Chaotic Eye',
        'Cimicine Discharge','Cold Wave','Corrosive Ooze','Demoralizing Roar','Digest',
        'Dream Flower','Enervation','Feather Tickle','Filamented Hold','Frightful Roar',
        'Geist Wall','Hecatomb Wave','Infrasonics','Jettatura','Light of Penance',
        'Lowing','Mind Blast','Mortal Ray','MP Drainkiss','Osmosis','Reaving Wind',
        'Sandspin','Sandspray','Sheep Song','Soporific','Sound Blast','Stinking Gas',
        'Sub-zero Smash','Venom Shell','Voracious Trunk','Yawn', 'Cesspool'
    }
        
    -- Breath-based spells
    blue_magic_maps.Breath = S{
        'Bad Breath','Flying Hip Press','Frost Breath','Heat Breath',
        'Hecatomb Wave','Magnetite Cloud','Poison Breath','Radiant Breath','Self-Destruct',
        'Thunder Breath','Vapor Spray','Wind Breath'
    }

    -- Stun spells
    blue_magic_maps.Stun = S{
        'Blitzstrahl','Frypan','Head Butt','Sudden Lunge','Tail slap','Temporal Shift',
        'Thunderbolt','Whirl of Rage'
    }
        
    -- Healing spells
    blue_magic_maps.Healing = S{
        'Healing Breeze','Magic Fruit','Plenilune Embrace','Pollen','Restoral','White Wind',
        'Wild Carrot'
    }
    
    -- Buffs that depend on blue magic skill
    blue_magic_maps.SkillBasedBuff = S{
        'Barrier Tusk','Diamondhide','Magic Barrier','Metallic Body','Plasma Charge',
        'Pyric Bulwark','Reactor Cool', 'Occultation', 'Mighty Guard'
    }

    -- Other general buffs
    blue_magic_maps.Buff = S{
        'Amplification','Animating Wail','Battery Charge','Carcharian Verve','Cocoon',
        'Erratic Flutter','Exuviation','Fantod','Feather Barrier','Harden Shell',
        'Memento Mori','Nat. Meditation','Orcish Counterstance','Refueling',
        'Regeneration','Saline Coat','Triumphant Roar','Warm-Up','Winds of Promyvion',
        'Zephyr Mantle'
    }
    
    
    -- Spells that require Unbridled Learning to cast.
    unbridled_spells = S{
        'Absolute Terror','Bilgestorm','Blistering Roar','Bloodrake','Carcharian Verve',
        'Crashing Thunder','Droning Whirlwind','Gates of Hades','Harden Shell','Polar Roar',
        'Pyric Bulwark','Thunderbolt','Tourbillion','Uproot'
    }
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc', 'STP')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Refresh')

    gear.macc_hagondes = {name="Hagondes Cuffs", augments={'Phys. dmg. taken -3%','Mag. Acc.+29'}}

    -- Additional local binds
    send_command('bind ^` input /ja "Chain Affinity" <me>')
    send_command('bind !` input /ja "Efflux" <me>')
    send_command('bind @` input /ja "Burst Affinity" <me>')

    update_combat_form()
    select_default_macro_book()
end


-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^`')
    send_command('unbind !`')
    send_command('unbind @`')
end


-- Set up gear sets.
function init_gear_sets()
include('Augments.lua')
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    sets.buff['Burst Affinity'] = {feet="Mavi Basmak +2"}
    sets.buff['Chain Affinity'] = {head="Mavi Kavuk +2", feet="Assimilator's Charuqs"}
    sets.buff.Convergence = {head="Luhlaza Keffiyeh"}
    sets.buff.Diffusion = {feet="Luhlaza Charuqs"}
    sets.buff.Enchainment = {body="Luhlaza Jubbah"}
    sets.buff.Efflux = {legs="Mavi Tayt +2"}

    
    -- Precast Sets
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Azure Lore'] = {hands="Mirage Bazubands +2"}


    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Sonia's Plectrum",
        head="Uk'uxkaj Cap", neck="Phalaina locket",
        body="Vanir Cotehardie",hands="Buremte Gloves",ring1="Kunaji Ring", ring2="Asklepian ring",
        back="Iximulew Cape",waist="Caudata Belt",legs="Hagondes Pants",feet="Iuitl Gaiters +1"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
    head="Carmine mask +1",
	neck="Orunmila's Torque",
	left_ear="Enchntr. Earring +1",
    right_ear="Loquac. Earring",
    body=gear.FCTaeonTabard,
    hands="Leyline gloves",
	left_ring="Weatherspoon Ring",
    right_ring="Prolix Ring",
    legs="Rawhide trousers",
    feet="Amalric nails",
    waist="Sailfi Belt",
    back="Swith Cape +1",}        

    sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {body="Mavi Mintan +2"})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
    ammo="Ginsen",
    head="Dampening tam",
    body="Adhemar jacket +1",
    hands="Jhakri cuffs +1",
    legs="Samnuha tights",
    feet=gear.THHerculeanBoots,
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    right_ear="Brutal Earring",
    left_ring="Epona's Ring",
    right_ring="Rajas Ring",
    back=gear.BluCrit
	}    

    sets.precast.WS.acc = set_combine(sets.precast.WS, {hands="Buremte Gloves"})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    

    sets.precast.WS['Sanguine Blade'] = {
    ammo="Dosis Tathlum",
    head="Pixie Hairpin +1",
    body="Samnuha coat",
    hands="Jhakri cuffs +1",
    legs=gear.MABWSDHerculeanTrousers, 
    feet=gear.THHerculeanboots, 
    neck="Eddy Necklace",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    right_ear="Friomisi Earring",
    left_ring="Acumen Ring",
    right_ring="Archon Ring",
    back=gear.BluCrit}
    
    sets.precast.WS['Chant du Cygne'] = {
	head="Adhemar Bonnet",
	neck="Fotia gorget",
	ear1="Ishvara earring",
	ear2="Moonshade earring",
	body="Adhemar jacket +1",
	hands="Jhakri cuffs +1",
	ring1="Epona's ring",
	ring2="Rajas ring",
	back=gear.BluCrit,
	waist="Fotia belt",
	legs="Samnuha tights",
	feet=gear.THHerculeanBoots
	}
	
	sets.precast.WS['Savage Blade'] = {
	head="Nyame helm",
	neck="Fotia gorget",
	ear1="Ishvara earring",
	ear2="Moonshade earring",
	body="Adhemar jacket +1",
	hands="Jhakri cuffs +2",
	ring1="Apate ring",
	ring2="Rajas ring",
	back=gear.BluCrit,
	waist="Fotia belt",
	legs="Nyame Flanchard",
	feet=gear.THHerculeanBoots
	}
    -- Midcast Sets
    sets.midcast.FastRecast = sets.precast.FC        
    sets.midcast['Blue Magic'] = {}
    
    -- Physical Spells --
    
    sets.midcast['Blue Magic'].Physical = {
ammo="Mavi Tathlum",
head="Whirlpool Mask",
neck="Iqabi necklace",
ear1="Heartseeker Earring",
ear2="Steelflash Earring",
body="Helios jacket",
hands="Buremte Gloves",
ring1="Rajas Ring",
ring2="Spiral Ring",
back="Cornflower Cape",
waist="Caudata Belt",
legs="Nahtirah Trousers",
feet="Qaaxo Leggings"}

    sets.midcast['Blue Magic'].PhysicalAcc = {
ammo="Jukukik Feather",
head="Whirlpool Mask",
neck="Iqabi Necklace",
ear1="Heartseeker Earring",
ear2="Steelflash Earring",
body="Adhemar jacket +1",
hands="Buremte Gloves",
ring1="Rajas Ring",
ring2="Patricius Ring",
back="Letalis Mantle",
waist="Hurch'lan Sash",
legs="Manibozho Brais",
feet="Qaaxo Leggings"}

    sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical,
{body="Iuitl Vest",
hands="Assimilator's Bazubands +1"})

    sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical,
{ammo="Jukukik Feather",
body="Iuitl Vest",
hands="Assimilator's Bazubands +1",
waist="Chaac Belt",
legs="Manibozho Brais"})

    sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical,
{body="Vanir Cotehardie",
hands="Assimilator's Bazubands +1",
back="Iximulew Cape"})

    sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical,
{body="Vanir Cotehardie",
hands="Iuitl Wristbands",
ring2="Stormsoul Ring",
waist="Chaac Belt",
feet="Iuitl Gaiters +1"})

    sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical,
{ear1="Psystorm Earring",
body="Vanir Cotehardie",
hands="Assimilator's Bazubands +1",
ring2="Icesoul Ring",
back="Toro Cape",
feet="Hagondes Sabots"})

    sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical,
{ear1="Lifestorm Earring",
ear2="Hecate's earring",
body="Helios jacket",
hands="Helios gloves",
ring2="Aquasoul Ring",
legs="Hagondes pants +1",
back="Refraction Cape"})

    sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical,
{body="Vanir Cotehardie",
hands="Assimilator's Bazubands +1",
back="Refraction Cape",
waist="Chaac Belt"})

    sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical)


    -- Magical Spells --
    
    sets.midcast['Blue Magic'].Magical = {
    ammo="Dosis Tathlum",
    head=gear.MABHerculeanHelm,
    body="Shamash Robe",
    hands="Carmine finger gauntlets +1",
    legs=gear.MABHerculeanTrousers,
    feet=gear.THHerculeanBoots,
    neck="Eddy Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring="Acumen Ring",
    right_ring="Strendu Ring",
    back={ name="Cornflower Cape", augments={'MP+29','DEX+3','Accuracy+5','Blue Magic skill +10',}},}

    sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical,
{body="Vanir Cotehardie",
ring1="Weatherspoon ring",
ring2="Sangoma Ring",
legs="Iuitl Tights",
feet="Mavi Basmak +2"})
    
    sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical,
{ring1="Aquasoul Ring"})

    sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical)

    sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical,
{ring1="Spiral Ring"})

    sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical)

    sets.midcast['Blue Magic'].MagicAccuracy = {
ammo="Mavi Tathlum",
head="Jhakri coronal +1",
neck="Sanctity Necklace",
ear1="Lifestorm Earring",
ear2="Psystorm Earring",
body="Samnuha coat",
hands="Jhakri cuffs +1",
ring2="Sangoma Ring",
back="Cornflower Cape",
waist="Eschan stone",
legs="Jhakri slops",
feet="Jhakri pigaches +1"}

    -- Breath Spells --
    sets.midcast['Elemental Magic'] = sets.midcast['Blue Magic'].Magical
	
    sets.midcast['Blue Magic'].Breath = {
ammo="Mavi Tathlum",
head="Luhlaza Keffiyeh",
neck="Iqabi Necklace",
ear1="Lifestorm Earring",
ear2="Psystorm Earring",
body="Vanir Cotehardie",
hands="Assimilator's Bazubands +1",
ring1="K'ayres Ring",
ring2="Beeline Ring",
back="Refraction Cape",
legs="Enif Cosciales",
feet="Iuitl Gaiters +1"}

    -- Other Types --
    
    sets.midcast['Blue Magic'].Stun = sets.midcast['Blue Magic'].MagicAccuracy
        
        
    sets.midcast['Blue Magic']['White Wind'] = {
head="Luhlaza keffiyeh",
neck="Phalaina locket",
ear1="Bloodgem Earring",
ear2="Mendicant's Earring",
body="Vrikodara jupon",
hands="Weatherspoon cuffs +1",
back="Solemnity cape",
waist="Gishdubar Sash",
legs="Gyve trousers",}

    sets.midcast['Blue Magic'].Healing = {
head="Uk'uxkaj Cap",
neck="Phalaina locket",
ear1="Lifestorm Earring",
ear2="Loquacious Earring",
body="Taeon Tabard",
hands="Buremte Gloves",
ring1="Asklepian Ring",
ring2="Kunaji Ring",
back="Pahtli Cape",
legs="Hagondes Pants",
feet="Hagondes Sabots"}

    sets.midcast['Blue Magic'].SkillBasedBuff = {
ammo="Mavi Tathlum",
head="Luhlaza Keffiyeh",
neck="Incanter's torque",
body="Assimilator's Jubbah",
back="Cornflower Cape",
legs="Hashishin Tayt +1",
feet="Luhlaza Charuqs"}

    sets.midcast['Blue Magic'].Buff = {
	}
    
    sets.midcast.Protect = {ring1="Sheltered Ring"}
    sets.midcast.Protectra = {ring1="Sheltered Ring"}
    sets.midcast.Shell = {ring1="Sheltered Ring"}
    sets.midcast.Shellra = {ring1="Sheltered Ring"}
    

    
    
    -- Sets to return to when not performing an action.

    -- Gear for learning spells: +skill and AF hands.
    sets.Learning = {ammo="Mavi Tathlum",hands="Assimilator's Bazubands +1"}
        --head="Luhlaza Keffiyeh",  
        --body="Assimilator's Jubbah",hands="Assimilator's Bazubands +1",
        --back="Cornflower Cape",legs="Mavi Tayt +2",feet="Luhlaza Charuqs"}


    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Resting sets
    sets.resting = {
head="Ocelomeh Headpiece +1",
neck="Wiglen Gorget",
body="Hagondes Coat",
hands="Serpentes Cuffs",
ring1="Sheltered Ring",
ring2="Paguroidea Ring",
waist="Austerity Belt",
feet="Serpentes sabots"}
    
    -- Idle sets
    sets.idle = {
ammo="Staunch tathlum +1",
head=gear.RefreshHerculeanHelm,
neck="Wiglen Gorget",
ear1="Infused Earring",
ear2="Etiolation Earring",
body="Shamash Robe",
hands=gear.RefreshHerculeanGloves,
ring1="Sheltered Ring",
ring2="Paguroidea Ring",
back="Repulse Mantle",
waist="Fucho-no-obi",
legs=gear.RefreshHerculeanTrousers,
feet=gear.RefreshHerculeanBoots
}

    sets.idle.PDT = {
ammo="Staunch tathlum +1",
head="Malignance chapeau",
neck="Loricate torque +1",
ear1="Infused earring",
ear2="Etiolation Earring",
body="Shamash robe",
hands="Umuthi gloves",
ring1="Defending Ring",
ring2="Dark Ring",
back="Moonbeam cape",
waist="Flume Belt +1",
legs="Carmine cuisses +1",
feet=gear.RefreshHerculeanBoots
}

sets.idle.Refresh = {
head=gear.RefreshHerculeanHelm,
neck="Wiglen Gorget",
ear1="Dawn Earring",
ear2="Infused Earring",
body="Jhakri Robe +2",
hands="Serpentes Cuffs",
ring1="Sheltered Ring",
ring2="Paguroidea Ring",
back="Moonbeam cape",
waist="Fucho-no-obi",
legs=gear.RefreshHerculeanTrousers,
feet=gear.RefreshHerculeanBoots}

    sets.idle.Learning = set_combine(sets.idle, sets.Learning)

    
    -- Defense sets
    sets.defense.PDT = {
ammo="Iron Gobbet",
head="Iuitl headgear +1",
neck="Wiglen Gorget",
ear1="Bloodgem Earring",
body="Hagondes coat",
hands="Umuthi gloves",
ring1="Defending Ring",
ring2="Dark ring",
back="Repulse Mantle",
waist="Flume Belt +1",
legs="Iuitl tights",
feet="Qaaxo leggings"}

    sets.defense.MDT = {ammo="Demonry Stone",
        head="Whirlpool Mask",neck="Twilight Torque",ear1="Bloodgem Earring",
        body="Hagondes Coat",hands="Iuitl Wristbands",ring1="Defending Ring",ring2="Shadow Ring",
        back="Engulfer Cape",waist="Flume Belt",legs="Nahtirah Trousers",feet="Iuitl Gaiters +1"}

    sets.Kiting = {legs="Carmine Cuisses +1"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group

    sets.engaged = {
    ammo="Ginsen",
    head="Adhemar bonnet",
    body="Adhemar Jacket +1",
    hands="Herculean gloves",
    legs="Samnuha tights",
    feet=gear.TAHerculeanBoots,
    neck="Asperity Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Epona's Ring",
    right_ring="Rajas Ring",
    back=gear.BluTP}

    sets.engaged.Acc = {
    ammo="Ginsen",
    head="Dampening Tam",
    body="Adhemar jacket +1",
    hands=gear.AdhemarWristbandsMelee,
    legs="Samnuha Tights",
    feet=gear.TAHerculeanBoots,
    neck="Lissome necklace",
    waist="Kentarch belt +1",
    left_ear="Cessance Earring",
    right_ear="Brutal Earring",
    left_ring="Epona's Ring",
    right_ring="Rajas Ring",
    back=gear.BluTP,
}

sets.engaged.STP = {
    ammo="Ginsen",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands=gear.AdhemarWristbandsMelee,
    legs="Carmine Cuisses +1",
    feet=gear.TAHerculeanBoots,
    neck="Lissome necklace",
    waist="Kentarch belt +1",
    left_ear="Suppanomimi",
    right_ear="Brutal Earring",
    left_ring="Chirich ring",
    right_ring="Chirich ring +1",
    back=gear.BluTP,
}

    sets.engaged.Refresh = {
ammo="Jukukik Feather",
head="Wivre hairpin",
neck="Asperity Necklace",
ear1="Bladeborn Earring",
ear2="Steelflash Earring",
body="Luhlaza Jubbah",
hands="Assimilator's Bazubands +1",
ring1="Rajas Ring",
ring2="Epona's Ring",
back="Atheling Mantle",
waist="Windbuffet Belt",
legs="Manibozho Brais",
feet="Qaaxo Leggings"}

    sets.engaged.DW = sets.engaged
    
    sets.engaged.DW.Acc = sets.engaged.Acc

    sets.engaged.DW.Refresh = {
ammo="Jukukik Feather",
head="Whirlpool Mask",
neck="Asperity Necklace",
ear1="Heartseeker Earring",
ear2="Dudgeon Earring",
body="Luhlaza Jubbah",
hands="Assimilator's Bazubands +1",
ring1="Rajas Ring",
ring2="Epona's Ring",
back="Letalis Mantle",
waist="Windbuffet Belt",
legs="Manibozho Brais",
feet="Qaaxo Leggings"}

    sets.engaged.Learning = set_combine(sets.engaged, sets.Learning)
    sets.engaged.DW.Learning = set_combine(sets.engaged.DW, sets.Learning)
	sets.MoveSpeed = {legs="Carmine cuisses +1"}

    sets.self_healing = {ring1="Kunaji Ring",ring2="Asklepian Ring"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if unbridled_spells:contains(spell.english) and not state.Buff['Unbridled Learning'] then
        eventArgs.cancel = true
        windower.send_command('@input /ja "Unbridled Learning" <me>; wait 1.5; input /ma "'..spell.name..'" '..spell.target.name)
    end
end

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    -- Add enhancement gear for Chain Affinity, etc.
    if spell.skill == 'Blue Magic' then
        for buff,active in pairs(state.Buff) do
            if active and sets.buff[buff] then
                equip(sets.buff[buff])
            end
        end
        if spellMap == 'Healing' and spell.target.type == 'SELF' and sets.self_healing then
            equip(sets.self_healing)
        end
    end

    -- If in learning mode, keep on gear intended to help with that, regardless of action.
    if state.OffenseMode.value == 'Learning' then
        equip(sets.Learning)
    end
end
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Elemental Magic' then
        if spell.element == world.day_element or spell.element == world.weather_element then
            equip(sets.midcast['Elemental Magic'], {waist="Hachirin-No-Obi"})
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
    if state.Buff[buff] ~= nil then
        state.Buff[buff] = gain
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
-- Return custom spellMap value that can override the default spell mapping.
-- Don't return anything to allow default spell mapping to be used.
function job_get_spell_map(spell, default_spell_map)
    if spell.skill == 'Blue Magic' then
        for category,spell_list in pairs(blue_magic_maps) do
            if spell_list:contains(spell.english) then
                return category
            end
        end
    end
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        set_combine(idleSet, sets.latent_refresh)
    end
    return idleSet
end

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
    update_combat_form()
end


-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function update_combat_form()
    -- Check for H2H or single-wielding
    if player.equipment.sub == "Genbu's Shield" or player.equipment.sub == 'empty' then
        state.CombatForm:reset()
    else
        state.CombatForm:set('DW')
    end
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(2, 16)
    else
        set_macro_page(1, 16)
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