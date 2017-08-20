vm           = require 'vm'
repl         = require 'repl'
CoffeeScript = require 'coffee-script'

server = repl.start
  prompt: 'µ ~'
  eval  : (code, context, file, done) ->

    try

      code = CoffeeScript.compile code, { filename: file, bare: true }
      done null, vm.runInContext(code, context, file)

    catch error
      done error

###
  completer: ( line ) ->

    #console.log 'line ->', line

    completions = '.help .error .exit .quit .q'.split(' ')
    hits        = completions.filter((c) => c.startsWith(line))

    #console.log 'hits ->', hits

    if hits.length
      return [ hits, line ]

    return [ completions, line ]
###

server.context.clock = require './commands/clock'
