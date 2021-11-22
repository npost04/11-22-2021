-------------------------------------------------------------------------------------------------------------------
--  Global Keybinds
-------------------------------------------------------------------------------------------------------------------

--  Spells:     [ ALT+, ]           Sneak/Spectral Jig/Silent Oil
--              [ ALT+. ]           Invisible/Prism Powder
--              [ ALT+Numpad7 ]     Paralyna
--              [ ALT+Numpad8 ]     Silena
--              [ ALT+Numpad9 ]     Blindna
--              [ ALT+Numpad5 ]     Stona
--              [ ALT+Numpad6 ]     Viruna
--              [ ALT+Numpad1 ]     Cursna
--              [ ALT+Numpad+ ]     Erase
--              [ ALT+Numpad0 ]     Sacrifice
--              [ ALT+Numpad. ]     Esuna
--
--  Items:      [ WIN+Numpad/ ]     Soldier's Drink
--              [ WIN+Numpad7 ]     Remedy
--              [ WIN+Numpad8 ]     Echo Drops
--              [ WIN+Numpad9 ]     Eye Drops
--              [ WIN+Numpad4 ]     Antidote
--              [ WIN+Numpad6 ]     Remedy
--              [ WIN+Numpad1 ]     Holy Water
--              [ WIN+Numpad0 ]     Catholican +1
--              [ WIN+Numpad. ]     Catholican
--
--
--              (Global-Binds.lua contains additional non-job-related keybinds)


-------------------------------------------------------------------------------------------------------------------

    -- Default Spell HotKeys
    if player.main_job == 'DNC' or player.sub_job == 'DNC' then
        send_command('bind ^, input /ja "Spectral Jig" <me>')
        send_command('unbind ^.')
    elseif player.main_job == 'RDM' or player.sub_job == 'RDM'
        or player.main_job == 'SCH' or player.sub_job == 'SCH'
        or player.main_job == 'WHM' or player.sub_job == 'WHM' then
        send_command('bind ^, input /ma "Sneak" <stpc>')
        send_command('bind ^. input /ma "Invisible" <stpc>')
    else
        send_command('bind ^, input /item "Silent Oil" <me>')
        send_command('bind ^. input /item "Prism Powder" <me>')
    end

   