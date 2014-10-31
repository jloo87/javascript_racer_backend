class CreateGame < ActiveRecord::Migration
  def change

    create_table :games do |t|
      t.string :winner_id
      t.string :loser_id
      t.string :win_time

      t.timestamp
    end
  end
end
