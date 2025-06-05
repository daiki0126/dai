class CreateKudos < ActiveRecord::Migration[8.0]
  def change
    create_table :kudos do |t|
      t.timestamps
    end
  end
end
