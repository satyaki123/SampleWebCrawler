# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.precompile += %w( 'jquery.dataTables.min.js','dataTables.bootstrap.js','bootstrap-filestyle.min.js','dataTables.editor.min.js','dataTables.tableTools.min.js','editor.bootstrap.js','dataTables.bootstrap.css','dataTables.tableTools.css','editor.bootstrap','style.js')
# Precompile additional assets
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
