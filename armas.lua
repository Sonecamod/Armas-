-- Script para puxar armas e dinheiro em Ilha Bela (Roblox)

-- Função para puxar uma arma
local function puxarArma(jogador, nomeArma)
    -- Verificar se o jogador é válido
    if jogador and jogador.Character then
        -- Criar a arma
        local arma = Instance.new("Tool")
        arma.Name = nomeArma
        
        arma.Parent = jogador.Backpack
    end
end

-- Função para puxar dinheiro
local function puxarDinheiro(jogador, quantidade)
    
    if jogador and jogador.Character then
        
        jogador.leaderstats.Dinheiro.Value = jogador.leaderstats.Dinheiro.Value + quantidade
    end
end

-- Conectar a função ao evento de interação do jogador
game.Players.PlayerAdded:Connect(function(jogador)
    jogador.Chatted:Connect(function(mensagem)
                
        if mensagem:lower() == "!arma" then
            puxarArma(jogador, "FAL") 
        end
        if mensagem:lower() == "!dinheiro" then
            puxarDinheiro(jogador, 50000) -- Quantidade de dinheiro a ser puxada (exemplo: 100)
        end
    end)
end
