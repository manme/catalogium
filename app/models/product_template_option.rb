# == Schema Information
#
# Table name: product_template_options
#
#  id                  :integer          not null, primary key
#  name                :string
#  type                :string
#  options             :jsonb
#  default             :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  product_template_id :integer
#

class ProductTemplateOption < ActiveRecord::Base
  belongs_to :product_template
end
