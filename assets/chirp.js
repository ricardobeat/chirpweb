
/*
0 = 1760hz
1 = 1864hz
…
v =10.5khz

0123456789abcdefghijklmnopqrstuv
*/


(function() {
  var baseFrequency, beepLength, char, characters, chirp, context, ecc, freq, freqCodes, frequencies, front_door, gainNode, i, message, oscillator, semitone, _i, _j, _k, _len, _len1, _results;

  Object.defineProperty(Function.prototype, 'cull', {
    value: function(n) {
      var fn;
      fn = this;
      return function() {
        return fn.apply(this, Array.prototype.slice.call(arguments, 0, n));
      };
    }
  });

  semitone = 1.05946311;

  baseFrequency = 1760;

  beepLength = 87.2;

  characters = ([0, 1, 2, 3, 4, 5, 6, 7, 8, 9].concat((function() {
    _results = [];
    for (_i = 97; _i <= 118; _i++){ _results.push(_i); }
    return _results;
  }).apply(this).map(String.fromCharCode.cull(1)))).join('');

  freqCodes = {};

  frequencies = [];

  for (i = _j = 0, _len = characters.length; _j < _len; i = ++_j) {
    char = characters[i];
    freq = +(baseFrequency * Math.pow(semitone, i)).toFixed(3);
    freqCodes[char] = freq;
    frequencies[i] = freq;
  }

  context = new webkitAudioContext();

  oscillator = context.createOscillator();

  oscillator.type = 0;

  gainNode = context.createGainNode();

  gainNode.gain.value = 1;

  oscillator.connect(gainNode);

  gainNode.connect(context.destination);

  front_door = 'hj';

  message = 'srg00lgbif';

  ecc = '4c6u07sq';

  chirp = front_door + message + ecc;

  for (i = _k = 0, _len1 = chirp.length; _k < _len1; i = ++_k) {
    char = chirp[i];
    oscillator.frequency.setValueAtTime(freqCodes[char], beepLength / 1000 * i);
  }

  oscillator.start(0);

  oscillator.stop(beepLength / 1000 * (chirp.length + 1));

}).call(this);
