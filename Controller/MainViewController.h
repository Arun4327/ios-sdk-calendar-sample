#import "LRBatchSession.h"
#import "LRContactService_v62.h"
#import "LRGroupService_v62.h"
#import "LRPhoneService_v62.h"
#import "LRUserService_v62.h"
#import "LRClassNameService_v62.h"
#import "LRCalendarService_v62.h"
#import "CalendarResource.h"
#import "CalendarBooking.h"
#import "SettingsUtil.h"
#import "DetailsViewController.h"

@interface MainViewController : UITableViewController

@property (nonatomic, retain) NSMutableArray *calendars;
@property (nonatomic, retain) NSMutableArray *bookings;

@end