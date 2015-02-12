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
  validates :page_type, presence: true

  EDITABLE_TYPE = 'editable'
  FIXED_TYPE = 'fixed'
  EMPTY_TYPE = 'empty'

  before_validation :default_values
  def default_values
    self.page_type ||= EDITABLE_TYPE
  end

  def disabled? field

    return true if page_type == EMPTY_TYPE

    if page_type == FIXED_TYPE
      return true if field.to_sym == :title
      return true if field.to_sym == :slug
      return true if field.to_sym == :delete
    end

    false
  end
end
