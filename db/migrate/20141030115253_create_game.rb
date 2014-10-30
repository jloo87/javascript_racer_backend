class CreateGame < ActiveRecord::Migration
  def change

    create_table :games do |t|
      t.string :name
      t.string :winner_name
      t.string :win_time

      t.timestamp
    end
  end
end
