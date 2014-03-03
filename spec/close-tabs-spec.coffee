CloseTabs = require '../lib/close-tabs'
{WorkspaceView} = require 'atom'
# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "CloseTabs", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('close-tabs')

  describe "when the close-tabs:close-tab event is triggered", ->
    it "closes the tab", ->
      #implement later