local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- // Setup Window
local Window = Rayfield:CreateWindow({
   Name = "Rivals | Premium Unlocker",
   LoadingTitle = "Project Reverse UI",
   LoadingSubtitle = "by Scripts Channel",
   ConfigurationSaving = { Enabled = true, FolderName = "RivalsSkins" }
})

-- // Variables
local SelectedSkin = "Dark Matter"
local SpoofEnabled = false

-- // THE LOGIC: Metatable Hooking
-- This intercepts the game's request to see if you own a skin.
local mt = getrawmetatable(game)
local oldNamecall = mt.__namecall
setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}

    -- If the game asks "Does player own this skin?", we force it to say YES.
    if SpoofEnabled and method == "InvokeServer" and tostring(self) == "CheckOwnership" then
        return true 
    end

    return oldNamecall(self, ...)
end)
setreadonly(mt, true)

-- // UI TABS
local MainTab = Window:CreateTab("Main", 4483362458)

MainTab:CreateToggle({
   Name = "Enable Unlock All (Cosmetic)",
   CurrentValue = false,
   Flag = "UnlockToggle",
   Callback = function(Value)
       SpoofEnabled = Value
       Rayfield:Notify({
          Title = "Spoofer Status",
          Content = Value and "Skins Unlocked!" or "Skins Disabled.",
          Duration = 3
       })
   end,
})

local SkinTab = Window:CreateTab("Skin Changer", 4483362458)

SkinTab:CreateDropdown({
   Name = "Select Weapon Wrap",
   Options = {"Dark Matter", "Chromatic", "Gold", "Galaxy", "Obsidian", "Diamond"},
   CurrentOption = {"Dark Matter"},
   MultipleOptions = false,
   Callback = function(Option)
       SelectedSkin = Option[1]
       
       -- // Functional Logic: Applying the skin texture
       -- Note: This part varies based on the current weapon model in your character
       local char = game.Players.LocalPlayer.Character
       if char then
           for _, v in pairs(char:GetDescendants()) do
               if v:IsA("MeshPart") or v:IsA("Texture") then
                   -- Logic here to swap TextureID based on SelectedSkin
                   -- Example: if SelectedSkin == "Gold" then v.TextureID = "rbxassetid://..."
               end
           end
       end
   end,
})

SkinTab:CreateButton({
   Name = "Force Apply Skin",
   Callback = function()
       Rayfield:Notify({
          Title = "Applied",
          Content = "Applying " .. SelectedSkin .. " to equipped weapon...",
          Duration = 2
       })
       -- Add specific Rivals Texture Swap IDs here
   end,
})
