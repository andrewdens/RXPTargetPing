# RestedXP Target Ping

RestedXP Target Ping is a World of Warcraft add-on that adds an Assist ping to RestedXP guide target buttons. When you click a modified button and it finds a living target, the button selects that target and pings it.

## Installation

Install RestedXP Guides (`RXPGuides`) for the same game client before using this add-on.

### With WowUp

1. Open WowUp and select your **WoW Forever** client.
2. Open **Get Addons** → **Install from URL** and paste `https://github.com/andrewdens/RXPTargetPing`.
3. Click **Import**, then **Install**. [WowUp's installation guide](https://wowup.io/guide/get-addons/overview)
4. Restart WoW if it was running. In the game's **AddOns** list, enable **RestedXP Guides** and **RestedXP Target Ping**.

### Manually

1. Download the add-on ZIP from [GitHub Releases](https://github.com/andrewdens/RXPTargetPing/releases). If a release ZIP is unavailable, use **Code** → **Download ZIP** on the [repository page](https://github.com/andrewdens/RXPTargetPing) or clone it with `git clone https://github.com/andrewdens/RXPTargetPing.git`.
2. Extract the ZIP if needed. Locate the folder containing `RXPTargetPing.toc` and `RXPTargetPing.lua`. If the folder has a branch or version suffix, rename it to `RXPTargetPing`.
3. Copy that folder into your game client's `Interface/AddOns` directory. For WoW Forever, the resulting layout should be:

   ```text
   World of Warcraft/
   └── _forever_/
       └── Interface/
           └── AddOns/
               └── RXPTargetPing/
                   ├── RXPTargetPing.toc
                   └── RXPTargetPing.lua
   ```

4. Restart WoW if it was running. In the game's **AddOns** list, enable **RestedXP Guides** and **RestedXP Target Ping**.

## Usage

Open a RestedXP guide step with a target button and click it as usual. The button looks for an exact name match, clears the target if it's dead, and ends the macro if no target remains. When a living target is selected, it runs `/ping [@target] assist` before any remaining commands in the button's macro.

The add-on has no settings or slash commands of its own.

## Compatibility

- The add-on declares WoW interface version `16001` and requires a client that supports `/ping`.
- It requires RestedXP's `ConfigureTargetButton` targeting function and only modifies buttons whose macros begin with `/cleartarget` followed by `/targetexact` for the button's target name.
- Button configuration during combat lockdown is skipped. If RestedXP's targeting function is unavailable at load time, the add-on reports the compatibility issue in chat.
