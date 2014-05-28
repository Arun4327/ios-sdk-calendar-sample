//
//  CalendarBooking.m
//  Liferay Mobile SDK Sample iOS
//
//  Created by 竹生 泰之 on 2014/05/27.
//  Copyright (c) 2014年 Liferay Inc. All rights reserved.
//

#import "CalendarBooking.h"

@implementation CalendarBooking
- (id)init:(NSDictionary *)jsonObj {
	self = [super init];
    
	if (self) {

		self.title = [jsonObj objectForKey:@"title"];
		self.description = [jsonObj objectForKey:@"description"];
        
		NSNumber *calendarBookingId = [jsonObj objectForKey:@"calendarBookingId"];
		self.calendarBookingId = [calendarBookingId longValue];
        
		NSNumber *userId = [jsonObj objectForKey:@"userId"];
		self.userId = [userId longValue];
        
		NSNumber *calendarId = [jsonObj objectForKey:@"calendarId"];
		self.calendarId = [calendarId longValue];
        
		NSNumber *calendarResourceId = [jsonObj objectForKey:@"calendarResourceId"];
		self.calendarResourceId = [calendarResourceId longValue];
      
		NSNumber *startTime = [jsonObj objectForKey:@"startTime"];
		self.startTime = [self formattedNumberToDate:startTime];

        NSNumber *endTime = [jsonObj objectForKey:@"endTime"];
        self.startTime = [self formattedNumberToDate:endTime];
     
        NSNumber *allDay = [jsonObj objectForKey:@"allDay"];
		self.allDay = [allDay boolValue];
	}
    
	return self;
}
@end
