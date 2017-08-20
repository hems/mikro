# creates midi output
midi = require 'midi'

output = new midi.output
output.openVirtualPort 'u'

# creates nanotimer
Timer = require 'nanotimer'

clock = new Timer

# initialize basic data layer
module.exports.data = data = { bpm: 120 }

# exported commands
module.exports.bpm = bpm = ( speed ) ->
  data.bpm = speed

module.exports.tick = tick = ->
  output.sendMessage [248]

  # interval in microseconds
  interval = 60 * 1000000 / data.bpm / ( 24 )

  clock.setTimeout tick, '', "#{interval}u"

module.exports.start = start = ->
  output.sendMessage [250]

  tick()

module.exports.stop = stop = ->
  clock.clearTimeout()

  output.sendMessage [252]
