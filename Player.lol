local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Player.lol", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

--[[
Name = <string> - The name of the UI.
HidePremium = <bool> - Whether or not the user details shows Premium status or not.
SaveConfig = <bool> - Toggles the config saving in the UI.
ConfigFolder = <string> - The name of the folder where the configs are saved.
IntroEnabled = <bool> - Whether or not to show the intro animation.
IntroText = <string> - Text to show in the intro animation.
IntroIcon = <string> - URL to the image you want to use in the intro animation.
Icon = <string> - URL to the image you want displayed on the window.
CloseCallback = <function> - Function to execute when the window is closed.
]]

local Tab = Window:MakeTab({
    Name = "Info",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]

local Section = Tab:AddSection({
    Name = "Player.lol Info"
})

--[[
Name = <string> - The name of the section.
]]

local Section = Tab:AddSection({
    Name = "Everything Made By cal #0001"
})

local Section = Tab:AddSection({
    Name = "Player.lol Gui is orion lib"
})

local Section = Tab:AddSection({
    Name = "Tester Is Ray and cal."
})

--[[
Name = <string> - The name of the section.
]]

--[[
Name = <string> - The name of the section.
]]

--[[
Name = <string> - The name of the section.
]]

local Tab = Window:MakeTab({
  Name = "Player.lol",
  Icon = "rbxassetid://4483345998",
  PremiumOnly = false
})

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]

local Section = Tab:AddSection({
  Name = "All credits go to cal #0001"
})

--[[
Name = <string> - The name of the section.
]]

Tab:AddDropdown({
    Name = "Walkspeed",
    Default = "16",
    Options = {"16", "40", "69", "100", "420"},
    Callback = function(Value)
        -- Set the WalkSpeed to the selected value
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(Value)
    end
})

Tab:AddDropdown({
    Name = "Jump Height",
    Default = "50", -- Set default to one of the options
    Options = {"50", "120", "345"},
    Callback = function(Value)
        -- Set the JumpPower to the selected value
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = tonumber(Value)
    end
})

-- Create a variable to track if noclip is active
local noclip = false

-- Function to apply or remove noclip from the character
local function applyNoclip()
    local character = game.Players.LocalPlayer.Character
    if character then
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = not noclip
            end
        end
    end
end

-- Add a toggle to the GUI
Tab:AddToggle({
    Name = "Noclip",
    Default = false,
    Callback = function(Value)
        noclip = Value
        applyNoclip() -- Apply noclip based on the toggle state
    end
})

-- Continuously apply noclip mode if active
game:GetService("RunService").RenderStepped:Connect(function()
    if noclip then
        local character = game.Players.LocalPlayer.Character
        if character then
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end
end)

local Section = Tab:AddSection({
    Name = "Player Esp"
})

--[[
Name = <string> - The name of the section.
]]

