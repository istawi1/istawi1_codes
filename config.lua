Config = {
    Webhook = {
        Url = "https://discord.com/api/webhooks/",
        Username = ".",
        Avatar = "",
        Thumbnail = ""
    },

    Email = {
        Sender = "lawenforcement@justice.gov",
        SenderName = "Los Santos Police Department",
        Titles = {
            Update = "Aktualizacja kodu zagrożenia",
            Welcome = "Aktualny kod zagrożenia"
        }
    },

    Defaults = {
        Code = "nieznany",
        Message = {
            Email = "%s",
            Webhook = "cos zjebales",
            Emoji = "⚪",
            Color = 16777215
        }
    },

    Codes = {
        green = {
            DisplayName = "Zielony",
            Emoji = "🟢",
            Color = 65280,
            EmailMessage = "Departament Policji **nakłada zielony poziom zagrożenia miasta**. W mieście panuje spokój. Dziękujemy za współpracę i życzymy miłego dnia.",
            WebhookMessage = "**News:**\nDepartament Policji **nakłada zielony poziom zagrożenia miasta**. W mieście panuje spokój. Dziękujemy za współpracę i życzymy miłego dnia."
        },
        orange = {
            DisplayName = "Pomarańczowy",
            Emoji = "🟠",
            Color = 16753920,
            EmailMessage = "Departament Policji **nakłada pomarańczowy poziom zagrożenia miasta**. W mieście nastroje są podsycone, prosimy o zachowanie czujności.",
            WebhookMessage = "**News:**\nDepartament Policji **nakłada pomarańczowy poziom zagrożenia miasta**. W mieście nastroje są podsycone, prosimy o zachowanie czujności."
        },
        red = {
            DisplayName = "Czerwony",
            Emoji = "🔴",
            Color = 16711680,
            EmailMessage = "Departament Policji nakłada **czerwony poziom zagrożenia miasta**. W mieście może panować chaos, prosimy o pozostanie w domach jeśli to możliwe.",
            WebhookMessage = "**News:**\nDepartament Policji nakłada **czerwony poziom zagrożenia miasta**. W mieście może panować chaos, prosimy o pozostanie w domach jeśli to możliwe."
        },
        black = {
            DisplayName = "Czarny",
            Emoji = "⚫",
            Color = 0,
            EmailMessage = "Departament Policji nakłada **czarny poziom zagrożenia miasta**. Jest duże prawdopodobieństwo działalności terrorystycznej oraz przestępczej. Prosimy o zostanie w domach, zachowanie spokoju i nie sianie paniki.",
            WebhookMessage = "**News:**\nDepartament Policji nakłada **czarny poziom zagrożenia miasta**. Jest duże prawdopodobieństwo działalności terrorystycznej oraz przestępczej. Prosimy o zostanie w domach, zachowanie spokoju i nie sianie paniki."
        }
    }
}

return Config