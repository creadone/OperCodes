Как это запустить:

1. Клонировать репозиторий: <code>git clone https://github.com/creadone/OperCodes.git</code>
2. Установить полезные гемы: <code>bundle install</code>
4. Запустить загрузку данных: <code>ruby downloader.rb</code>
5. Запустить парсинг данных: <code>ruby parser.rb</code>
6. Запустить сервис: <code>rackup</code>
7. Сходить по ссылке: <code>http://localhost:9292/api/v1/code/get_provider/?number=9151234567</code>, где 9151234567 — номер мобильного телефона.
8. Если все хорошо, то в ответ вернется что-то в духе:
<code><pre>
    [
      915,
      0,
      4999999,
      5000000,
      "Мобильные ТелеСистемы",
      "Москва и Московская область ",
      null,
      null,
      null
    ]
</pre></code>
