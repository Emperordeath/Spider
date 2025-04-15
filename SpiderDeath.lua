repeat task.wait() until game:IsLoaded()
repeat task.wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character

-- Carregar Rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

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

-- Criação das Abas e Funções do Death Hub

-- Aba "Survivor Mode"
local TabSurvivor = Window:CreateTab("Survivor Mode", 4483362458)

-- ESP da Aranha
TabSurvivor:CreateSection("ESP da Aranha")
TabSurvivor:CreateToggle({
    Name = "Ativar ESP da Aranha",
    Default = false,
    Callback = function(value)
        -- Adicionar lógica para ESP da Aranha
        if value then
            -- Função de ESP para mostrar a aranha (nome, distância, highlight)
        end
    end
})

-- Auto Coletar Itens
TabSurvivor:CreateSection("Auto Coletar Itens")
TabSurvivor:CreateToggle({
    Name = "Coletar Itens Automaticamente",
    Default = false,
    Callback = function(value)
        -- Função para pegar itens como chave, gasolina, spray, etc.
        if value then
            -- Lógica para pegar itens automaticamente
        end
    end
})

-- Anti-Arm Trap
TabSurvivor:CreateSection("Anti-Arm Trap")
TabSurvivor:CreateToggle({
    Name = "Ignorar Armadilhas",
    Default = false,
    Callback = function(value)
        -- Lógica para ignorar armadilhas ou destravar armadilhas
        if value then
            -- Lógica para anti-armadilha
        end
    end
})

-- Anti-Spray (Imunidade ou Delay no Spray)
TabSurvivor:CreateSection("Anti-Spray")
TabSurvivor:CreateToggle({
    Name = "Ativar Anti-Spray",
    Default = false,
    Callback = function(value)
        -- Lógica para imunidade ou delay falso no spray
        if value then
            -- Lógica para anti-spray
        end
    end
})

-- Detecção Automática se você é a Aranha ou não
TabSurvivor:CreateSection("Modo Automático")
TabSurvivor:CreateLabel("Detecção Automática")
TabSurvivor:CreateButton({
    Name = "Detectar se sou a Aranha",
    Callback = function()
        -- Função para autodetectar se o jogador é a aranha ou não
    end
})

-- Função de Detecção de Aranha
local function IsSpider()
    -- Lógica para detectar se o jogador é a aranha
end

-- Função de Destruição de Armadilha e Imunidade ao Spray
local function AntiTrapAndAntiSpray()
    -- Lógica para aplicar AntiTrap e AntiSpray
end

-- Rodar as funções
IsSpider()
AntiTrapAndAntiSpray()

