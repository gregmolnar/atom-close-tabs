jQuery = require 'jQuery'
module.exports =

  activate: (state) ->
    atom.workspaceView.command "close-tabs:close", => @close(event)
    atom.workspaceView.command "close-tabs:close_others", => @close_others(event)
    atom.workspaceView.command "close-tabs:close_left", => @close_left(event)
    atom.workspaceView.command "close-tabs:close_right", => @close_right(event)
  deactivate: ->

  serialize: ->

  target: (event)->
    target = jQuery(event.target)
    target = target.closest('li') unless target.is('li')

  close: (event) ->
    target = @target(event)
    pane = atom.workspaceView.getActivePane()
    item = pane.itemAtIndex(target.index())
    pane.destroyItem(item)

  close_others: (event) ->
    target = @target(event)
    pane = atom.workspaceView.getActivePane()
    index = target.index()
    jQuery.each pane.getItems(), (i, e) ->
      pane.destroyItem(e) unless i == index

  close_right: (event) ->
    target = @target(event)
    pane = atom.workspaceView.getActivePane()
    index = target.index()
    jQuery.each pane.getItems(), (i, e) ->
      pane.destroyItem(e) unless i <= index

  close_left: (event) ->
    target = @target(event)
    pane = atom.workspaceView.getActivePane()
    index = target.index()
    jQuery.each pane.getItems(), (i, e) ->
      pane.destroyItem(e) unless i >= index
