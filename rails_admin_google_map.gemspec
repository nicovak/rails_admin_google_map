$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'rails_admin_google_map/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'rails_admin_google_map'
  s.version     = RailsAdminGoogleMap::VERSION
  s.authors     = ['KOVACS Nicolas']
  s.email       = ['pro.nkovacs@gmail.com']
  s.homepage    = 'http://www.nicovak.github.io'
  s.summary     = 'Easy implentation of google map adress field in rails_admin'
  s.description = 'Easy implentation of google map adress field in rails_admin'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', ['>= 4.0', '< 6']
end
