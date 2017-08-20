midi = require 'midi'

input = new midi.input()

input.on 'message', ( delta, message ) ->

  console.log ''
  console.log 'd:', delta
  console.log 'm:', message
  console.log 'args ->', arguments

input.ignoreTypes on, off, off

input.openVirtualPort 'coffee'
