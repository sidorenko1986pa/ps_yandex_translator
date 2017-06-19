require "json"
require "net/http"
require "faraday"
require "yandex_translator/error"

module Connect

  BASE_URI = "https://translate.yandex.net/api/v1.5/tr.json/"

  def self.post(request_params, method, response_key)
    conn = Faraday.new(:url => BASE_URI)
    query = URI.encode_www_form(request_params.merge(key:  YandexTranslator::Api.key))
    begin
      response = JSON.parse(conn.post("#{method}", query).body)
    rescue
      raise Error, code: 503, message: "сервис недоступен"
    end
    if response["code"].nil? || response["code"] == 200
      response[response_key].kind_of?(Array) ? response[response_key].join("\n") : response[response_key]
    else
      raise Error, code: response["code"], message: response["message"]
    end

  end

end