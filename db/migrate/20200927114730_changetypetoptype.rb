class Changetypetoptype < ActiveRecord::Migration[5.1]
  def change
         rename_column :participants, :type, :ptype
  end
end
