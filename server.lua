local function SendWebhookMessage(title, message, emoji, color)
    PerformHttpRequest(Config.Webhook.Url, function(err, text, headers)
        if err ~= 200 then
            print("errorek: " .. tostring(err))
        end
    end, 'POST', 
        json.encode({
            embeds = {
                {
                    title = title,
                    description = message,
                    color = color,
                    thumbnail = { url = Config.Webhook.Thumbnail },
                    footer = { text = "Data Wydania: " .. os.date("%Y-%m-%d %H:%M:%S") }
                }
            },
            username = Config.Webhook.Username,
            avatar_url = Config.Webhook.Avatar
        }), 
        { ['Content-Type'] = 'application/json' }
    )
end

local function GetDangerCodeMessage(dangerCode, playerName)
    local emailContent, webhookMessage, emoji, displayCode, color
    dangerCode = dangerCode and dangerCode:lower() or Config.Defaults.Code

    local codeConfig = Config.Codes[dangerCode]
    if codeConfig then
        displayCode = codeConfig.DisplayName
        emailContent = string.format("Szanowny %s,\n\n%s", playerName, codeConfig.EmailMessage)
        webhookMessage = codeConfig.WebhookMessage
        emoji = codeConfig.Emoji
        color = codeConfig.Color
    else
        displayCode = dangerCode
        emailContent = string.format("Szanowny %s,\n\n" .. Config.Defaults.Message.Email, playerName, dangerCode)
        webhookMessage = Config.Defaults.Message.Webhook
        emoji = Config.Defaults.Message.Emoji
        color = Config.Defaults.Message.Color
    end

    return emailContent, webhookMessage, emoji, displayCode, color
end

local function SendDangerCodeEmail(playerId, dangerCode, receiverType, receiver)
    local playerName = GetPlayerName(playerId) or "Nieznany Gracz"
    local emailContent, webhookMessage, emoji, displayCode, color = GetDangerCodeMessage(dangerCode, playerName)

    if exports and exports.yseries and exports.yseries.SendMail then
        local emailData = {
            title = receiverType == 'source' and Config.Email.Titles.Welcome or Config.Email.Titles.Update,
            sender = Config.Email.Sender,
            senderDisplayName = Config.Email.SenderName,
            content = emailContent or "Brak treści wiadomości",
            attachments = {
                receiverType == 'source' and { photo = Config.Webhook.Thumbnail } or { location = { x = 0, y = 0 } }
            }
        }
        
        exports.yseries:SendMail(emailData, receiverType, receiver)
    end

    SendWebhookMessage("Aktualny Kod: " .. displayCode .. " " .. emoji, webhookMessage, emoji, color)
end

RegisterNetEvent('piotreq_gpt:onCodeChange')
AddEventHandler('piotreq_gpt:onCodeChange', function(playerId, data)
    local dangerCode = data and exports['piotreq_gpt'] and exports['piotreq_gpt']:GetDangerCode(data) or Config.Defaults.Code
    SendDangerCodeEmail(playerId, dangerCode, 'all', '')
end)

AddEventHandler('playerConnecting', function(playerName, setKickReason, deferrals)
    local playerId = source
    local dangerCode = exports['piotreq_gpt'] and exports['piotreq_gpt']:GetDangerCode("default") or Config.Defaults.Code
    SendDangerCodeEmail(playerId, dangerCode, 'source', tostring(playerId))
end)

RegisterNetEvent('istawi1_codes')
AddEventHandler('istawi1_codes', function(data)
    local playerId = source
    local code = data and data.code or Config.Defaults.Code
end)
