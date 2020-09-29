class AddTypeToParticipants < ActiveRecord::Migration[5.1]
  def change
    add_column :participants, :type, :string
  end
end
