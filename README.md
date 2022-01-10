# convert-fead
Оформлено в виде gem. 

## Установка
Версия ruby-2.7.1

```ruby
git clone git@github.com:IgorKorp/convert-fead.git
cd convert-fead
bundle install
gem build convert_fead.gemspec
gem install convert-feed-0.1.0.gem
```

## Пример использования:
```bash
convert-feed -h 


convert-feed -f json  -s asc  https://ru.hexlet.io/lessons.rss
```
