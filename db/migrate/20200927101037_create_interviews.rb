class CreateInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews do |t|
      t.integer :interviewerid
      t.integer :intervieweeid
      t.datetime :start_t
      t.datetime :end_t

      t.timestamps
    end
  end
end
