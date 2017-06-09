require "spec_helper"

API_KEY = "trnsl.1.1.20170607T193617Z.478755f97626702e.e47a80b271bc5f68e91383b66f84b0561afcf8e1"

RSpec.describe YandexTranslator do

  before :each do
    YandexTranslator::Api.conf do |params|
      params.api_key = "trnsl.1.1.20170607T193617Z.478755f97626702e.e47a80b271bc5f68e91383b66f84b0561afcf8e1"
    end
  end

  it "has a version number" do
    expect(YandexTranslator::VERSION).not_to be nil
  end

  it "get key" do
    key = YandexTranslator::Api.key
    expect(key).to eq("trnsl.1.1.20170607T193617Z.478755f97626702e.e47a80b271bc5f68e91383b66f84b0561afcf8e1")
  end

  it "list of supported languages" do
    language = YandexTranslator::Api.define_language(text: 'привет')
    expect(language).to eq("ru")
  end

  it "translation without language indication" do
    translation = YandexTranslator::Api.translate(text: 'всем привет')
    expect(translation).to eq("Hello")
  end

  it "translation with language" do
    translation = YandexTranslator::Api.translate(text: 'всем привет', lang: :fr)
    expect(translation).to eq("bonjour à tous")
  end

  it "all languages" do
    languages = YandexTranslator::Api.languages
    expect(languages).to be_a(Hash)
    expect(languages).to_not be_empty
  end
end
