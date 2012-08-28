# encoding: utf-8
module ThemesForRails
  module UrlHelpers

    extend ActiveSupport::Concern
    
    included do
      include ThemesForRails::Digests

      helper_method :current_theme_stylesheet_path, 
        :current_theme_javascript_path, 
        :current_theme_image_path
    end
    
    def current_theme_stylesheet_path(asset)
      asset_with_digest = digest_for_stylesheet_file("#{asset}.css", self.theme_name)
      base_theme_stylesheet_path(:theme => self.theme_name, :asset => asset_with_digest)
    end

    def current_theme_javascript_path(asset)
      asset_with_digest = digest_for_javascript_file("#{asset}.js", self.theme_name)
      base_theme_javascript_path(:theme => self.theme_name, :asset => asset_with_digest)
    end

    def current_theme_image_path(asset)
      image, extension = asset.split(".")
      asset_with_digest = digest_for_image_file("#{image}.#{extension}", self.theme_name)
      base_theme_image_path(:theme => self.theme_name, :asset => asset_with_digest)
    end

  end
end