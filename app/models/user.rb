class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :games
  
  # look at below line
  has_many :challenged_games, foreign_key: "opponent_id", :class_name => Game

  #scope :all_games, -> { where("user_id = ? OR opponent_id = ?", self.id, self.id) }
  #scope :red, lambda {where("user_id = ? OR opponent_id = ?", self.id, self.id)}



  def all_games
  	Game.where("user_id = ? OR opponent_id = ?", self.id, self.id)
  end

  def name
  	self.email	
  end
end
