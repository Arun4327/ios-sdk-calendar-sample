#import "DetailsViewController.h"

@implementation DetailsViewController

- (id)init:(CalendarBooking *)booking {
	self = [super initWithStyle:UITableViewStyleGrouped];

	if (self) {
		self.booking = booking;
	}

	return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 4;
}

- (NSInteger)tableView:(UITableView *)tableView
 		numberOfRowsInSection:(NSInteger)section {

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

	NSString *text = @"";

	if (indexPath.section == 0) {
		text = [NSString stringWithFormat:@"%@", self.booking.title];
	}
	else if (indexPath.section == 1) {
		text = self.booking.description;
	}
	else if (indexPath.section == 2) {
		text = self.booking.startTime;
	}
	else {
		text = self.booking.startTime;
	}

	[cell.textLabel setText:text];

	return cell;
}

- (NSString *)tableView:(UITableView *)tableView
		titleForHeaderInSection:(NSInteger)section {

	if (section == 0) {
		return @"予定";
	}
	else if (section == 1) {
		return @"詳細";
	}
	else if (section == 2) {
		return @"開始時間";
	}
	else {
		return @"終了時間";
	}
}

-(void) viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self]==NSNotFound) {
       // back button was pressed.  We know this is true because self is no longer
       // in the navigation stack.  
    }
    [super viewWillDisappear:animated];
}

@end