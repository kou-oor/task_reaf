class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  # has_manyはUserのidを外部キーとして抱えるような他のクラス(ここではTask)があり、
  # そのレコードが複数登録可能であることを表している
  has_many :tasks
end

