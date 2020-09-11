class Recruit < ApplicationRecord
  has_many :recruit_tag_relations
  has_many :tags, through: :recruit_tag_relations
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :contact
  belongs_to_active_hash :style
  belongs_to_active_hash :sex
  has_secure_password
end
