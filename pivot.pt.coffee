nf = $.pivotUtilities.numberFormat
tpl = $.pivotUtilities.aggregatorTemplates

frFmt =    nf(thousandsSep: ".", decimalSep: ",")
frFmtInt = nf(digitsAfterDecimal: 0, thousandsSep: ".", decimalSep: ",")
frFmtPct = nf(digitsAfterDecimal: 2, scaler: 100, suffix: "%", thousandsSep: ".", decimalSep: ",")

$.pivotUtilities.locales.pt = 
    localeStrings:
        renderError: "Ocorreu um error ao renderizar os resultados da Tabela Din&atilde;mica."
        computeError: "Ocorreu um error ao computar os resultados da Tabela Din&atilde;mica."
        uiRenderError: "Ocorreu um error ao renderizar a interface da Tabela Din&atilde;mica."
        selectAll: "Selecionar Tudo"
        selectNone: "Selecionar Nenhum"
        tooMany: "(demais para listar)"
        filterResults: "Filtrar resultados"
        totals: "Totais"
        vs: "vs"
        by: "por"
    aggregators: 
        "Contagem":                             tpl.count(frFmtInt)
        "Contagem de Valores &uacute;nicos":          tpl.countUnique(frFmtInt)
        "Lista de Valores &uacute;nicos":           tpl.listUnique(", ")
        "Soma":                              tpl.sum(frFmt)
        "Soma de Inteiros":                   tpl.sum(frFmtInt)
        "Média":                            tpl.average(frFmt)
        "Soma sobre Soma":                    tpl.sumOverSum(frFmt)
        "Limite Superior a 80%":        tpl.sumOverSumBound80(true, frFmt)
        "Limite Inferior a 80%":        tpl.sumOverSumBound80(false, frFmt)
        "Soma como Fra&ccedil;&atilde;o do Total":      tpl.fractionOf(tpl.sum(),   "total", frFmtPct)
        "Soma como Fra&ccedil;&atilde;o da Linha":    tpl.fractionOf(tpl.sum(),   "row",   frFmtPct)
        "Soma como Fra&ccedil;&atilde;o da Coluna":  tpl.fractionOf(tpl.sum(),   "col",   frFmtPct)
        "Contagem como Fra&ccedil;&atilde;o do Total":     tpl.fractionOf(tpl.count(), "total", frFmtPct)
        "Contagem como Fra&ccedil;&atilde;o da Linha":   tpl.fractionOf(tpl.count(), "row",   frFmtPct)
        "Contagem como Fra&ccedil;&atilde;o da Coluna": tpl.fractionOf(tpl.count(), "col",   frFmtPct)
    renderers:
        "Tabela":                           $.pivotUtilities.renderers["Table"]
        "Tabela com Barras":               $.pivotUtilities.renderers["Table Barchart"]
        "Mapa de Calor":                $.pivotUtilities.renderers["Heatmap"]
        "Mapa de Calor por Linhas":      $.pivotUtilities.renderers["Row Heatmap"]
        "Mapa de Calor por Colunas":    $.pivotUtilities.renderers["Col Heatmap"]
