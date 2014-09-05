// Tasks service
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
// Label service
app.factory('Label', ['$resource', function($resource){
	function Label(){
		this.service = $resource('/labels/:id', {id: '@id'}, {
			'update': {method: 'PUT'}
		});
	};
	Label.prototype.all = function(){
		return this.service.query();
	};
	Label.prototype.delete = function(id){
		return this.service.remove({id: id});
	};
	Label.prototype.create = function(attr){
		return this.service.save(attr);
	}
	Label.prototype.edit = function(attr){
		return this.service.update({id: attr.id}, attr);
	}
	return new Label
}]);
