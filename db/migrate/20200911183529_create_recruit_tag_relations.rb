class CreateRecruitTagRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :recruit_tag_relations do |t|

      t.timestamps
    end
  end
end
