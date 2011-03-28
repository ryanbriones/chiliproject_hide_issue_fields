function hide_issue_fields_connect_move_buttons() {
  $$(".hide_issue_fields_move_right").invoke("observe", "click", function(e) {
    moveOptions(this.form.hidden_fields_available_selections, this.form.hidden_fields_to_hide);
  });
  
  $$(".hide_issue_fields_move_left").invoke("observe", "click", function(e) {
    moveOptions(this.form.hidden_fields_to_hide, this.form.hidden_fields_available_selections);
  });
}

document.observe("dom:loaded", function(e) {
  $("hide_issue_fields_settings_tracker_picker").observe("change", function(e) {
    if(this.getValue() == "") {
      $("fields_for_tracker").update("");
      return;
    }

    new Ajax.Request(this.getValue(), {
      method: "get",
      onSuccess: function(response) {
        $("fields_for_tracker").update(response.responseText);
        hide_issue_fields_connect_move_buttons();
      }
    })
  });
});
