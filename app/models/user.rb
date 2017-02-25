class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :articles
  has_one :blogger, dependent: :destroy
  after_create :setup_blog

private

  def setup_blog
    self.create_blogger(title: Blogger::DEFAULT_TITLE, slug: Blogger.random_slug)
  end
end
