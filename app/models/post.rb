class Post < ActiveRecord::Base
  scope :created_in, ->(year) { where( "YEAR( created_at ) = ?", year ) }
end
