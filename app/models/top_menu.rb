# == Schema Information
#
# Table name: top_menus
#
#  id         :integer          not null, primary key
#  name       :string
#  position   :integer
#  page_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  state      :string
#

class TopMenu < ActiveRecord::Base
  acts_as_list

  belongs_to :page, dependent: :destroy

  validates :name, presence: true

  ACTIVE = 'active'
  HIDDEN = 'hidden'

  default_scope { order(:position) }
  scope :active, -> { where(state: ACTIVE) }
end
