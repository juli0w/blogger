class Article < ActiveRecord::Base
  acts_as_taggable

  belongs_to :user
  has_many :comments

  mount_uploader :cover, CoverUploader

  def to_param
    "#{id}-#{name}".parameterize
  end
end
