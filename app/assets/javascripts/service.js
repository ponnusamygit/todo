app.factory('Task', ['$resource', function($resource){
	function Task(){
		this.service = $resource('/tasks/:id', {id: '@id'}, {
			'update': {method: 'PUT'}
		});
	};
	Task.prototype.all = function(){
		return this.service.query();
	};
	Task.prototype.delete = function(id){
		return this.service.remove({id: id});
	};
	Task.prototype.create = function(attr){
		return this.service.save(attr);
	}
	Task.prototype.edit = function(attr){
		return this.service.update({id: attr.id}, attr);
	}
	return new Task
}]);