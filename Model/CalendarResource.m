//
//  CalenderResource.m
//  Liferay Mobile SDK Sample iOS
//
//  Created by 竹生 泰之 on 2014/05/27.
//  Copyright (c) 2014年 Liferay Inc. All rights reserved.
//

#import "CalendarResource.h"

@implementation CalendarResource
- (id)init:(NSDictionary *)jsonObj {
	self = [super init];
    
	if (self) {
		NSNumber *userId = [jsonObj objectForKey:@"userId"];
		self.userId = [userId longValue];
        
		NSNumber *groupId = [jsonObj objectForKey:@"groupId"];
		self.groupId = [groupId longValue];

		NSNumber *calendarId = [jsonObj objectForKey:@"calendarId"];
		self.calendarId = [calendarId longValue];
        
		NSNumber *calendarResourceId = [jsonObj objectForKey:@"calendarResourceId"];
		self.calendarResourceId = [calendarResourceId longValue];

	}
    
	return self;
}
@end
