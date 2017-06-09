class YandexTranslator < Rails::Generators::Base
  source_root(File.expand_path(File.dirname(__FILE__))

  def copy_initializer
    copy_file 'yandex_translator_credentials.rb', 'config/initializers/yandex_translator.rb'
  end
end