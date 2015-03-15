# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  state       :string
#  content     :jsonb
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  parent_id   :integer
#  category_id :integer
#

class Category < ActiveRecord::Base
  has_many :products
  has_one :menu_category

  validates :title, presence: true
end
