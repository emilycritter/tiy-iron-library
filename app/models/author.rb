class Author < ActiveRecord::Base
  has_many :books, dependent: :destroy
  validates :first_name, :last_name, :bio, presence: true

  attachment :photo

  def full_name
    [first_name, last_name].join(" ")
  end

end
