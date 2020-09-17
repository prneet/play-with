class Recruit < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :contact
  belongs_to_active_hash :style
  belongs_to_active_hash :sex
  has_many :recruit_tag_relations
  has_many :tags, through: :recruit_tag_relations
  has_secure_password

  HALF_NUMBER_REGEX = /\A[0-9]+\z/.freeze

  with_options presence: true do
    validates :name
    validates :player_name
    validates :text
    validates :password, format: { with: HALF_NUMBER_REGEX, message: "半角数字"}
  end
end

