local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local debris = game:GetService("Debris")

-- Função para verificar se você é a Aranha
local function IsSpider()
    return LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("SpiderScript")
end

-- Função ESP da Aranha
local function HighlightSpider()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("SpiderScript") then
            if not player.Character:FindFirstChild("Highlight") then
                local highlight = Instance.new("Highlight", player.Character)
                highlight.FillColor = Color3.fromRGB(255, 0, 0)
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                highlight.FillTransparency = 0.5
                highlight.OutlineTransparency = 0
            end
        end
    end
end

-- Função Auto Collect
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

-- Função Anti Armadilha
local function DisableTraps()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v.Name == "Trap" and v:IsA("BasePart") then
            v:Destroy()
        end
    end
end

-- Função Anti Spray
local function AntiSpray()
    if IsSpider() then
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChildWhichIsA("Humanoid")
        if hum then
            hum.Name = "HumanoidClone" -- renomeia pra burlar alguns scripts
        end
    end
end

-- GUI
local Window = Rayfield:CreateWindow({
   Name = "🕷️ Death Hub | Spider",
   LoadingTitle = "Death Hub",
   LoadingSubtitle = "by IamEmperorDeath",
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

-- ESP da Aranha
survivorTab:CreateButton({
   Name = "🔍 Ativar ESP da Aranha",
   Callback = HighlightSpider,
})

-- Seleção de Itens
survivorTab:CreateDropdown({
   Name = "🎒 Escolha os itens pra coletar",
   Options = {"YellowKey", "BlueKey", "Gasoline", "Wrench", "BugSpray", "Battery"},
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

-- Anti Armadilha
survivorTab:CreateButton({
   Name = "🚫 Destruir Armadilhas",
   Callback = DisableTraps,
})

-- Anti Spray (Spider)
local spiderTab = Window:CreateTab("🕷️ Spider Mode", 4483362458)

spiderTab:CreateButton({
   Name = "🛡️ Ativar Anti-Spray",
   Callback = AntiSpray,
})

-- Autodetectar modo e ativar funções automáticas
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
