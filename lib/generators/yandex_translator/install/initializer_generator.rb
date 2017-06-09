class InitializerGenerator < Rails::Generators::Base
  source_root(File.expand_path(File.dirname(__FILE__))

  def copy_initializer
    copy_file 'conf.rb', 'config/initializers/yandex_translator.rb'
  end
end