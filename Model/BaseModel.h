#import "DDXML.h"

@interface BaseModel : NSObject

- (NSString *)formattedNumberToDate:(NSNumber *)timeInterval;
- (NSString *)getStringFromXML:(NSString *)targetStr targetPath:(NSString *)targetPath;

@end
