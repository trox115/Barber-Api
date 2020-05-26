class CreateBarbers < ActiveRecord::Migration[6.0]
  def change
    create_table :barbers do |t|
      t.string :name
      t.string :shortD
      t.string :fb
      t.string :tw
      t.string :ins
      t.string :phto
      t.string :description
      t.string :color

      t.timestamps
    end
  end
end
