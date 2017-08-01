# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( static_pages.css )
Rails.application.config.assets.precompile += %w( static_pages.js )
Rails.application.config.assets.precompile += %w('dashboards.css', 'forms.css',  'graphs.css', 'mailbox.css', 'miscellaneous.css', 'tables.css',  'commerce.css' )
Rails.application.config.assets.precompile += %w('forms.js', 'miscellaneous.js', 'pages.js', 'tables.js' )
Rails.application.config.assets.precompile += %w( fundraisings.css )
Rails.application.config.assets.precompile += %w( fundraisings.js )
Rails.application.config.assets.precompile += %w( organisations.js )
Rails.application.config.assets.precompile += %w( organisations.css )
Rails.application.config.assets.precompile += %w( membershipdata.js )
Rails.application.config.assets.precompile += %w( membershipdata.css )
Rails.application.config.assets.precompile += %w( groups.css )
Rails.application.config.assets.precompile += %w( groups.js )
Rails.application.config.assets.precompile += %w( jobs.css )
Rails.application.config.assets.precompile += %w( jobs.js )
Rails.application.config.assets.precompile += %w( networks.css )
Rails.application.config.assets.precompile += %w( networks.js )

# Rails.application.config.assets.precompile += %w( static_pages.scss )
# Rails.application.config.assets.precompile += %w( static_pages.js )