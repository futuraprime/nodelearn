// Generated by CoffeeScript 1.3.3
(function() {
  var app, data, flatiron, path;

  flatiron = require('flatiron');

  path = require('path');

  data = require('./data.js');

  app = flatiron.app;

  app.config.file({
    file: path.join(__dirname, 'config', 'config.json')
  });

  app.use(flatiron.plugins.http);

  app.router.get('/', function() {
    this.res.writeHead(200, {
      'content-type': 'application/json'
    });
    return this.res.json({
      'hello': 'world'
    });
  });

  app.start(3010, function(err) {
    var addr;
    if (err) {
      throw err;
    }
    addr = app.server.address();
    return app.log.info("Listening on http://" + addr.address + ":" + addr.port);
  });

}).call(this);
