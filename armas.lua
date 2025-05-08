local ReplicatedStorage = game:GetService("ReplicatedStorage")

local function puxarArma(jogador, nomeArma)
    if jogador and jogador.Character then
        local armaOriginal = ReplicatedStorage:FindFirstChild(nomeArma)
        if armaOriginal then
            local arma = armaOriginal:Clone()
            arma.Parent = jogador.Backpack
            print("[SUCESSO] Arma '" .. nomeArma .. "' foi dada para " .. jogador.Name)
        else
            warn("[ERRO] Arma '" .. nomeArma .. "' não encontrada no ReplicatedStorage.")
        end
    else
        warn("[ERRO] Jogador ou personagem inválido ao tentar puxar arma.")
    end
end

local function puxarDinheiro(jogador, quantidade)
    local stats = jogador:FindFirstChild("leaderstats")
    if stats then
        local dinheiro = stats:FindFirstChild("Dinheiro")
        if dinheiro then
            dinheiro.Value = dinheiro.Value + quantidade
            print("[SUCESSO] " .. jogador.Name .. " recebeu R$" .. quantidade)
        else
            warn("[ERRO] 'Dinheiro' não encontrado em leaderstats de " .. jogador.Name)
        end
    else
        warn("[ERRO] 'leaderstats' não encontrado para " .. jogador.Name)
    end
end

game.Players.PlayerAdded:Connect(function(jogador)
    print("[INFO] Jogador conectado: " .. jogador.Name)
    
    jogador.Chatted:Connect(function(mensagem)
        mensagem = mensagem:lower()
        
        if mensagem == "!arma" then
            puxarArma(jogador, "FAL")
        elseif mensagem == "!dinheiro" then
            puxarDinheiro(jogador, 50000)
        end
    end)
end)
