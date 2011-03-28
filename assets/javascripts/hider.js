document.observe("dom:loaded", function() {
    $$("span.hide_issue_fields_hidden_field").each(function(span) {
	var el = eval(span.innerHTML);
	if(el) el.hide();
    });
});

Ajax.Responders.register({
    onComplete: function () {
	$$("span.hide_issue_fields_hidden_field").each(function(span) {
	    var el = eval(span.innerHTML);
	    if(el) el.hide();
	});
    },
    
    onCreate: function() {
	$$("span.hide_issue_fields_hidden_field").each(function(span) {
	    var el = eval(span.innerHTML);
	    if(el) el.show();
	});
    }
})
