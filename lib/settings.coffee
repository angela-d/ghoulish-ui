module.exports =
  config:

    fontSize:
      title: 'Font Size'
      description: 'Change the UI font size; minimum 10 and max 20'
      type: ['integer', 'string']
      minimum: 10
      maximum: 20
      default: 'Auto'

    layoutMode:
      title: 'Layout Mode'
      description: 'In Auto mode, the UI will automatically adapt based on the window size'
      type: 'string'
      default: 'Auto'
      enum: [
        'Compact',
        'Auto',
        'Spacious',
      ]

    blurBackground:
      title: 'Blur Background'
      description: 'Blurs the background with given blur radius; set 0 to disable'
      type: 'string'
      default: "0"

    backgroundImage:
      title: 'Background Image'
      description: 'Path to the background image'
      type: 'string'
      default: 'atom://ghoulish-ui/imgs/zombie.jpg'

    treeViewBackgroundImage:
      title: 'Tree View Background Image'
      description: 'Path to the background image (shown in the tree view side bar)'
      type: 'string'
      default: 'atom://ghoulish-ui/imgs/tree.jpg'

  activate: (state) ->
    ghoulish = require './config'
    ghoulish.apply()
