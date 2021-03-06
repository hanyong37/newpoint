class Product < ApplicationRecord
  validates :name, :limit, :status, :photo, presence: true

  default_scope {order(created_at: :desc)}
  scope :shop_view, ->{unscoped.where.not(status:'hidden').where.not(status: 'archived').order(view_priority: :asc)}

  enum status: {
    hot: 3,
    fresh: 2,
    active: 1,
    hidden: 0,
    archived: -1}

  belongs_to :category
  has_many :lineitems, dependent: :restrict_with_error

  mount_uploader :photo, PhotoUploader

  def price_int
    ('%.2f' % self.price).to_s.split('.')[0]
  end

  def price_cent
    ('%.2f' % self.price).to_s.split('.')[1]
  end

end
