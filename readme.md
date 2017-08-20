# µ

after long time playing around with different "programming music" software i
came to the conclusion that in order to run my own setup and generative
sequencing i need much less than what is provided.

all i need is to drive external clocks, send midi messages and eventually some
OSC, unfortunatelly max/msp, supercollider and other applications i have played
with didn't make it simple enough or at least not simple enough for me.

(un)fortunately i use Ableton Live as DAW for playing and composing music...
Live also has some downsides, for instance using it as MIDI Master Clock yields
weird glitches specially when using it to drive multiple external clocks,
that's a challenge i would like to explore... the idea of making a better
master clock.

goes without saying most nerds ( including me ) would say i'm insane for trying
such thing using node.js instead of some "low level" programming environment,
so turns out this is another challenge i would like to explore.

obviousy this is all for fun and not for profit, main goals here are:

 - create a suitable midi clock for driving external gear which must be very
 precise or at least very fun to use

 - create some sort of pattern editor / generator, initially using monome as UI

 - occupy my mind with nerd stuff instead of making music so i don't remind
 myself about the fact that i suck at doing music

## software architecture

 - have a server separately from the repl ( sort of like supercollider ) so we
 can crash or update the repl without stopping the server

 - ideally the state of the app will eventually live separately from the actual
code so we can crash the repl and take the state from where it was left

 - have repl / server separately so we can use one thread to drive things (server)
 and another thread to play around with commands and data

 - i don't even know if that makes sense but at least it sounds fun.

for some easy listening, checkout [soundcloud.com/hems](http://soundcloud.com/hems)
