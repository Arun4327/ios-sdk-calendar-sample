#import "BaseModel.h"

@implementation BaseModel
- (NSDate *)_convertNumberToDate:(NSNumber *)timeInterval {
	NSString *value = [timeInterval stringValue];
    
	value = [value substringToIndex:(value.length - 3)];
    
	return [NSDate dateWithTimeIntervalSince1970:[value longLongValue]];
}

- (NSString *)formattedNumberToDate:(NSNumber *)timeInterval {
    NSString *formattedDate = [timeInterval stringValue];
                                
    if ([timeInterval longValue] <= 0) {
        return formattedDate;
    }
    NSDate *birthday = [self _convertNumberToDate:timeInterval];
        
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setTimeStyle:NSDateFormatterNoStyle];
        
    return [formatter stringFromDate:birthday];

}

- (NSString *)getStringFromXML:(NSString *)targetStr targetPath:(NSString *)targetPath {
    NSString *retStr = [[NSString alloc] init];
    
    NSError *error;
    DDXMLDocument *doc = [[DDXMLDocument alloc] initWithXMLString:targetStr options:0 error:&error];

	if (error) {
		NSLog(@"DDXMLDocument Initialize Error: %@", error);
        
		return retStr;
	}
    
    // Fetch target node with XPath
    NSArray *nodes = [doc nodesForXPath:targetPath error:&error];
    
	if (error || 0 == [nodes count]) {
		NSLog(@"nodesForXPath parse Error: %@", error);
        
		return retStr;
	}
    
    DDXMLNode *node = nodes[0];
    
    retStr = node.stringValue;
    
    return retStr;
}
@end
