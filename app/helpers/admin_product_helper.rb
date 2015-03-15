module AdminProductHelper
  def categories_options_tag(option_selected=[])
    options_for_select(Category.all.each_with_index.map{|value, index| [value.title, value.id] }, option_selected)
  end
end
