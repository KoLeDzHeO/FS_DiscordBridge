FSDiscordBridge = {}

function FSDiscordBridge:loadMap(name)
    print("[FSDiscordBridge] Мод загружен")

    -- Пример: каждую минуту проверять файл "discord_input.txt"
    self.checkInterval = 60000
    self.lastCheck = 0
end

function FSDiscordBridge:update(dt)
    self.lastCheck = self.lastCheck + dt
    if self.lastCheck > self.checkInterval then
        self.lastCheck = 0
        local file = io.open("discord_input.txt", "r")
        if file then
            local message = file:read("*a")
            file:close()

            if message and message ~= "" then
                g_currentMission:addChatMessage(g_currentMission:getFarmId(), message, 0)
                os.remove("discord_input.txt")
            end
        end
    end
end

function FSDiscordBridge:deleteMap()
    print("[FSDiscordBridge] Мод выгружен")
end

addModEventListener(FSDiscordBridge)
