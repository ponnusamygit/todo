// Taskboard application defined here
var app = angular.module('Taskboard', ['ngResource']);

// get Checked values
function get_check_value_of(ele){
	arrList = []
	$(ele+" input[name='options']:checked").map(
	  function(){
	    arrList.push($(this).val());
	  })
	return arrList
}