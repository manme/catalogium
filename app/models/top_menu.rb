# == Schema Information
#
# Table name: top_menus
#
#  id         :integer          not null, primary key
#  name       :string
#  page_type  :string
#  position   :integer
#  pages_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TopMenu < ActiveRecord::Base
  belongs_to :page, dependent: :destroy

  validates :name, presence: true
  validates :page_type, presence: true
end
