class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders
  has_many :comments

  VALID_PASSWORD_REGEX  = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/
  VALID_NAME_REGEX      = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  VALID_KANA_NAME_REGEX = /\A[ァ-ヶー]+\z/

  with_options presence: true do
    validates :nickname
    validates :date_of_birth
    validates :last_name,       format: { with: VALID_NAME_REGEX      }
    validates :first_name,      format: { with: VALID_NAME_REGEX      }
    validates :kana_last_name,  format: { with: VALID_KANA_NAME_REGEX }
    validates :kana_first_name, format: { with: VALID_KANA_NAME_REGEX }
  end

  validates :password, format: { with: VALID_PASSWORD_REGEX }
end
