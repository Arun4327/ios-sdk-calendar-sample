#import "CalendarCallback.h"

@implementation CalendarCallback
- (id)init:(CalendarBooking *)booking
navigationController:(UINavigationController *)navigationController {
    
	self = [super init];
    
	if (self) {
		self.booking = booking;
		self.navigationController = navigationController;
	}
    
	return self;
}

- (void)onFailure:(NSError *)error {
	NSLog(@"Error: %@", error);
}

- (void)onSuccess:(id)result {
    NSDictionary *booking = (NSDictionary *)result;
    
    self.booking = [[CalendarBooking alloc] init:booking];
    DetailsViewController *detailsController = [[DetailsViewController alloc]
                                                init:self.booking];
    
	[self.navigationController pushViewController:detailsController
                                         animated:YES];
}

@end