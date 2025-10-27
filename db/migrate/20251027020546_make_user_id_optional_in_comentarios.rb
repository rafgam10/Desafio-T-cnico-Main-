class MakeUserIdOptionalInComentarios < ActiveRecord::Migration[8.1]
  def change
    change_column_null :comentarios, :user_id, true
  end
end
