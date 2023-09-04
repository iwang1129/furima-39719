class Item < ApplicationRecord
  has_one    :order
  belongs_to :user
  has_one_attached :image
  
  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :situation_id, presence: true
  validates :load_id, presence: true
  validates :region_id, presence: true
  validates :shipping_id, presence: true
  validates :price, presence: true
  validates :image, presence: true
  

  # アクティブハッシュとのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :load
  belongs_to :region
  belongs_to :shipping
  


   #ジャンルの選択が「---」の時は保存できないようにする
   validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
   validates :situation_id, numericality: { other_than: 1 , message: "can't be blank"} 
   validates :load_id, numericality: { other_than: 1 , message: "can't be blank"}
   validates :region_id, numericality: { other_than: 1 , message: "can't be blank"}  
   validates :shipping_id, numericality: { other_than: 1 , message: "can't be blank"}  
   validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
    format: { with: /\A[0-9]+\z/, message: "can't be blank"}
end
