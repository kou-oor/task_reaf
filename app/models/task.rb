class Task < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  # validates :name, length: {minimum:30}
  validate :validate_name_not_including_comma


  # belongs_toはそのクラス(ここではTask)がある別のクラス(ここではUser)に従属しており、
  # 従属先のクラスのidを外部キーとして抱えていることを表しています。いわば、親分を指定するような感じ
  belongs_to :user

  # 変数にorderを入れたような感じ、これでいちいち書かなくてもrecentで書ける
  scope :recent, -> { order(created_at: :desc) }

  private
  def validate_name_not_including_comma
    errors.add(:name, 'にカンマを含めることはできません') if name&.include?(",")
  end
end
