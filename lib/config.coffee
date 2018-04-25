style = document.createElement 'style'
blurRadiusRule = null
bgImageRule = null
module.exports =
  apply: ->
    root = document.documentElement
    style.type = 'text/css'
    document.querySelector('head atom-styles').appendChild(style)


    # Font Size
    setFontSize = (currentFontSize) ->
      if Number.isInteger(currentFontSize)
        root.style.fontSize = currentFontSize + 'px'
      else if currentFontSize is 'Auto'
        root.style.fontSize = ''

    atom.config.onDidChange 'ghoulish-ui.fontSize', ->
      setFontSize(atom.config.get('ghoulish-ui.fontSize'))

    setFontSize(atom.config.get('ghoulish-ui.fontSize'))


    # Layout Mode
    setLayoutMode = (layoutMode) ->
      root.setAttribute('theme-ghoulish-ui-layoutmode', layoutMode.toLowerCase())

    setBlurRadius = (blurRadius) ->
      rule = "body:before{ -webkit-filter: blur( #{blurRadius}px );}"
      if blurRadiusRule isnt null
        style.sheet.deleteRule(blurRadiusRule)
      else
        blurRadiusRule = style.sheet.rules.length
      style.sheet.insertRule(rule, blurRadiusRule)

    setBackgroundImage = (backgroundImage) ->
      rule = "body:before{ background-image: url( #{backgroundImage} );}"
      if bgImageRule isnt null
        style.sheet.deleteRule(bgImageRule)
      else
        bgImageRule = style.sheet.rules.length
      style.sheet.insertRule(rule, bgImageRule)

    setLayoutMode(atom.config.get('ghoulish-ui.layoutMode'))
    setBlurRadius(atom.config.get('ghoulish-ui.blurBackground'))
    setBackgroundImage(atom.config.get('ghoulish-ui.backgroundImage'))

    atom.config.onDidChange 'ghoulish-ui.layoutMode', ->
      setLayoutMode(atom.config.get('ghoulish-ui.layoutMode'))

    atom.config.onDidChange 'ghoulish-ui.blurBackground', ->
      setBlurRadius(atom.config.get('ghoulish-ui.blurBackground'))

    atom.config.onDidChange 'ghoulish-ui.backgroundImage', ->
      setBackgroundImage(atom.config.get('ghoulish-ui.backgroundImage'))

  deactivate: (state) ->
    document.querySelector('head atom-styles').removeChild style
