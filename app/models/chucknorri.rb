class Chucknorri < ApplicationRecord
    validates :joke, uniqueness: true
end
