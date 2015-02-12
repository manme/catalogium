# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Account.create(email: 'admin@admin.com', password: '123')

page = Page.create(title: 'Главная', page_type: Page::FIXED_TYPE, slug: 'pages/index')
TopMenu.create(name: 'Главная', page_id: page.id)

page = Page.create(title: 'Каталог', page_type: Page::EMPTY_TYPE, slug: 'catalog')
TopMenu.create(name: 'Каталог', page_id: page.id)
