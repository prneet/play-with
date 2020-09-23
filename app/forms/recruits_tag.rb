class RecruitsTag

  include ActiveModel::Model
  attr_accessor :name, :contact_id, :player_name, :style_id, :sex_id, :text, :tag_name, :password

  HALF_NUMBER_REGEX = /\A[0-9]+\z/.freeze
  with_options presence: true do
    validates :name
    validates :player_name
    validates :text
    validates :tag_name
    validates :password, format: { with: HALF_NUMBER_REGEX, message: "半角数字"}
  end

  def save
    recruit = Recruit.create(name: name, contact_id: contact_id, player_name: player_name,style_id: style_id,
      sex_id: sex_id, text: text, password: password)
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save

    RecruitTagRelation.create(recruit_id: recruit.id, tag_id: tag.id)
  end
end