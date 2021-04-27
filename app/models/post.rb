#post model
class Post < ApplicationRecord
    #each page is allowed two posts, this is for (will_paginate gem)
    self.per_page = 2

    #a post has an attached image
    has_one_attached:image
    # #a post has many comments, the post is in this association as commentables, and once a post is destroyed, all the comments associated with that posts are destroyed as well
    # has_many :comments, as: :commentable, dependent: :destroy

    # #a post has many likes
    # has_many :likes, dependent: :destroy
    #a post belongs to a user
    belongs_to :user

    #the caption for the post is required and should be of minimum length 3
    #validates :caption, presence: true, length: { minimum: 3 }
    #the image is also required
    #validates :image, presence: true
end

