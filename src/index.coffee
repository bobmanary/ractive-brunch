Ractive = require 'ractive'
sysPath = require 'path'
umd = require 'umd-wrapper'

module.exports = class RactiveCompiler
  brunchPlugin: yes
  type: 'template'
  extension: 'rac'
  pattern: /\.(?:rac|ractive)$/

  constructor: (@config) ->
    null

  compile: (data, path, callback) ->
    try
      result = umd(JSON.stringify(Ractive.parse(data)))
    catch err
      error = err
    finally
      callback error, result

  include: [
    sysPath.join(
      sysPath.parse(require.resolve('ractive')).dir,
      'ractive.runtime.js'
    )
  ]
