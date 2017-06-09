require 'json'
require 'net/http'

module Translate

  METHOD = 'translate'
  DEFAULT_LANG = :en

  def self.get_translate(text, lang)
    request_params = {
      text: text,
      lang: lang,
      options: 1,
      key:  YandexTranslator::Api.key
    }
    query = URI.encode_www_form(request_params)
    uri = URI("#{YandexTranslator::Api::BASE_URI}#{METHOD}?#{query}")
    response = JSON.parse(Net::HTTP.get(uri))
    response["code"] == 200 ? response["text"].join("\n") : response
  end

end