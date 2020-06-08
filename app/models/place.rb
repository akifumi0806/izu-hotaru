class Place < ApplicationRecord
	belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :admin
	attachment :image
	# enum area: {三島沼津: 0, 中伊豆: 1, 西伊豆: 2, 東伊豆: 3, 南伊豆: 4}

	# 存在性のバリデーション
  # validates :latitude, presence: true
  # validates :longitude, presence: true
  validates :address, presence: true   

  # バリデーションの前に送信されたaddressの値によってジオコーディング(緯度経度の算出)を行う
  geocoded_by :address
  before_validation :geocode

  self.inheritance_column = :_type_disabled #typeというカラムを使用しているためこの一行を追加することによりtypeのカラム名が有効になる
end
