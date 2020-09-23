class CreateRecruitTagRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :recruit_tag_relations do |t|
      t.references :recruit, foreign_key: true
      t.references :tag,     foreign_key: true
      t.timestamps
    end
  end
end
