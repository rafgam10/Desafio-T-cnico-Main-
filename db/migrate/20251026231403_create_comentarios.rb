class CreateComentarios < ActiveRecord::Migration[8.1]
  def change
    create_table :comentarios do |t|
      t.string :nome
      t.text :conteudo
      t.references :user, null: false, foreign_key: true
      t.references :filme, null: false, foreign_key: true

      t.timestamps
    end
  end
end
