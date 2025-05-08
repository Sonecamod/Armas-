-- Script no StarterPlayerScripts (LocalScript)

local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Criar a GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 200, 0, 50)
toggleButton.Position = UDim2.new(0.5, -100, 0.5, -25)
toggleButton.Text = "Ativar Expulsão"
toggleButton.Parent = screenGui

-- Criar o RemoteEvent para se comunicar com o servidor
local remoteEvent = Instance.new("RemoteEvent")
remoteEvent.Name = "ToggleKick"
remoteEvent.Parent = ReplicatedStorage

-- Funcionalidade do botão
toggleButton.MouseButton1Click:Connect(function()
    -- Alterna entre ativar e desativar a expulsão
    remoteEvent:FireServer()  -- Aciona o servidor para alternar a expulsão
    
    if toggleButton.Text == "Ativar Expulsão" then
        toggleButton.Text = "Desativar Expulsão"
    else
        toggleButton.Text = "Ativar Expulsão"
    end
end)
