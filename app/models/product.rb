# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  sku         :string
#  hashid      :string
#  position    :integer
#  state       :string
#  content     :jsonb
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  catalog_id  :integer
#

class Product < ActiveRecord::Base
  belongs_to :category
end
