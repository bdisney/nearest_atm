# README

Тестовое приложение по поиску ближайших от заданных координат объектов.
Результат поиска отсортирован по расстоянию. Сторонние гемы по геолокации не используются.
Перед установкой заменить database.sample.yml на database.yml

```ruby
bundle install
bundle exec rake db:create
bundle exec rake db:migrate
```    

Для наполнения бд тестовыми данными, запустить задачу:

```ruby
bundle exec rake atms_with_locations:seed
```   

Она создаст тысячу объектов atm связанных с locations.