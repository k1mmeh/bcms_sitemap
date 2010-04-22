module Cms::Routes
  def routes_for_bcms_sitemap
    with_options(:controller => 'cms/sitemap') do |sm|
      sm.google_sitemap 'sitemap.xml', :action => 'google'
    end
  end
end
