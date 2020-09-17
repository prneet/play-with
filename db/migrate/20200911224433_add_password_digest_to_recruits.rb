class AddPasswordDigestToRecruits < ActiveRecord::Migration[6.0]
  def change
    add_column :recruits, :password_digest, :string
  end
end
