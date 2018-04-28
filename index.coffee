{CompositeDisposable, Disposable} = require 'atom'
subscriptions = null

hideIcons = (hide) ->
  hideClass = "ghoulish-ui-no-icons"
  atom.views.getView(atom.workspace)?.classList.toggle hideClass, hide


module.exports =
  activate: ->
    subscriptions = new CompositeDisposable()
    subscriptions.add atom.config.observe 'ghoulish-ui.fileIcons', (enabled) =>
      hideIcons not enabled
    subscriptions.add new Disposable => hideIcons(false)
    undefined

  deactivate: =>
    subscriptions?.dispose()
