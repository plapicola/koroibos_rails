class Sport < ApplicationRecord
   has_many :olympians
   has_many :events
end