Tab:AddButton({
    Name = "Innocent ESP",
    Callback = function()
            local Players = game:GetService("Players")
            local Workspace = game:GetService("Workspace")
            local RunService = game:GetService("RunService")

            -- ESP settings
            local ESPColor = Color3.fromRGB(0, 255, 0) -- Green color
            local ESPTransparency = 0.5 -- Transparency of the ESP box

            -- Create ESP box for a player
            local function createESPBox(player)
                local char = player.Character
                if not char or not char:FindFirstChild("HumanoidRootPart") then return end

                local hrp = char:FindFirstChild("HumanoidRootPart")

                -- Create BillboardGui
                local billboard = Instance.new("BillboardGui")
                billboard.Name = "ESPBox"
                billboard.Adornee = hrp
                billboard.Size = UDim2.new(0, 6, 0, 8) -- Rectangle size
                billboard.StudsOffset = Vector3.new(0, 3, 0) -- Adjust position as needed
                billboard.AlwaysOnTop = true
                billboard.Parent = hrp

                -- Create Frame inside BillboardGui
                local frame = Instance.new("Frame")
                frame.Size = UDim2.new(1, 0, 1, 0) -- Fill the BillboardGui
                frame.BackgroundColor3 = ESPColor
                frame.BackgroundTransparency = ESPTransparency
                frame.BorderSizePixel = 0
                frame.Parent = billboard
            end

            -- Remove ESP box for a player
            local function removeESPBox(player)
                local char = player.Character
                if char then
                    local hrp = char:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        local billboard = hrp:FindFirstChild("ESPBox")
                        if billboard then
                            billboard:Destroy()
                        end
                    end
                end
            end

            -- Update ESP for all players
            local function updateESP()
                for _, player in ipairs(Players:GetPlayers()) do
                    if player ~= Players.LocalPlayer then
                        createESPBox(player)
                    end
                end
            end

            -- Event listeners
            Players.PlayerAdded:Connect(function(player)
                player.CharacterAdded:Connect(function()
                    createESPBox(player)
                end)
            end)

            Players.PlayerRemoving:Connect(function(player)
                removeESPBox(player)
            end)

            -- Initialize ESP for existing players
            updateESP()

            -- Continuously update ESP for players
            RunService.Heartbeat:Connect(function()
                updateESP()
            end)
            print("button pressed")
    end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
    Name = "Murd And Sheriff ESP",
    Callback = function()
            local Players = game:GetService("Players")
            local Workspace = game:GetService("Workspace")
            local RunService = game:GetService("RunService")

            -- ESP settings
            local ESPTransparency = 0.5 -- Transparency of the ESP box

            -- Create ESP box for a player
            local function createESPBox(player)
                local char = player.Character
                if not char or not char:FindFirstChild("HumanoidRootPart") then return end

                local hrp = char:FindFirstChild("HumanoidRootPart")
                local backpack = player.Backpack

                -- Create BillboardGui
                local billboard = Instance.new("BillboardGui")
                billboard.Name = "ESPBox"
                billboard.Adornee = hrp
                billboard.Size = UDim2.new(0, 6, 0, 8) -- Rectangle size
                billboard.StudsOffset = Vector3.new(0, 3, 0) -- Adjust position as needed
                billboard.AlwaysOnTop = true
                billboard.Parent = hrp

                -- Create Frame inside BillboardGui
                local frame = Instance.new("Frame")
                frame.Size = UDim2.new(1, 0, 1, 0) -- Fill the BillboardGui
                frame.BackgroundTransparency = ESPTransparency
                frame.BorderSizePixel = 0
                frame.Parent = billboard

                -- Update the ESP color based on player's tools
                local function updateESPColor()
                    local hasKnife = backpack:FindFirstChild("Knife Tool") or backpack:FindFirstChild("KnifeDisplay")
                    local hasGun = backpack:FindFirstChild("Gun Tool") or backpack:FindFirstChild("GunDisplay")

                    if hasKnife then
                        frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Red color
                    elseif hasGun then
                        frame.BackgroundColor3 = Color3.fromRGB(0, 0, 255) -- Blue color
                    else
                        frame.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Default green color
                    end
                end

                -- Call the update function initially
                updateESPColor()

                -- Update ESP color whenever tools are changed
                backpack.ChildAdded:Connect(updateESPColor)
                backpack.ChildRemoved:Connect(updateESPColor)
            end

            -- Remove ESP box for a player
            local function removeESPBox(player)
                local char = player.Character
                if char then
                    local hrp = char:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        local billboard = hrp:FindFirstChild("ESPBox")
                        if billboard then
                            billboard:Destroy()
                        end
                    end
                end
            end

            -- Update ESP for all players
            local function updateESP()
                for _, player in ipairs(Players:GetPlayers()) do
                    if player ~= Players.LocalPlayer then
                        createESPBox(player)
                    end
                end
            end

            -- Event listeners
            Players.PlayerAdded:Connect(function(player)
                player.CharacterAdded:Connect(function()
                    createESPBox(player)
                end)
            end)

            Players.PlayerRemoving:Connect(function(player)
                removeESPBox(player)
            end)

            -- Initialize ESP for existing players
            updateESP()

            -- Continuously update ESP for players
            RunService.Heartbeat:Connect(function()
                updateESP()
            end)
            print("button pressed")
    end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

local Section = Tab:AddSection({
    Name = "Murderer"
})

--[[
Name = <string> - The name of the section.
]]

-- Place this script in a LocalScript or Script, depending on where you want it to execute

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Adjust these values as needed
local teleportDistance = 2 -- Distance behind each player
local delayBetweenTeleports = 1 -- Delay in seconds between teleports

-- Variable to control teleportation
local isTeleporting = false

-- Function to teleport behind players
local function teleportBehindPlayers()
    local character = LocalPlayer.Character
    if not character then return end

    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return end

    -- Iterate through all players
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local targetPart = player.Character.HumanoidRootPart
            local direction = (humanoidRootPart.Position - targetPart.Position).unit
            local newPosition = targetPart.Position + direction * teleportDistance

            -- Calculate the look direction to face the player
            local lookAtPosition = targetPart.Position

            -- Teleport the LocalPlayer and face the player
            humanoidRootPart.CFrame = CFrame.new(newPosition, lookAtPosition)

            -- Wait for a short time before moving to the next player
            wait(delayBetweenTeleports)
        end
    end
end

-- Toggle button integration
Tab:AddToggle({
    Name = "Teleport Behind Players",
    Default = false,
    Callback = function(Value)
        isTeleporting = Value
        while isTeleporting do
            teleportBehindPlayers()
            wait(1) -- Adjust the loop delay if needed
        end
    end
})

-- Additional loop to ensure teleportation stops when the toggle is turned off
game:GetService("RunService").Stepped:Connect(function()
    if isTeleporting then
        teleportBehindPlayers()
    end
end)
