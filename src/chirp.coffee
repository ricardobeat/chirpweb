
###
0 = 1760hz
1 = 1864hz
…
v =10.5khz

0123456789abcdefghijklmnopqrstuv
###

Object.defineProperty Function::, 'cull',
    value: (n) ->
        fn = @
        -> fn.apply @, Array::slice.call(arguments, 0, n)

semitone      = 1.05946311
baseFrequency = 1760
beepLength    = 87.2

# 0..9a..v
characters = ([0..9].concat [97..118].map String.fromCharCode.cull 1).join('')

freqCodes = {}
frequencies = []

for char, i in characters
    freq = +(baseFrequency * Math.pow semitone, i).toFixed 3
    freqCodes[char] = freq
    frequencies[i] = freq

context = new webkitAudioContext()

oscillator = context.createOscillator()
oscillator.type = 0 # sine wave

gainNode = context.createGainNode()
gainNode.gain.value = 1

oscillator.connect gainNode
gainNode.connect context.destination

front_door = 'hj'
message    = 'srg00lgbif'
ecc        = '4c6u07sq'

chirp = front_door + message + ecc

for char, i in chirp
    oscillator.frequency.setValueAtTime freqCodes[char], beepLength / 1000 * i

oscillator.start 0
oscillator.stop beepLength / 1000 * (chirp.length + 1)