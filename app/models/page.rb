# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :text
#  slug       :string
#  state      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Page < ActiveRecord::Base
  include Bootsy::Container

  has_one :top_menu

  validates :title, presence: true
  validates :slug, presence: true
end
