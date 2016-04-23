class Post < ActiveRecord::Base
    validates_presence_of :content
    belongs_to :author,foreign_key: "user_id",  class_name: "User"
    has_many :comments 
    has_many :commenters,source: :user, through: :comments

    def comments_attributes=(comment)
      if comment['0']['content'] != ""
        @comment = Comment.new(user_id: comment['0']['user_id'], content: comment['0']['content'])
        self.comments << @comment
        @comment.save
      end
    end
end
