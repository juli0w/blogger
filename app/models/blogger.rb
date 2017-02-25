class Blogger < ApplicationRecord
  belongs_to :user
  has_many :articles, through: :user

  DEFAULT_TITLE = "Blog"
  DEFAULT_SLUG = "blog-"

  def self.random_slug
    DEFAULT_SLUG + [*('a'..'z'),*('0'..'9')].shuffle[0,8].join
  end
end
