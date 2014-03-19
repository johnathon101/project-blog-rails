class Post < ActiveRecord::Base
  attr_accessible :mood, :post, :title, :user_id
end
