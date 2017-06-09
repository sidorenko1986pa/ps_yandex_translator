require 'json'
require 'net/http'

module Detect

  METHOD = 'detect'

  def self.get_langs(text)
    request_params = {
      text: text,
      key:  YandexTranslator::Api.key
    }
    query = URI.encode_www_form(request_params)
    uri = URI("#{YandexTranslator::Api::BASE_URI}#{METHOD}?#{query}")
    response = JSON.parse(Net::HTTP.get(uri))
    response["code"] == 200 ? response["lang"] : response
  end

end