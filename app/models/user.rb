class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
# :validatable＝emailとパスワードを記述している。バリデーションが不要
         has_many :items
         has_many :orders

         validates :email, presence: true
         validates :nickname, presence: true
         validates :encrypted_password, presence: true
         validates :family_name, presence: true
         validates :first_name, presence: true
         validates :family_name_kana, presence: true
         validates :first_name_kana, presence: true
         validates :birth_day, presence: true
         
end
