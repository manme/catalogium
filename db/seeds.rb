# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Account.create(email: 'admin@admin.com', password: '123')

# menu

page = Page.create(title: 'Главная', page_type: Page::FIXED_TYPE, slug: 'pages')
TopMenu.create(name: 'Главная', page_id: page.id, state: TopMenu::ACTIVE)

page = Page.create(title: 'Каталог', page_type: Page::EMPTY_TYPE, slug: 'catalog')
TopMenu.create(name: 'Каталог', page_id: page.id, state: TopMenu::ACTIVE)

page = Page.create(title: 'Контакты', page_type: Page::EDITABLE_TYPE, slug: 'contacts')
TopMenu.create(name: 'Контакты', page_id: page.id, state: TopMenu::ACTIVE)

# SIBVELO

c = Category.create(title: 'Горные велосипеды')
MenuCategory.create(category: c, position: 1, state: MenuCategory::ACTIVE)

c = Category.create(title: 'Экстримальные велосипеды')
MenuCategory.create(category: c, position: 2, state: MenuCategory::ACTIVE)

c = Category.create(title: 'Женские велосипеды')
MenuCategory.create(category: c, position: 3, state: MenuCategory::ACTIVE)

c = Category.create(title: 'Дорожные и шоссейные')
MenuCategory.create(category: c, position: 4, state: MenuCategory::ACTIVE)

c = Category.create(title: 'Детские и подростковые')
MenuCategory.create(category: c, position: 5, state: MenuCategory::ACTIVE)

c = Category.create(title: 'BMX')
MenuCategory.create(category: c, position: 6, state: MenuCategory::ACTIVE)


