#import "DetailsViewController.h"
#import "LRCallback.h"

@interface CalendarCallback : NSObject <LRCallback>
@property (nonatomic, retain) UINavigationController *navigationController;
@property (nonatomic, retain) CalendarBooking *booking;

- (id)init:(CalendarBooking *)booking
navigationController:(UINavigationController *)navigationController;
@end
