class Product < ApplicationRecord
  validates :name, :price, :status, :photo, :stock, presence: true

  enum status: {
    hot: 3,
    fresh: 2,
    active: 1,
    hidden: 0,
    archived: -1}

  belongs_to :catagory

  mount_uploader :photo, PhotoUploader

  def price_int
    ('%.2f' % self.price).to_s.split('.')[0]
  end

  def price_cent
    ('%.2f' % self.price).to_s.split('.')[1]
  end

end
