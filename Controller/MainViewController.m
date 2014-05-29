#import "MainViewController.h"

@implementation MainViewController

- (id)init {
	self = [super initWithStyle:UITableViewStylePlain];

	if (self) {

        
		LRSession *session = [SettingsUtil getSession];
        NSError *error;

		long groupId = [self _getGuestGroupId:session];
		long classNameId = [self _getClassNameId:session className:@"com.liferay.portal.model.Group"];
        long calendarResourceId = [self _getCalenderResource:session classNameId:classNameId classPK:groupId];

        self.calendars = [[NSMutableArray alloc] init];
        self.bookings = [[NSMutableArray alloc] init];
        
		LRCalendarService_v62 *calendarService = [[LRCalendarService_v62 alloc]
			initWithSession:session];
        
        NSArray *calenders = [calendarService getCalendarResourceCalendars:groupId calendarResourceId:calendarResourceId defaultCalendar:TRUE error:&error];
        
        if (error) {
			NSLog(@"Error: %@", error);
		}
        
        long calandarId = -1;
        
        //Selected Default calendar above, so the first object should be the default calendar.
		for (int i = 0; i < [calenders count]; i++) {
			CalendarResource *calendar = [[CalendarResource alloc] init:[calenders objectAtIndex:i]];
			[self.calendars addObject:calendar];
            calandarId = calendar.calendarId;
		}
        
        //Fetch all bookings
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
    
    [UIFont preferredFontForTextStyle:UIFontTextStyleCaption2];

	CalendarBooking *booking = [self.bookings objectAtIndex:indexPath.row];
    
	[cell.textLabel setText:booking.title];

	return cell;
}

- (void)tableView:(UITableView *)tableView
		didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    CalendarBooking *booking = [self.bookings objectAtIndex:indexPath.row];
	DetailsViewController *detailsController = [[DetailsViewController alloc]
		init:booking];

	[self.navigationController pushViewController:detailsController
		animated:YES];

}

- (NSInteger)tableView:(UITableView *)tableView
 		numberOfRowsInSection:(NSInteger)section {

	return [self.bookings count];
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