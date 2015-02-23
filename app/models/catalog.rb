# == Schema Information
#
# Table name: catalogs
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  slug        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  state       :string
#

class Catalog < ActiveRecord::Base
  has_many :products
end
