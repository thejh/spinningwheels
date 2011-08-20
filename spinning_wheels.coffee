class Wheels
  # the prime is both the radius and the number of wheels
  constructor: (@prime) ->
    @people = ({locations: [Math.floor id/@prime]} for id in [0...(@prime*@prime)])
    @wheels = ([] for axis in [0...@prime])
    for person, i in @people
      @wheels[Math.floor i/@prime].push person
    for [0...@prime]
      for wheel in @wheels
        person.locations.push location for person, location in wheel
      @spin()
  
  spin: ->
    for wheel, i in @wheels
      for [0...i]
        wheel.push wheel.shift()
    return

wheels = new Wheels 5
for {locations}, personID in wheels.people
  console.log "#{personID}: #{locations.join ', '}"
