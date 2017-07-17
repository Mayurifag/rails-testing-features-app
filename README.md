# README

Test app for myself and visitors. It's better not to use it in your projects.

Заполненные фильмы показываются по убыванию, в зависимости от даты мировой премьеры.
Частично реализован парсинг расписания кинотеатра «Mori cinema» в г. Сыктывкаре (https://mori-cinema.ru/cinema_detail/4768_mori_sinema/schedule.php) при помощи парсинга базы кинопоиска.

### TODO:

- [ ] Mori cinema 2D, 3D, timings, view, controllers, etc
- [ ] Other cinema in da city
- [ ] Friendly id
- [ ] simple_form
- [ ] paperclip+multipart in new movies for uploading pictures
- [ ] smth called design in modern times (bootstrap improvements, other frameworks possibly) || «new movie» page
- [x] stylesheets refactor
- [ ] validations
- [ ] SQL guarding (?)
- [ ] datepicker + strftime on premieres world & ru all pages
- [x] new/delete/edit
- [ ] devise + cancancan // sorcery // active admin
- [ ] change favicon
- [ ] rewrite parse_cinema.rake
- [ ] refactor routes.rb
- [ ] russian locale
- [ ] fully controllers refactoring
- [ ] smth w/ database.yml and configs
- [ ] static pages (about, contact, etc)
- [ ] smart listing gem?
- [ ] rescues add
