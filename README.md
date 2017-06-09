# YandexTranslator

Яндекс переводчик

## Установка

Добавьте эту строку в Gemfile вашего приложения:

```ruby
gem 'yandex_translator', github: 'sidorenko1986pa/yandex_translator'
```

А затем выполните:

    $ bundle

Или установите его самостоятельно как:

    $ gem install 'yandex_translator', github: 'sidorenko1986pa/yandex_translator'

Сгенерируйте файл конфига

    $ rails generate yandex_translator:install
    
## Примечание

Получите api_key из https://tech.yandex.ru/keys/get/?service=trnsl.

## Конфигурация

```sh
YandexTranslator::Api.conf do |params|
 params.api_key = "" # yandex translator api key
end
```

## Работа

## key
Получить api key установленный в файле конфигурации

```sh
$ YandexTranslator::Api.key
```

## languages
Получить доступные языки для перевода

```sh
YandexTranslator::Api.languages
```

## define_language
Определить язык
```sh
YandexTranslator::Api.define_language(text: 'привет')
```

## translate
Перевод текста

```sh
YandexTranslator::Api.translate(text: 'всем привет', lang: :fr)
```

> Если параметр lang не указан, то по умолчанию переводиться на английский язык

## Содействие

Отчеты об ошибках и запросы на улучшения гема приветствуются на GitHub в https://github.com/sidorenko1986pa/yandex_translator

## Лиценщия

Гем доступен как открытый источник в соответствии с условиями [MIT License](http://opensource.org/licenses/MIT).

