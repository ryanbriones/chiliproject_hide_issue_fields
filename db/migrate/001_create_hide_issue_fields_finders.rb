class CreateHideIssueFieldsFinders < ActiveRecord::Migration
  def self.up
    create_table :hide_issue_fields_finders do |t|
      t.string :name, :null => false
      t.string :finder, :null => false
    end
  end

  def self.down
    drop_table :hide_issue_fields_finders
  end
end
