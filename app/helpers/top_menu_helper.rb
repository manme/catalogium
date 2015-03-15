module TopMenuHelper
  def top_menu_path(item)
    return "/pages/#{item.page.slug}" if item.page.page_type == Page::EDITABLE_TYPE
    return "/#{item.page.slug}" if item.page.slug.first != '/'
    return item.page.slug
  end
end
