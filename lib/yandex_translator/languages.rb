require 'json'
require 'net/http'

module Languages

  METHOD = 'getLangs'
  DEFAULT_LANG = :en

  def self.get_languages(lang)
    request_params = {
      ui: lang,
      key:  YandexTranslator::Api.key
    }
    query = URI.encode_www_form(request_params)
    uri = URI("#{YandexTranslator::Api::BASE_URI}#{METHOD}?#{query}")
    response = JSON.parse(Net::HTTP.get(uri))
    response["code"].nil? ? response["langs"] : response
  end

end