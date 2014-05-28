//
//  BaseModel.m
//  Liferay Mobile SDK Sample iOS
//
//  Created by 竹生 泰之 on 2014/05/27.
//  Copyright (c) 2014年 Liferay Inc. All rights reserved.
//

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
@end
