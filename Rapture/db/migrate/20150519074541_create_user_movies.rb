class CreateUserMovies < ActiveRecord::Migration
  def change
    create_table :user_movies do |t|
      t.integer :movie_id
      t.integer :user_id
      t.boolean :is_seen

      t.timestamps null: false
    end
  end
end
