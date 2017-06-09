require "yandex_translator/version"
require "yandex_translator/detect"
require "yandex_translator/translate"
require "yandex_translator/languages"

module YandexTranslator

  class Api

    BASE_URI = "https://translate.yandex.net/api/v1.5/tr.json/"

    attr_accessor :api_key

    def self.conf
      yield(@yandex_translator ||= YandexTranslator::Api.new)
      @api_key = @yandex_translator.api_key
    end

    def self.check_text(text)
      text || ''
    end

    def self.key
      @api_key
    end

    def self.define_language(params = {})
      text = check_text(params[:text])
      Detect.get_langs(text)
    end

    def self.translate(params = {})
      text = check_text(params[:text])
      lang = params[:lang] || Translate::DEFAULT_LANG
      Translate.get_translate(text, lang)
    end

    def self.languages(params = {})
      lang = params[:lang] || Languages::DEFAULT_LANG
      Languages.get_languages(lang)
    end

  end

end