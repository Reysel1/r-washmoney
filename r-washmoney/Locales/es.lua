
    local Translations = {
        error = {
            ["error"] = "¿Has venido para eso? Necesito minimo 15 de dinero sucio para hablar de negocio."
         },
        success = {
            ["washnoty"] = "Has lavado ".. Config.Necesita.." de dinero sucio.",
        },
        proggress = {
            ["washing"] = "Labando..."
        },
        helptext = {
            ["lab"] = "G - Lavar"
        }
         
    }
    
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true
    })
    
    