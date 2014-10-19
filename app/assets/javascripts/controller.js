app.controller('TaskCtrl', ['$scope', '$filter', '$http', 'Task', 'Label', function($scope, $filter, $http, Task, Label) {
	$scope.tasks = Task.all();
	$scope.labels = Label.all();

	$scope.deleteTask = function(Taskid, idx){
		if(confirm('Are you sure')){
			Task.delete(Taskid);
			$scope.tasks.splice(idx, 1);
		}
	};

	$scope.createTask = function(){
		var attr = {};
		attr.name = $scope.new_task_name;
		attr.label_ids = get_check_value_of('#addNewTask');		
		$scope.increase_label_cnt(attr.label_ids);
		var new_task = Task.create(attr);
		$scope.tasks.push(new_task);
		$scope.new_task_name = '';
		$('#addNewTask').modal('hide')
	};

	$scope.editTask = function(){
		var editedTask = Task.edit($scope.editableTask);
		$scope.tasks[$scope.editableTaskIndex] = $scope.editableTask
		$('#editTask').modal('hide')
	};

	$scope.getEditTask = function(idx){
		$scope.editableTask = angular.copy($scope.tasks[idx]);
		$scope.editableTaskIndex = idx;
	};

	$scope.get_label = function(id){
		for(i=0;i<$scope.labels.length;i++){
			label = $scope.labels[i];
			if(label.id==id){
				return label
			}
		}
	};

	$scope.increase_label_cnt = function(label_ids){
		// increase the label count
		$.each($scope.labels, function(i){
			label = $scope.labels[i]
			if($.inArray(label.id, label_ids)){
				label.task_count += 1
			}
		})
	}
}]);