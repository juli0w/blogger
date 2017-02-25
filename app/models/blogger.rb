class Blogger < ApplicationRecord
  belongs_to :user
  has_many :articles, through: :user

  DEFAULT_TITLE = "Blog"
  DEFAULT_SLUG = "blog-"

  def self.random_slug
    DEFAULT_SLUG + [*('a'..'z'),*('0'..'9')].shuffle[0,8].join
  end

  def owner? current_user
    user == current_user
  end

  def to_param
    self.slug
  end
end
