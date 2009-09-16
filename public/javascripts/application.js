// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
var Hoozair = function(username, channel, domain){
	var timeout = 500;
	var url = domain + '/visitors/ping/'
	var self = {}
	
	var process_ping = function(data) {
		update_user_list(data);
		setTimeout(self.ping, 2000);
	};
	
	var create_user_list = function() {
		self.user_list = $('body').append('<div id="user_list">');
		self.user_list.css('border', '1px solid black;');
	}
	
	var update_user_list = function(users) {
		$.each(users, function() {
			console.log(this.visitor.username);
		});
	}
	
	self.ping = function() {
		$.ajax({
			type:"POST",
			data:{username:username, channel:channel}, 
			success: process_ping, 
			url:url, 
			dataType:'json'
		});
	}
	
	setTimeout(self.ping, 100);
	return self;
};
