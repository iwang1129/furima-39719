class OrderPayment
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :region_id, :city, :block, :building_name, :telephone_number, :token

  with_options presence: true do
    # orderモデルのバリデーション
    validates :user_id
    validates :item_id
    # paymentモデルのバリデーション
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :block
    validates :telephone_number, format: { with: /\A\d{10}$|^\d{11}\z/, message: 'is invalid' }
    validates :token
  end

  def save
    order = Order.create(user_id:, item_id:)

    payment = Payment.create(post_code:, region_id:, city:, block:,
                             telephone_number:, order_id: order.id)
  end
end
