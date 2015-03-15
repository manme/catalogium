# == Schema Information
#
# Table name: product_templates
#
#  id                         :integer          not null, primary key
#  name                       :string
#  product_template_option_id :integer
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#

class ProductTemplate < ActiveRecord::Base
  has_many :product_template_options
end
