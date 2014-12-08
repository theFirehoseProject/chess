class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :games, foreign_key: "user_id"
  has_many :games, foreign_key: "player_2"

  def name
  	self.email	
  end
end
