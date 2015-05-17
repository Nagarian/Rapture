class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.integer :id_film
      t.references :user, index: true
      t.boolean :seen

      t.timestamps null: false
    end
    add_foreign_key :films, :users
  end
end
