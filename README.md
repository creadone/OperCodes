Как с этим взлететь:

1. Клонировать репозиторий: <code>git clone https://github.com/creadone/OperCodes.git</code>
2. Установить полезные гемы: <code>bundle install</code>
3. Настроить все остальное: <code>rake install</code>
7. Сходить по ссылке: <code>http://localhost:9292/api/v1/code/get_provider/?number=9151234567</code>, где 9151234567 — номер мобильного телефона.
8. Если все хорошо, то в ответ вернется:
```json
{
        abcdef: 926,
        start: 0,
        end: 9999999,
        capacity: 10000000,
        provider: "МегаФон",
        city: "Москва и Московская область ",
        region: null,
        area: null,
        area1: null
}
```
