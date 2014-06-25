#import "MainViewController.h"

@implementation MainViewController

- (id)init {
	self = [super initWithStyle:UITableViewStylePlain];
    return self;
}

-(void) viewWillAppear:(BOOL)animated {

    if (self) {
        
		LRSession *session = [SettingsUtil getSession];
        NSError *error;
        
		self.groupId = [self _getGuestGroupId:session];
		self.classNameId = [self _getClassNameId:session className:@"com.liferay.portal.model.Group"];
        long calendarResourceId = [self _getCalenderResource:session classNameId:self.classNameId classPK:self.groupId];
        
        self.calendars = [[NSMutableArray alloc] init];
        self.bookings = [[NSMutableArray alloc] init];
        
		LRCalendarService_v62 *calendarService = [[LRCalendarService_v62 alloc]
                                                  initWithSession:session];
        
        NSArray *calenders = [calendarService getCalendarResourceCalendars:self.groupId calendarResourceId:calendarResourceId defaultCalendar:TRUE error:&error];
        
        if (error) {
			NSLog(@"Error: %@", error);
		}
        
        long calandarId = [self _getDefaultCalendar:calenders];
        
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
    [self updateVisibleCells];
}

- (void)updateVisibleCells {
    for (UITableViewCell *cell in [self.tableView visibleCells]){
        [self updateCell:cell atIndexPath:[self.tableView indexPathForCell:cell]];
    }
}

// Update Cells
- (void)updateCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
	CalendarBooking *booking = [self.bookings objectAtIndex:indexPath.row];
    
	[cell.textLabel setText:booking.title];
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
			initWithStyle:UITableViewCellStyleValue1
			reuseIdentifier:identifier];
	}
    
    [UIFont preferredFontForTextStyle:UIFontTextStyleCaption2];

	CalendarBooking *booking = [self.bookings objectAtIndex:indexPath.row];
    
	[cell.textLabel setText:booking.title];

	return cell;
}

- (void)tableView:(UITableView *)tableView
		didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSError *error;
    LRSession *session = [SettingsUtil getSession];
 
    LRCalendarService_v62 *calendarService = [[LRCalendarService_v62 alloc]
                                              initWithSession:session];
    
    CalendarBooking *booking = [self.bookings objectAtIndex:indexPath.row];
    
    CalendarCallback *callback = [[CalendarCallback alloc]
		init:booking navigationController:self.navigationController];
    
	[session setCallback:callback];
    [calendarService getCalendarBookingWithCalendarBookingId:booking.calendarBookingId error:&error];
    
	if (error) {
		NSLog(@"Error: %@", error);
        
		return;
	}

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

- (long)_getDefaultCalendar:(NSArray *)calendars {
    NSNumber *calandarId = [[NSNumber alloc] initWithLong:-1];
    
    //Selected Default calendar above, so the first object should be the default calendar.
    for (int i = 0; i < [calendars count]; i++) {
        CalendarResource *calendar = [[CalendarResource alloc] init:[calendars objectAtIndex:i]];
        [self.calendars addObject:calendar];
        calandarId = [NSNumber numberWithLong:calendar.calendarId];
    }
    
    return [calandarId longValue];
}

@end