exports.config =

  files:
    javascripts:
      joinTo:
        'javascripts/app.js': /^app/
        'javascripts/vendor.js': /^(bower_components|vendor)/

    stylesheets:
      joinTo:
        'stylesheets/vendor.css': /^(bower_components|vendor)/
        'stylesheets/app.css': /^app/

    templates:
      joinTo: 'javascripts/app.js'

  server:
    port: 3334

  plugins:
    autoReload:
      port: 4334
