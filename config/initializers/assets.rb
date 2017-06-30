# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( bootstrap.css )
Rails.application.config.assets.precompile += %w( home.scss )
Rails.application.config.assets.precompile += %w( bootstrap.min.js )
Rails.application.config.assets.precompile += %w( patterns.scss )
Rails.application.config.assets.precompile += %w( cart_items.scss )
Rails.application.config.assets.precompile += %w( strands.scss )
Rails.application.config.assets.precompile += %w( fabrics.scss )
Rails.application.config.assets.precompile += %w( kits.scss )
Rails.application.config.assets.precompile += %w( accessories.scss )
Rails.application.config.assets.precompile += %w( dashboard.js )
Rails.application.config.assets.precompile += %w( admin.scss )
Rails.application.config.assets.precompile += %w( admin_notifications.scss )
Rails.application.config.assets.precompile += %w( users.scss )
