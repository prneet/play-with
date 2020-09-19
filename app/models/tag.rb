class Tag < ApplicationRecord
  has_many :recruit_tag_relations
  has_many :recruits, through: :recruit_tag_relations

  validates :name, uniqueness: true
end