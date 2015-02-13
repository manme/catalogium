module LayoutHelper
  def render_flash
    flash.map do |key, value|
      key = :success if key == :notice
      content_tag(:div, value, class: "ui message #{key}")
    end.join.html_safe
  end
end
