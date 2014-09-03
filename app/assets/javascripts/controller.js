app.controller('TaskCtrl', ['$scope', '$filter', '$http', 'Task', function($scope, $filter, $http, Task) {
	$scope.tasks = Task.all();

	$scope.deleteTask = function(Taskid, idx){
		Task.delete(Taskid);
		$scope.tasks.splice(idx, 1);
	};

	$scope.createTask = function(){
		var attr = {
			name: $scope.new_task_name,			
		}
		var new_task = Task.create(attr);
		$scope.tasks.push(new_task);
		$scope.new_task_name = '';
		$('#addNewTask').modal('hide')
	};

	$scope.editTask = function(){
		var editedTask = Task.edit($scope.editableTask);
		$scope.tasks[$scope.editableTaskIndex] = editedTask
		$('#editTask').modal('hide')
	};

	$scope.getEditTask = function(idx){
		$scope.editableTask = $scope.tasks[idx];
		$scope.editableTaskIndex = idx;
	};
}]);