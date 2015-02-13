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
#

require 'test_helper'

class CatalogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
