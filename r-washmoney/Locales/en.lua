local Translations = {
    error = {
        ["error"] = "Is that what you came here for? I need at least 15 of dirty money to talk business."
     },
    success = {
        ["washnoty"] = "You have laundered ".. Config.Necesita.." black money.",
    },
    proggress = {
        ["washing"] = "Washing up..."
    },
    helptext = {
        ["lab"] = "G - Wash"
    }
     
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
