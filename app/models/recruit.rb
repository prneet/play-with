class Recruit < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :contact
  belongs_to_active_hash :style
  belongs_to_active_hash :sex
  has_many :recruit_tag_relations
  has_many :tags, through: :recruit_tag_relations, dependent: :destroy
  has_secure_password

  def self.search(search)
    if search != ""
      Recruit.where('name LIKE(?)', "%#{search}%")
    else
      Recruit.all
    end
  end
end