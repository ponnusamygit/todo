app.controller('TaskCtrl', ['$scope', '$filter', '$http', 'Task', 'Label', function($scope, $filter, $http, Task, Label) {
	$scope.tasks = Task.all();
	$scope.labels = Label.all();
	$scope.editLabels = [];

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
		$scope.editableTask.label_ids = get_check_value_of('#editTask');		
		old_label_ids = $scope.tasks[$scope.editableTaskIndex].label_ids
		var editedTask = Task.edit($scope.editableTask);
		$scope.tasks[$scope.editableTaskIndex] = editedTask
		new_label_ids = $scope.tasks[$scope.editableTaskIndex].label_ids
		$scope.update_label_cnt(old_label_ids, new_label_ids)
		$('#editTask').modal('hide')
	};

	$scope.getEditTask = function(idx){
		$scope.editableTask = angular.copy($scope.tasks[idx]);
		$scope.seteditLabels();
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

	$scope.update_label_cnt = function(old_ids, new_ids){
		remove = $(old_ids).not(new_ids).get();
		add = $(new_ids).not(old_ids).get();		
		$.each($scope.labels, function(i){
			label = $scope.labels[i]
			if($.inArray(label.id.toString(), add)>=0){
				label.task_count += 1
			}else if($.inArray(label.id, remove)>=0){
				label.task_count -= 1
			}
		})
	}
  
  $scope.seteditLabels = function(){
		$scope.editLabels = [];
		for (var i = $scope.labels.length - 1; i >= 0; i--) {
			label = $scope.labels[i]
			checked = $.inArray(label.id, $scope.editableTask.label_ids) == -1 ? false : true
			btn_class = label.btn_class + (checked ? ' active' : '')
			$scope.editLabels.push({id: label.id,
				name: label.name, btn_class: btn_class, checked: checked})
		};
  }
}]);