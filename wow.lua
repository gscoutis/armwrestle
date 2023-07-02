getgenv().click = false;
getgenv().bosses = false; -- test
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "CensoriHub",
    LoadingTitle = "Join discord for key",
    LoadingSubtitle = "by ",
    ConfigurationSaving = {
       Enabled = false,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "Big Hub"
    },
    Discord = {
       Enabled = false,
       Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "Untitled",
       Subtitle = "Key System",
       Note = "No method of obtaining the key is provided",
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })
 local Tab = Window:CreateTab("Main", 4483362458) -- Title, Image

 local Toggle = Tab:CreateToggle({
    Name = "Autoclicker",
    CurrentValue = false,
    Flag = "autoclick", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(bool)
        getgenv().click = bool
        clicker()
    -- The function that takes place when the toggle is pressed
    -- The variable (Value) is a boolean on whether the toggle is true or false
    end,
 })
 local Section = Tab:CreateSection("Summer Autofarm")
 local Toggle = Tab:CreateToggle({
    Name = "Farm, use autoclicker (farms last 2 bosses in 2nd world)",
    CurrentValue = false,
    Flag = "summer", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(bool)
        getgenv().bosses = bool
        summer()
    end,
 })


function clicker()
    spawn(function()
    while click == true do
        game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ArmWrestleService.RE.onClickRequest:FireServer()
        wait(0.00001)
    end
end
)
end

function summer()
    spawn(function()
    while bosses == true do
        local args = {
            [1] = "RipperDoc",
            [2] = workspace:WaitForChild("Zones"):WaitForChild("2"):WaitForChild("Interactables"):WaitForChild("ArmWrestling"):WaitForChild("NPC"):WaitForChild("RipperDoc"),
            [3] = "2"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("ArmWrestleService"):WaitForChild("RE"):WaitForChild("onEnterNPCTable"):FireServer(unpack(args))
        
        wait(6.)

        local args = {
            [1] = "RogueAi",
            [2] = workspace:WaitForChild("Zones"):WaitForChild("2"):WaitForChild("Interactables"):WaitForChild("ArmWrestling"):WaitForChild("NPC"):WaitForChild("RogueAi"),
            [3] = "2"
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("ArmWrestleService"):WaitForChild("RE"):WaitForChild("onEnterNPCTable"):FireServer(unpack(args))        
        wait(7.1)
    
    end 
end)
end

