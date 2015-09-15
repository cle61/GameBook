class CreateProfiles < ActiveRecord::Migration
  def change
    create_table(:profiles) do |t|
      t.belongs_to :user, index: true

      t.string :avatar

      t.timestamps
    end

  end
end
