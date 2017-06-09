# YandexTranslator

Яндекс переводчик

## Установка

Добавьте эту строку в Gemfile вашего приложения:

```ruby
gem install yandex_translator
```

А затем выполните:

    $ bundle

Или установите его самостоятельно как:

    $ gem install yandex_translator

Сгенерируйте файл конфига

    $ rails generate yandex_translator:install
    
## Примечание

Получите api_key из https://tech.yandex.ru/keys/get/?service=trnsl.

## Конфигурация

YandexTranslator::Api.conf do |params|
  params.api_key = "" # yandex translator api key
end

## Работа

## key
Получить api key установленный в файле конфигурации
YandexTranslator::Api.key

## languages
Получить доступные языки для перевода
YandexTranslator::Api.languages

## define_language
Определить язык
YandexTranslator::Api.define_language(text: 'привет')

## translate
Перевод текста
YandexTranslator::Api.translate(text: 'всем привет', lang: :fr)
Если параметр lang не указан, то по умолчанию переводиться на английский язык

## Содействие

Отчеты об ошибках и запросы на улучшения гема приветствуются на GitHub в https://github.com/sidorenko1986pa/yandex_translator

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

