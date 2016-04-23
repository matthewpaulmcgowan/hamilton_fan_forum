class User < ActiveRecord::Base
    has_many :authored_posts, foreign_key: "user_id", class_name: "Post" 
    has_many :comments 
    has_many :comment_posts,source: :post, through: :comments
    has_secure_password
    validates_presence_of :username 
    #validates_uniqueness_of :username
    
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

end
