Screw.Unit(function() {
	describe("Hoozair", function() {
		var hoozair;
		
		describe("When initializing", function() {
			before(function() {
				hoozair = new Hoozair("ignu", 'cool', 'http://aol.com');
				Screw.Mock(hoozair, 'ping');
				hoozair.start();
			});
			
			it("It should ping the server specified", function() {
				expect(hoozair.ping).to(have_been_called);
			});
		});
		
		describe("When pinging", function() {
		
			before(function() {
				hoozair = new Hoozair("ignu", 'cool', 'http://aol.com');
				Screw.Mock($, 'ajax');
				Screw.Mock(utilities, 'setTimeout')
				hoozair.ping();
			});
				
			it("should ping the server specified with current username and channel", function() {
				expect($.ajax).to(have_been_called_with, [{
					type:"POST",
					url:'http://aol.com/visitors/ping/',
					dataType:'json',
					data:{ username:'ignu', channel:'cool'}}]);
			});
			
			it("should reset the timer", function() {
				after_ajax_callback_with([{visitor:{username:'ignu'}}]);
				expect(utilities.setTimeout).to(have_been_called_with, [hoozair.ping, hoozair.timeout]); 
			});
			
			it("should update the display with every username besides the one logged in", function() { 
				Screw.Mock(hoozair, "clear_users");
				Screw.Mock(hoozair, "add_user");
				var me = {username:'ignu'};
				var other_user = {username:'fred'};
				after_ajax_callback_with([{visitor:me}, {visitor:other_user}]);
				expect(hoozair.clear_users).to(have_been_called);
				expect(hoozair.add_user).to(have_been_called_with, [other_user]);
				expect(hoozair.add_user).to_not(have_been_called_with, [me]);
			});
		})
	});
});

function after_ajax_callback_with(data) {
	$.ajax.parameterStack[0][0].success(data);
}