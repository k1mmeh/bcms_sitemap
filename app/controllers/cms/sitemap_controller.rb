class Cms::SitemapController < Cms::BaseController
  require 'uri'

  skip_before_filter :redirect_to_cms_site
  skip_before_filter :login_required
  skip_before_filter :cms_access_required
  before_filter :configure_if_not

  cattr_accessor :config

  def google
    @sections = Section.root
    @root_path = @@config['root_path']

    render :layout => false
  end

  private

  def configure_if_not
    @@config ||= YAML::load(File.open("#{RAILS_ROOT}/config/sitemap.yml"))
  end

end
