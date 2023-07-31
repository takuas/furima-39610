class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX  = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/
  VALID_NAME_REGEX      = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  VALID_KANA_NAME_REGEX = /\A[ァ-ヶー]+\z/

  validates :nickname,           presence: true
  validates :password,           format: { with: VALID_PASSWORD_REGEX  }
  validates :last_name,          presence: true, format: { with: VALID_NAME_REGEX      }
  validates :first_name,         presence: true, format: { with: VALID_NAME_REGEX      }
  validates :kana_last_name,     presence: true, format: { with: VALID_KANA_NAME_REGEX }
  validates :kana_first_name,    presence: true, format: { with: VALID_KANA_NAME_REGEX }
  validates :date_of_birth,      presence: true
end
