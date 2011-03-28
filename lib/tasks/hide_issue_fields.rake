namespace :hide_issue_fields do
  desc "Populate Hide Issue Fields with Standard Redmine Fields"
  task :standard_fields => :environment do
    fields = {
      "Parent task" => %q{$("parent_issue")},
      "Description" => %q{$("issue_description").up("p")},
      "Assignee" => %q{$("issue_assigned_to_id").up("p")},
      "Start date" => %q{$("issue_start_date").up("p")},
      "Due date" => %q{$("issue_due_date").up("p")},
      "Estimated time" => %q{$("issue_estimated_hours").up("p")},
      "% Done" => %q{$("issue_done_ratio").up("p")},
      "Files" => %q{$("attachments_form")},
      "Watchers List" => %q{$("watchers_form")},
    }

    fields.each do |name, finder|
      db_finder = HideIssueFields::Finder.find_by_name(name)
      unless db_finder
        db_finder = HideIssueFields::Finder.create(:name => name, :finder => finder)
      end

      puts "#{db_finder.name}: #{db_finder.finder}"
    end
  end
end
