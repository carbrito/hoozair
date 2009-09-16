// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
var Hoozair = function(username, channel, domain){
	var self = {};
	self.timeout = 2000;
	var url = domain + '/visitors/ping/'
	
	
	var process_ping = function(data) {
		console.log("processing ping.")
		utilities.setTimeout(self.ping, self.timeout);
		update_user_list(data);
	};
	
	var create_user_list = function() {
		self.user_list = $('body').append('<div id="user_list">');
		self.user_list.css('border', '1px solid black;');
	}
	
	var update_user_list = function(users) {
		$.each(users, function() {
			var visitor = this.visitor
			console.log(visitor.username + '.' + visitor.id + '.' + visitor.channel);
		});
	}
	
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
	};
	return self;
};

var utilities = {
	setTimeout: function(callback, timeout) {
		setTimeout(callback, timeout);
	}
}
