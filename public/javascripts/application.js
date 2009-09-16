
var Hoozair = function(username, channel, domain, target){
	var self = {};
	self.timeout = 2000;
	var url = domain + '/visitors/ping/'
	
	
	var process_ping = function(data) {
		utilities.setTimeout(self.ping, self.timeout);
		update_user_list(data);
	};
	
	var create_user_list = function() {
		if(!target) target = 'body';
		self.user_list = $(target).append('<div id="user_list">');
		self.user_list.css('border', '1px solid black;');
	}
	
	var update_user_list = function(users) {
		self.clear_users();
		$.each(users, function() {
			var visitor = this.visitor
			if(visitor.username != username)
				self.add_user(visitor);
		});
	}
	self.clear_users = function() {
		$('#user_list').html('');
	};
	self.add_user = function(user) {
		$('#user_list')
			.append('<div>' + user.username + '</div>');
	};
	
	self.ping = function() {
		$.ajax({
			type:"POST",
			url:url, 
			dataType:'json',
			data:{ username:username, channel:channel}, 
			success: process_ping
		});
	}
	
	self.start = function() {
		self.ping();
		create_user_list();
	};
	return self;
};

var utilities = {
	setTimeout: function(callback, timeout) {
		setTimeout(callback, timeout);
	}
}
