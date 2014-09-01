app.factory('Task', ['$resource', function($resource){
	function Task(){
		this.service = $resource('/tasks/:id', {id: '@id'});
	};
	Task.prototype.all = function(){
		return this.service.query();
	};
	Task.prototype.delete = function(id){
		return this.service.remove({id: id});
	};
	return new Task
}]);