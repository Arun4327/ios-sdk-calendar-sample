/**
 * Copyright (c) 2000-2014 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */

#import "LRCalendarService_v62.h"

@implementation LRCalendarService_v62

- (NSDictionary *)addEventWithUserId:(long long)userId title:(NSString *)title description:(NSString *)description location:(NSString *)location startDateMonth:(int)startDateMonth startDateDay:(int)startDateDay startDateYear:(int)startDateYear startDateHour:(int)startDateHour startDateMinute:(int)startDateMinute durationHour:(int)durationHour durationMinute:(int)durationMinute allDay:(BOOL)allDay timeZoneSensitive:(BOOL)timeZoneSensitive type:(NSString *)type repeating:(BOOL)repeating recurrence:(LRJSONObjectWrapper *)recurrence remindBy:(int)remindBy  firstReminder:(int)firstReminder secondReminder:(int)secondReminder serviceContext:(LRJSONObjectWrapper *)serviceContext error:(NSError **)error {
	NSMutableDictionary *_params = [NSMutableDictionary dictionaryWithDictionary:@{
        @"userId": @(userId),
		@"title": title,
		@"description": description,
        @"location": location,
		@"startDateMonth": @(startDateMonth),
		@"startDateDay": @(startDateDay),
		@"startDateYear": @(startDateYear),
		@"startDateHour": @(startDateHour),
		@"startDateMinute": @(startDateMinute),
		@"durationHour": @(durationHour),
		@"durationMinute": @(durationMinute),
		@"allDay": @(allDay),
		@"timeZoneSensitive": @(timeZoneSensitive),
		@"type": type,
		@"repeating": @(repeating),
		@"remindBy": @(remindBy),
		@"firstReminder": @(firstReminder),
		@"secondReminder": @(secondReminder)
	}];
    
	[self mangleWrapperWithParams:_params name:@"recurrence" className:@"com.liferay.portal.kernel.cal.TZSRecurrence" wrapper:recurrence];
    
	[self mangleWrapperWithParams:_params name:@"serviceContext" className:@"com.liferay.portal.service.ServiceContext" wrapper:serviceContext];

	NSDictionary *_command = @{@"/calendar/add-event": _params};

	return (NSDictionary *)[self.session invoke:_command error:error];

}

/**
 * Fetch calendar resource
 */
- (NSDictionary *)fetchCalendarResourceByGroupId:(long long)classNameId classPK:(long long)classPK error:(NSError **)error {
	NSMutableDictionary *_params = [NSMutableDictionary dictionaryWithDictionary:@{
        @"classNameId": @(classNameId),
        @"classPK": @(classPK)
	}];

	NSDictionary *_command = @{@"/calendar-portlet.calendarresource/fetch-calendar-resource": _params};
    
    return (NSDictionary *)[self.session invoke:_command error:error];
}

- (NSArray *)getCalendarResourceCalendars:(long long)groupId calendarResourceId:(long long)calendarResourceId defaultCalendar:(BOOL)defaultCalendar error:(NSError **)error {
	NSMutableDictionary *_params = [NSMutableDictionary dictionaryWithDictionary:@{
        @"groupId": @(groupId),
        @"calendarResourceId": @(calendarResourceId),
        @"defaultCalendar": @(defaultCalendar)
	}];

	NSDictionary *_command = @{@"/calendar-portlet.calendar/get-calendar-resource-calendars": _params};
    
    return (NSArray *)[self.session invoke:_command error:error];
}

- (NSArray *)getCalendarBookings:(long long)calendarId startTime:(long long)startTime endTime:(long long)endTime error:(NSError **)error {
	NSMutableDictionary *_params = [NSMutableDictionary dictionaryWithDictionary:@{
        @"calendarId": @(calendarId),
        @"startTime": @(startTime),
        @"endTime": @(endTime)
	}];

	NSDictionary *_command = @{@"/calendar-portlet.calendarbooking/get-calendar-bookings": _params};
    
//    NSArray *tmp = [self.session invoke:_command error:error];
//    NSLog(@"getCalendarBookings : %@", [tmp description]);
    return (NSArray *)[self.session invoke:_command error:error];
}

- (NSDictionary *)getCalendarBookingWithCalendarBookingId:(long long)calendarBookingId error:(NSError **)error {
	NSMutableDictionary *_params = [NSMutableDictionary dictionaryWithDictionary:@{
		@"calendarBookingId": @(calendarBookingId)
	}];

	NSDictionary *_command = @{@"/calendar-portlet.calendarbooking/get-calendar-booking": _params};

	return (NSDictionary *)[self.session invoke:_command error:error];
}
@end
