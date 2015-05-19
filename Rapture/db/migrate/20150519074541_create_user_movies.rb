class CreateUserMovies < ActiveRecord::Migration
  def change
    create_table :user_movies do |t|
      t.string :movie_id
      t.boolean :is_seen

      t.timestamps null: false
    end
  end
end
