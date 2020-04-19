class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table |t| do
      t.string name
      t.string email
      t.string 
    end
  end
end
