SPEC = Gem::Specification.new do |spec| 
  spec.name = "bcms_sitemap"
  spec.rubyforge_project = spec.name
  spec.version = "1.0"
  spec.summary = "A Sitemap Module for BrowserCMS"
  spec.author = "Kimmy Chirnside" 
  spec.email = "kimmy.chirnside@gmail.com" 
  spec.homepage = "http://www.browsercms.org" 
  spec.files += Dir["app/**/*"]
  spec.files += Dir["lib/bcms_sitemap.rb"]
  spec.files += Dir["lib/bcms_sitemap/*"]
  spec.files += Dir["rails/init.rb"]
  spec.files += Dir["config/*"]
  spec.has_rdoc = true
  spec.extra_rdoc_files = ["README"]
end
