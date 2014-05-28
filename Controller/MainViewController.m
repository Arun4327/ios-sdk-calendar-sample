#import "MainViewController.h"

@implementation MainViewController

- (id)init {
	self = [super initWithStyle:UITableViewStylePlain];

	if (self) {
		self.users = [[NSMutableArray alloc] init];

		LRSession *session = [SettingsUtil getSession];

		long groupId = [self _getGuestGroupId:session];
		long classNameId = [self _getClassNameId:session className:@"com.liferay.portal.model.Group"];
        long calendarResourceId = [self _getCalenderResource:session classNameId:classNameId classPK:groupId];
        
		LRUserService_v62 *service = [[LRUserService_v62 alloc]
			initWithSession:session];

		NSError *error;
		NSArray *users = [service getGroupUsersWithGroupId:groupId
			error:&error];

		if (error) {
			NSLog(@"Error: %@", error);
		}

		for (int i = 0; i < [users count]; i++) {
			User *user = [[User alloc] init:[users objectAtIndex:i]];
			[self.users addObject:user];
		}
        
        ///////////////////////////
        
		LRCalendarService_v62 *calendarService = [[LRCalendarService_v62 alloc]
			initWithSession:session];
        
        NSArray *calenders = [calendarService getCalendarResourceCalendars:groupId calendarResourceId:calendarResourceId defaultCalendar:TRUE error:&error];
        
        if (error) {
			NSLog(@"Error: %@", error);
		}
        
        long calandarId = -1;
        
		for (int i = 0; i < [calenders count]; i++) {
			CalendarResource *calendar = [[CalendarResource alloc] init:[calenders objectAtIndex:i]];
			[self.calendars addObject:calendar];
            calandarId = calendar.calendarId;
		}
        
        NSArray *bookings = [calendarService getCalendarBookings:calandarId startTime:-1 endTime:-1 error:&error];
    
        if (error) {
			NSLog(@"Error: %@", error);
		}
        
        for(int i = 0 ; i < [bookings count]; i++) {
			CalendarBooking *booking = [[CalendarBooking alloc] init:[bookings objectAtIndex:i]];
			[self.bookings addObject:booking];
        }
        
	}

	return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
		cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	static NSString *identifier = @"Cell";

	UITableViewCell *cell =
		[tableView dequeueReusableCellWithIdentifier:identifier];

	if (cell == nil) {
		cell = [[UITableViewCell alloc]
			initWithStyle:UITableViewCellStyleDefault
			reuseIdentifier:identifier];
	}

	User *user = [self.users objectAtIndex:indexPath.row];

	[cell.textLabel setText:user.name];

	return cell;
}

- (void)tableView:(UITableView *)tableView
		didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

	User *user = [self.users objectAtIndex:indexPath.row];

	LRBatchSession *batch = [[LRBatchSession alloc]
		init:[SettingsUtil getSession]];

	ContactCallback *callback = [[ContactCallback alloc]
		init:user navigationController:self.navigationController];

	[batch setCallback:callback];

	LRContactService_v62 *contactService = [[LRContactService_v62 alloc]
		initWithSession:batch];

	NSError *error;

	[contactService getContactWithContactId:user.contactId error:&error];

	LRPhoneService_v62 *phoneService = [[LRPhoneService_v62 alloc]
		initWithSession:batch];

	[phoneService getPhonesWithClassName:@"com.liferay.portal.model.Contact"
		classPK:user.contactId error:&error];

	[batch invoke:&error];

	if (error) {
		NSLog(@"Error: %@", error);

		return;
	}
}

- (NSInteger)tableView:(UITableView *)tableView
 		numberOfRowsInSection:(NSInteger)section {

	return [self.users count];
}

- (int)_getGuestGroupId:(LRSession *)session {
	NSNumber *groupId = [NSNumber numberWithInt:-1];

	LRGroupService_v62 *service = [[LRGroupService_v62 alloc]
		initWithSession:session];

	NSError *error;

	NSArray *groups = [service getUserSites:&error];

	if (error) {
		NSLog(@"Error: %@", error);

		return [groupId intValue];
	}

	for (int i = 0; i < [groups count]; i++) {
		NSDictionary *group = [groups objectAtIndex:i];

		NSString *name = [group objectForKey:@"name"];

		if (![name isEqualToString:@"Guest"]) {
			continue;
		}

		groupId = [group objectForKey:@"groupId"];
	}

	if ([groupId intValue] == -1) {
		NSLog(@"Couldn't find Guest group.");
	}

	return [groupId intValue];
}

- (long)_getClassNameId:(LRSession *)session className:(NSString *)className{
    NSError *error;
    
    LRClassNameService_v62 *service = [[LRClassNameService_v62 alloc]
		initWithSession:session];
    
    NSNumber *classNameId = [service fetchClassNameIdWithValue:className error:&error];
    
	if (error) {
		NSLog(@"Error: %@", error);
        
		return [classNameId longValue];
	}
    
    return [classNameId longValue];
}

- (long)_getCalenderResource:(LRSession *)session classNameId:(long long)classNameId classPK:(long long)classPK {
    NSError *error;
    NSNumber *calendarResourceId = [NSNumber numberWithLong:-1];
    LRCalendarService_v62 *service = [[LRCalendarService_v62 alloc]
                                       initWithSession:session];
    
    NSDictionary *calenderResource = [service fetchCalendarResourceByGroupId:classNameId classPK:classPK error:&error];
    
	if (error) {
		NSLog(@"Error: %@", error);
        
		return [calendarResourceId longValue];
	}
        
    calendarResourceId = [calenderResource objectForKey:@"calendarResourceId"];
    
	if ([calendarResourceId longValue] == -1) {
		NSLog(@"Couldn't find calendarResourceId.");
	}
    
	return [calendarResourceId longValue];
}

@end