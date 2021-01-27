
window.AudioContext or= (
    window.webkitAudioContext or
    window.mozAudioContext    or
    window.msAudioContext     or
    window.oAudioContext
)

# Frequency table
# ---------------

semitone      = 1.05946311
baseFrequency = 1760
beepLength    = 87.2

characters = '0123456789abcdefghijklmnopqrstuv'

freqCodes = {}
frequencies = []

# Generate the frequencies that correspond to each code point.
for char, i in characters
    freq = +(baseFrequency * Math.pow semitone, i).toFixed 3
    freqCodes[char] = freq
    frequencies[i] = freq
    

# Chirp Player
# -------------

context = new AudioContext()

window.chirp = (message, ecc) ->

    # Chirps' chirps are composed of a 2 character identifier,
    # followed by a 10-character payload and 8 characters of error correction
    front_door = 'hj'
    #message    = 'srg00lgbif'
    #ecc        = '4c6u07sq'

    chirp = front_door + message + ecc

    oscillator = context.createOscillator()
    oscillator.type = "sine" # sine wave

    gainNode = context.createGain()
    gainNode.gain.value = 0.5

    oscillator.connect gainNode
    gainNode.connect context.destination

    now = context.currentTime

    # Pre-program the oscillator
    for char, i in chirp
        oscillator.frequency.setValueAtTime freqCodes[char], now + (beepLength / 1000 * i)

    # Play!
    oscillator.start now
    # And don't forget to stop
    oscillator.stop now + (beepLength / 1000 * (chirp.length + 1))
