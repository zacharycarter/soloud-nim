import solouddotnim, times, os

var i, spin = 0

var sl : ptr Soloud

sl = Soloud_create()

discard Soloud_init(sl)

Soloud_setGlobalVolume(sl, 1)


var stream = WavStream_create()
discard WavStream_load(cast[ptr Wav](stream), "examples/test.ogg")

let currentTime = epochTime()
let length = WavStream_getLength(stream)
discard Soloud_play(cast[ptr Soloud](sl), cast[ptr Wav](stream))

while epochTime() - currentTime <= length:
  sleep(100)

Soloud_deinit(sl)

Soloud_destroy(sl)
