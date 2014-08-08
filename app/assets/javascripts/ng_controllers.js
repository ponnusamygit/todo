// Define angular js app module
var taskBoard = angular.module('taskBoard', [])

// Define angular js controller for task
taskBoard.controller('TaskController', function($scope) {
		$scope.upcoming_title = 'Upcoming Tasks';    
	}  
)

