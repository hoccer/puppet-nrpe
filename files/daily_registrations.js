var today = new Date();
var yesterday = new Date();
var start_of_day = new Date(today);
start_of_day.setHours(0,0,0,0);

var count = db.client.count({ timeRegistered: { $lt: today, $gt: start_of_day } });
print(count);
