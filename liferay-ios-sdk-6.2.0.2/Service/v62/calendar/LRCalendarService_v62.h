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

#import "LRBaseService.h"

/**
 * @author Yasuyuki Takeo
 */
@interface LRCalendarService_v62 : LRBaseService
- (NSDictionary *)addEventWithUserId:(long long)userId title:(NSString *)title description:(NSString *)description location:(NSString *)location startDateMonth:(int)startDateMonth startDateDay:(int)startDateDay startDateYear:(int)startDateYear startDateHour:(int)startDateHour startDateMinute:(int)startDateMinute durationHour:(int)durationHour durationMinute:(int)durationMinute allDay:(BOOL)allDay timeZoneSensitive:(BOOL)timeZoneSensitive type:(NSString *)type repeating:(BOOL)repeating recurrence:(LRJSONObjectWrapper *)recurrence remindBy:(int)remindBy  firstReminder:(int)firstReminder secondReminder:(int)secondReminder serviceContext:(LRJSONObjectWrapper *)serviceContext error:(NSError **)error;

- (NSDictionary *)fetchCalendarResourceByGroupId:(long long)classNameId classPK:(long long)classPK error:(NSError **)error;

- (NSArray *)getCalendarResourceCalendars:(long long)groupId calendarResourceId:(long long)calendarResourceId defaultCalendar:(BOOL)defaultCalendar error:(NSError **)error;

- (NSArray *)getCalendarBookings:(long long)calendarId startTime:(long long)startTime endTime:(long long)endTime error:(NSError **)error;

- (NSDictionary *)getCalendarBookingWithCalendarBookingId:(long long)calendarBookingId error:(NSError **)error;
@end