class User < ActiveRecord::Base
    has_many :duels
    has_many :authored_posts, foreign_key: "user_id", class_name: "Post"
    has_many :comments
    has_many :comment_posts,source: :post, through: :comments
    has_secure_password
    validates_presence_of :username
    validates_uniqueness_of :username
    validate :determine_dueling_ability, on: :create

    scope :viewed_hamilton, -> { where("viewed_hamilton > ?", 0) }

    def self.find_or_create_by_omniauth(auth_hash)
      oauth_nickname = auth_hash["info"]["nickname"]
      self.where(username: oauth_nickname).first_or_create do |user|
        user.password = SecureRandom.hex
      end
    end

    def self.all_with_posts
      self.all.select do |user|
        user.authored_posts != []
      end
    end

    def determine_dueling_ability
      set_dueling_ability = 0
      viewed_hamilton_multiplier = self.viewed_hamilton * 50
      set_dueling_ability += self.listened_to_soundtrack
      set_dueling_ability += viewed_hamilton_multiplier
      self.dueling_ability = set_dueling_ability
    end

    def update_dueling_ability(outcome)
      if outcome === "Lose"
        self.dueling_ability -= 1
        self.save
      elsif outcome === "Win"
        self.dueling_ability += 1
        self.save
      end
    end
    
end
