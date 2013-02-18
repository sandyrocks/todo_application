// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require bootstrap-datepicker/core
//= require bootstrap-datepicker/locales/bootstrap-datepicker.es
//= require bootstrap-datepicker/locales/bootstrap-datepicker.fr

/*
$.ajax({
type: "POST",
url: url,
data: data,
success: success,
dataType: dataType
});
*/

/*
$(function() {
	$('#categories_category_id').change(function(){
		//var category_id=$(this).val();
		$.ajax({
			type: 'GET',
			url: 'tasks.js',
			success: function(response) {
				alert(response);
                    				
			}
		});
		
	});
		$('#categories_category_id').change(function(){
		$.ajax('tasks.js',
			{
			data: { category_id: $('#categories_category_id').val() },
			success: function(response){ $('#tasks').html(response); }
		})
	})
});
*/

$(document).ready(function(){
            $('.categories_category_id').click(function(e){

            var category_id=e.target.id;
            $.ajax('tasks.js',
			{
			data: { category_id:category_id },
			success: function(response){ $('#tasks').html(response); }
		})
            });
	$(document).on("focus", "#task_datepicker", function(e){
     $('#task_datepicker').datepicker({"format": "yyyy-mm-dd", "weekStart": 1, "autoclose": true});
    });
    $(document).on("focus", "#task_endDate", function(e){
     $('#task_endDate').datepicker({"format": "yyyy-mm-dd", "weekStart": 1, "autoclose": true});
    });
});



