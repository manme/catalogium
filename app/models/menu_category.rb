# == Schema Information
#
# Table name: menu_categories
#
#  id          :integer          not null, primary key
#  category_id :integer
#  position    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class MenuCategory < ActiveRecord::Base
  belongs_to :category, dependent: :destroy

  ACTIVE = 'active'
  HIDDEN = 'hidden'

  default_scope { order(:position) }
  scope :active, -> { where(state: ACTIVE) }
end
