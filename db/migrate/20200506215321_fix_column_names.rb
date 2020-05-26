class FixColumnNames < ActiveRecord::Migration[6.0]
  def change
  	rename_column :barbers, :shortD, :short_description
  	rename_column :barbers, :fb, :facebook
  	rename_column :barbers, :tw, :twitter
  	rename_column :barbers, :ins, :instagram
  	rename_column :barbers, :phto, :photo_link
  end
end
