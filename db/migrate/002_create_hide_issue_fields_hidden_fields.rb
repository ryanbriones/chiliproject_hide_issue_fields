class CreateHideIssueFieldsHiddenFields < ActiveRecord::Migration
  def self.up
    create_table :hide_issue_fields_hidden_fields do |t|
      t.integer :project_id, :null => false
      t.integer :tracker_id, :null => false
      t.integer :finder_id, :null => false
    end
  end

  def self.down
    drop_table :hide_issue_fields_hidden_fields
  end
end
