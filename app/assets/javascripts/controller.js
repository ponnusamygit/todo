app.controller('TaskCtrl', ['$scope', '$filter', '$http', 'Task', function($scope, $filter, $http, Task) {
	$scope.tasks = Task.all();

	$scope.deleteTask = function(Taskid, idx){
		Task.delete(Taskid)
		$scope.tasks.splice(idx, 1);
	}
}]);


// app.controller('TaskCtrl', ['$scope', '$filter', '$http', function($scope, $filter, $http) {
//   $scope.tasks = [
//   	{name: 'task1'},
//   	{name: 'task2'},
//   	{name: 'task13'},
//   	{name: 'task14'},
//   	{name: 'task15'}
//   ];
  
// }]);
