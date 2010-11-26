jQuery.ajaxSetup({ 
 	'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
});

jQuery.fn.submitWithAjax = function () {
	this.submit(function() {
		$.post($(this).attr("action"), $(this).serialize(), null, "script");
		return false;
	});
};

jQuery.fn.init_score_pane = function() {
  $(".btn").button();
	$("#show_add_wrestler_pane").click(function() {
		$("#add_wrestler_pane").dialog( {
		    modal: true,
		    draggable: false,
		    resizable: false
		  });
		return false;
	});
	
	$("#show_score_pane").click(function() {
	  $("#setup_pane").hide();
	  $("#score_pane").fadeIn('slow');
	  return false;
	});
	$("#hide_score_pane").click(function() {
	  $("#setup_pane").fadeIn('fast', null);
	  $("#score_pane").hide();
	  return false;
	});
	
	//setup buttonsets
	$(".red_btn").button().next().button();
	$(".btn_set").buttonset();
	
	$(".round_each").sortable();
	$(".round_each").disableSelection();
};

$(document).ready(function() {
	$("#ajax_new_wrestler").submitWithAjax();
	
	$("#setup_pane").init_score_pane();
	
	$("#listing").accordion();
	
	$(".report_selection").each(function() {
	  var wrestler_id = $(this).attr('name');
	  var team_id = $("#report_team_select option:selected").attr("value");
    $(this).attr("href", "/reports/"+team_id+"/"+wrestler_id);
	});
	$("#report_team_select").change(function() {
	  var team_id = $("#report_team_select option:selected").attr("value");
	  $("#report_selection_form").attr("action", "/reports/"+team_id).submit();
	});
});


