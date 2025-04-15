-- Garantir que o jogo esteja carregado
repeat task.wait() until game:IsLoaded()
repeat task.wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character

-- Forçar carregamento do Rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Criando a janela principal do Death Hub
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

-- Criando as abas e funções principais para o Survivor Mode
local TabSurvivor = Window:CreateTab("Survivor Mode", 4483362458)

-- ESP da Aranha
TabSurvivor:CreateSection("ESP da Aranha")
TabSurvivor:CreateToggle({
    Name = "Ativar ESP da Aranha",
    Default = false,
    Callback = function(value)
        if value then
            -- Código para ativar o ESP da Aranha (nome, distância e highlight)
        else
            -- Desativar o ESP
        end
    end
})

-- Auto Coletar Itens
TabSurvivor:CreateSection("Auto Coletar Itens")
TabSurvivor:CreateToggle({
    Name = "Coletar Itens Automaticamente",
    Default = false,
    Callback = function(value)
        if value then
            -- Código para pegar itens como chave, gasolina, spray automaticamente
        end
    end
})

-- Anti-Arm Trap
TabSurvivor:CreateSection("Anti-Arm Trap")
TabSurvivor:CreateToggle({
    Name = "Ignorar Armadilhas",
    Default = false,
    Callback = function(value)
        if value then
            -- Ignorar armadilhas ou destravar armadilhas
        end
    end
})

-- Anti-Spray (Imunidade ou Delay no Spray)
TabSurvivor:CreateSection("Anti-Spray")
TabSurvivor:CreateToggle({
    Name = "Ativar Anti-Spray",
    Default = false,
    Callback = function(value)
        if value then
            -- Colocar imunidade ou delay falso no spray
        end
    end
})

-- Detecção Automática se você é a Aranha ou não
TabSurvivor:CreateSection("Modo Automático")
TabSurvivor:CreateButton({
    Name = "Detectar se sou a Aranha",
    Callback = function()
        -- Função para autodetectar se você é a aranha ou não
        local isSpider = game.Players.LocalPlayer.Team.Name == "Spider" -- Exemplo de detecção
        print(isSpider and "Você é a Aranha!" or "Você não é a Aranha.")
    end
})

-- Funções Extras de Detecção e Anti-Spray
local function IsSpider()
    -- Verificar se é a aranha
    return game.Players.LocalPlayer.Team.Name == "Spider"
end

local function AntiTrapAndAntiSpray()
    -- Lógica para Anti-Arm Trap e Anti-Spray
    if IsSpider() then
        -- Se você for a aranha, não permitir armadilhas ou spray
        print("Você é a Aranha! Imunidade ativa.")
    end
end

-- Rodando as funções extras automaticamente
AntiTrapAndAntiSpray()

