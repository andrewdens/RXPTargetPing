local aceAddon = LibStub and LibStub("AceAddon-3.0", true)
local restedXP = aceAddon and aceAddon:GetAddon("RXPGuides", true)
local targeting = restedXP and restedXP.targeting
if not targeting or type(targeting.ConfigureTargetButton) ~= "function" then
    print("RestedXP Target Ping: This version of RestedXP has no compatible targeting module.")
    return
end

local pingLine = "/ping [@target] assist"
local pingCommands = "\n/cleartarget [dead]\n/stopmacro [noexists]\n" .. pingLine

hooksecurefunc(targeting, "ConfigureTargetButton", function(_, button, targetName)
    if InCombatLockdown() then return end

    local macro = button:GetAttribute("macrotext")
    if type(macro) ~= "string" or macro:find("\n" .. pingLine, 1, true) then return end

    local targetCommand = "/cleartarget\n/targetexact " .. targetName
    if macro:sub(1, #targetCommand) ~= targetCommand then return end

    local remainingCommands = macro:sub(#targetCommand + 1)
    if remainingCommands ~= "" and remainingCommands:sub(1, 1) ~= "\n" then return end

    button:SetAttribute("macrotext", targetCommand .. pingCommands .. remainingCommands)
end)
