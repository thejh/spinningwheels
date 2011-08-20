http = require 'http'
fs = require 'fs'
url = require 'url'
coffee = require 'coffee-script'

WTF = "WTF is that supposed to be? gah, 404 that!"
staticFiles = {}
do ->
  for filename in fs.readdirSync 'public'
    staticFiles[filename] = fs.readFileSync "public/#{filename}"
  staticFiles['script.js'] = coffee.compile staticFiles['script.coffee'].toString(), bare: true

server = http.createServer (req, res) ->
  {pathname} = url.parse req.url
  filename = pathname.split("/")[1] || "index.html"
  if staticFiles.hasOwnProperty filename
    file = staticFiles[filename]
    res.writeHead 200, "static ok", {"Content-Length": file.length}
    return res.end file
  res.writeHead 404, "WTF?", {"Content-Length": WTF.length}
  res.end WTF
server.listen 8080

#wheels = new Wheels 26
#for {locations}, personID in wheels.people
#  console.log "#{personID}: #{locations.join ', '}"
