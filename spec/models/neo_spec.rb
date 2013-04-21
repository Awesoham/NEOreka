# == Schema Information
#
# Table name: neos
#
#  id         :integer          not null, primary key
#  ra         :float
#  dec        :float
#  name       :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  magnitude  :integer
#  notes      :text
#  score      :integer
#

require 'spec_helper'

describe Neo do
	
end
