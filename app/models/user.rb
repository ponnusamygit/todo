class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  acts_as_tagger
          
  has_and_belongs_to_many :tags, class_name: ActsAsTaggableOn::Tag
  
  ActsAsTaggableOn::Tag.send(:has_and_belongs_to_many, :users)
  
end

class ActsAsTaggableOn::Tagging
  after_create :create_user_tag
  
  def create_user_tag
    if tag_id && tagger_id
      connection.execute("INSERT INTO 'tags_users' ('tag_id','user_id') VALUES (#{tag_id},#{tagger_id})")  
    end
  end
end