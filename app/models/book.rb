class Book < ApplicationRecord
  belongs_to :author
  belongs_to :title

  def for(author, title)
    author = Author.find_or_create_by(name: author)
    title = Title.find_or_create_by(name: title)
    find_or_create_by(author: author, title: title)
  end

  def to_s
    "#{author.name} - #{title.name}"
  end
end
