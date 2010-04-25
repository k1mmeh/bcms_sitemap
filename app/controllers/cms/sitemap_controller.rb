class Cms::SitemapController < Cms::BaseController
  require 'uri'

  # BCMS internal before filters related to login.  This module is 100% public,
  # so these should be skipped
  skip_before_filter :redirect_to_cms_site
  skip_before_filter :login_required
  skip_before_filter :cms_access_required

  before_filter :configure_if_not

  cattr_accessor :config

  def google
    # technically there can be multiple roots so @sections is any Array
    @sections = Section.root
    # system sections shouldn't be included
    @ignore_sections = Section.system.map(&:id)
    @root_path = @@config['root_path']

    render :layout => false
  end

  private

  # read config from static file at /config/sitemap.yml
  def configure_if_not
    @@config ||= YAML::load(File.open("#{RAILS_ROOT}/config/sitemap.yml"))
  end

end
