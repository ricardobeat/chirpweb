Chirp chirp
===========

This is an attempt to implement the chirp.io protocol ([http://chirp.io/tech/](https://web.archive.org/web/20121020144938/http://chirp.io/tech/)) using the 
WebAudio API.

Currently it can generate the tones and successfully send data to a chirp receiver,
but only using pre-generated message data from chirp.io.

For creating messages a 5-bit Reed-Solomon error correction implementation is needed,
plus guessing all the encoding parameters.

See demo at http://ricardobeat.github.com/chirpweb
