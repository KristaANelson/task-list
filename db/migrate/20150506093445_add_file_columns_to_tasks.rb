class AddFileColumnsToTasks < ActiveRecord::Migration
  def self.up
   add_attachment :tasks, :file
 end

 def self.down
   remove_attachment :tasks, :file
 end
end
