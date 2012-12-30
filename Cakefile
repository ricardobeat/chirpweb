require 'flour'

task 'build', ->
    compile 'src/chirp.coffee', 'assets/chirp.js'

task 'watch', ->
    invoke 'build'
    watch 'src/', -> invoke 'build'
