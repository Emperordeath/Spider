repeat task.wait() until game:IsLoaded()
repeat task.wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character

local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/UltraStuff/scripts2/main/RayfieldUILibrary.lua"))()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

-- Detecta se o jogador é a Aranha
local function IsSpider()
    return LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("SpiderScript")
end

-- ESP da Aranha
local function HighlightSpider()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("SpiderScript") then
            if not player.Character:FindFirstChild("Highlight") then
                local highlight = Instance.new("Highlight", player.Character)
                highlight.FillColor = Color3.fromRGB(255, 0, 0)
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                highlight.FillTransparency = 0.5
                highlight.OutlineTransparency = 0
                highlight.Name = "Highlight"
            end
        end
    end
end

-- Auto Collect Itens
local AutoCollectEnabled = false
local ItemList = {}

local function CollectItems()
    task.spawn(function()
        while AutoCollectEnabled do
            for _, item in pairs(Workspace:GetDescendants()) do
                if table.find(ItemList, item.Name) and item:IsA("Tool") and item:FindFirstChild("Handle") then
                    firetouchinterest(LocalPlayer.Character.HumanoidRootPart, item.Handle, 0)
                    firetouchinterest(LocalPlayer.Character.HumanoidRootPart, item.Handle, 1)
                end
            end
            task.wait(0.5)
        end
    end)
end

-- Destruir Armadilhas
local function DisableTraps()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v.Name == "Trap" and v:IsA("BasePart") then
            v:Destroy()
        end
    end
end

-- Anti Spray (modo Aranha)
local function AntiSpray()
    if IsSpider() then
        local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.Name = "HumanoidClone" -- Bypass básico
        end
    end
end

-- Criar GUI
local Window = Rayfield:CreateWindow({
   Name = "🕷️ Death Hub | Spider",
   LoadingTitle = "Death Hub",
   LoadingSubtitle = "feito por IamEmperorDeath",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "DeathHubSpider",
      FileName = "Config"
   },
   Discord = {
      Enabled = false
   },
   KeySystem = false,
})

local survivorTab = Window:CreateTab("✅ Survivor Mode", 4483362458)

survivorTab:CreateButton({
   Name = "🔍 Ativar ESP da Aranha",
   Callback = HighlightSpider,
})

survivorTab:CreateDropdown({
   Name = "🎒 Escolha os itens pra coletar",
   Options = {"YellowKey", "BlueKey", "RedKey", "Gasoline", "Wrench", "BugSpray", "Battery"},
   MultiSelection = true,
   Callback = function(Value)
       ItemList = Value
   end,
})

survivorTab:CreateToggle({
   Name = "🎒 Auto Coletar Itens Selecionados",
   CurrentValue = false,
   Callback = function(Value)
       AutoCollectEnabled = Value
       if Value then
           CollectItems()
       end
   end,
})

survivorTab:CreateButton({
   Name = "🚫 Destruir Armadilhas",
   Callback = DisableTraps,
})

local spiderTab = Window:CreateTab("🕷️ Spider Mode", 4483362458)

spiderTab:CreateButton({
   Name = "🛡️ Ativar Anti-Spray",
   Callback = AntiSpray,
})

-- Auto detecta modo e executa funções automáticas
task.spawn(function()
    while true do
        if IsSpider() then
            AntiSpray()
        else
            HighlightSpider()
        end
        task.wait(3)
    end
end)
