class AddIndexForEventsOnSchedule < ActiveRecord::Migration[7.1]
  def change
    add_index :events, :schedule
  end
end
