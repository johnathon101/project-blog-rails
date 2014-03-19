class User < ActiveRecord::Base
  attr_accessible :auth, :email, :location, :mood_pref, :name, :phraseofpass
end
