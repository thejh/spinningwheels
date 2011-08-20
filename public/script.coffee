class Wheels
  # the prime is both the radius and the number of wheels
  constructor: (@peopleCount) ->
    @prime = do =>
      isPrime = (n) ->
        return false if n%1 isnt 0
        return false for m in [2...n] when (n/m)%1 is 0
        true
      n = @peopleCount
      while not isPrime Math.sqrt n
        console.log "checking #{n+1} next..."
        n++
      Math.sqrt n
    @people = for id in [0...@prime*@prime]
      if id < @peopleCount
        {locations: [Math.floor id/@prime]}
      else
        null
    @wheels = ([] for axis in [0...@prime])
    for person, i in @people
      @wheels[Math.floor i/@prime].push person
    for [0...@prime]
      for wheel in @wheels
        person.locations.push location for person, location in wheel when person
      @spin()
  
  spin: ->
    for wheel, i in @wheels
      for [0...i]
        wheel.push wheel.shift()
    return

$(document).ready ->
  $('#button').click ->
    {people} = new Wheels parseInt $('#peopleCount').val(), 10
    output = []
    for person, personID in people when person
      output.push "#{personID}: #{person.locations.join ', '}"
    $('#output').html output.join '<br>'
