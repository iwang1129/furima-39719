class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
# :validatable＝emailとパスワードを記述している。バリデーションが不要
         has_many :items
         has_many :orders

         
         validates :nickname, presence: true
         validates :family_name, presence: true
         validates :first_name, presence: true
         validates :family_name_kana, presence: true
         validates :first_name_kana, presence: true
         validates :birth_day, presence: true
         
         # お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること。
         validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: "は全角で入力してください" }
         validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: "は全角で入力してください" }

         # お名前カナ(全角)は、全角（カタカナ）での入力が必須であること。
         validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力してください" }
         validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力してください" }
end

# バリエーションを変更したいときは、rails db:migrate:statusでstatusを確認して、変更したい箇所まで、rails db:rollbackして、
# statusがdownになっている状態で変更する。
