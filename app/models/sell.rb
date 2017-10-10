class Sell < ApplicationRecord
  include Fae::BaseModelConcern

  belongs_to :discount
  belongs_to :client

  has_many :sell_products
  has_many :products, through: :sell_products, dependent: :destroy

  has_many :sell_services
  has_many :services, through: :sell_services, dependent: :destroy

  validates :client, presence: true
  enum status: { open: 0, finished: 1, canceled: 2 }

  before_save :set_total

  def fae_display_field
    id
  end

  def self.for_fae_index
    order(:id)
  end

  private

  def set_total
    total = 0
    self.products.each {|p| total += p.price }
    self.services.each {|s| total += s.price }

    if self.discount.present?
      total = total - self.discount.value
    end

    total = (total >= 0)? total : 0
    self.total = total
  end

end
