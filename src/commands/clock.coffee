midi = require 'midi'

output = new midi.output
output.openVirtualPort 'u'


Timer = require 'nanotimer'

clock = new Timer

data = { bpm: 120 }

module.exports.bpm = bpm = ( speed ) ->
  data.bpm = speed

module.exports.tick = tick = ->
  #console.log 'clock ~ tick'

  output.sendMessage [248]

  # interval in microseconds
  interval = 60 * 1000000 / data.bpm / ( 24 )

  clock.setTimeout tick, '', "#{interval}u"

module.exports.start = start = ->

  #console.log 'clock ~ start'

  output.sendMessage [250]

  tick()

module.exports.stop = stop = ->

  clock.clearTimeout()

  #console.log 'clock ~ stop'
  output.sendMessage [252]
