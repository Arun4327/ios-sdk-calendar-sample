#import "CalendarBooking.h"

@interface DetailsViewController : UITableViewController

@property (nonatomic, retain) CalendarBooking *booking;

- (id)init:(CalendarBooking *)booking;

@end