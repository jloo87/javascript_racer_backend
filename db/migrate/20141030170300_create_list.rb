class CreateList < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.integer :player1_id
      t.integer :player2_id
      t.integer :game_id


      t.timestamp
    end

  end
end
