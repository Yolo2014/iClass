# require './lib/vendor/jquery.ui.widget'
require './lib/cors/jquery.postmessage-transport'
require './lib/cors/jquery.xdr-transport'

require './lib/load-image.min'
require './lib/jquery.iframe-transport'
require './lib/jquery.fileupload'
require './lib/jquery.fileupload-process'
require './lib/jquery.fileupload-resize'
require './lib/jquery.fileupload-validate'
require './lib/jquery.fileupload-ui'

module.exports = class FileUploadView extends Backbone.View

  template: require './templates/page'

  upload: require './templates/upload'

  download: require './templates/download'

  upload_events: ['add', 'submit', 'send', 'done', 'fail', 'always', 'progress', 'progressall', 'start', 'stop', 'change', 'paste', 'drop', 'dragover', 'chunksend', 'chunkdone', 'chunkfail', 'chunkalways']

  defaults:
    maxFileSize: null
    acceptFileTypes: null
    maxNumberOfFiles: null
    done: null

  initialize: ->
    @options = _.defaults @options, @defaults
    @render()

  render: =>
    @$el.html @template @options
    fp = @$('#fileupload').fileupload
      url: @options.url
      maxFileSize: @options.maxFileSize
      acceptFileTypes: @options.acceptFileTypes
      maxNumberOfFiles: @options.maxNumberOfFiles
      uploadTemplate: (o) => @upload o: o
      downloadTemplate: (o) => @download o: o
 
    fp.on 'fileupload' + k, v for k, v of @options when k in @upload_events
    
    this

# 具体参数说明，请参阅
# https://github.com/blueimp/jQuery-File-Upload/wiki/Options