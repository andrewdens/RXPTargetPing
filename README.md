# RestedXP Target Ping

RestedXP Target Ping is a World of Warcraft add-on that adds an Assist ping to RestedXP guide target buttons. When you click a modified button and it finds a living target, the button selects that target and pings it.

## Installation

1. Install and enable RestedXP Guides (`RXPGuides`).
2. Place the `RXPTargetPing` folder in your game client's `Interface/AddOns` directory. The folder should contain `RXPTargetPing.toc` and `RXPTargetPing.lua` directly.
3. Restart the game or type `/reload`, then check that **RestedXP Target Ping** is enabled in the AddOns list.

## Usage

Open a RestedXP guide step with a target button and click it as usual. The button looks for an exact name match, clears the target if it's dead, and ends the macro if no target remains. When a living target is selected, it runs `/ping [@target] assist` before any remaining commands in the button's macro.

The add-on has no settings or slash commands of its own.

## Compatibility

- The add-on declares WoW interface version `16001` and requires a client that supports `/ping`.
- It requires RestedXP's `ConfigureTargetButton` targeting function and only modifies buttons whose macros begin with `/cleartarget` followed by `/targetexact` for the button's target name.
- Button configuration during combat lockdown is skipped. If RestedXP's targeting function is unavailable at load time, the add-on reports the compatibility issue in chat.
