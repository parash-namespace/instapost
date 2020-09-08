class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.references :follower, foreign_key: {to_table: :users}
      t.references :following, foreign_key: {to_table: :users}
    end
  end
end
