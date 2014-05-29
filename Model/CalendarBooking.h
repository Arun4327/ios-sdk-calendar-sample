//
//  CalendarBooking.h
//  Liferay Mobile SDK Sample iOS
//
//  Created by 竹生 泰之 on 2014/05/27.
//  Copyright (c) 2014年 Liferay Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface CalendarBooking : BaseModel

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *description;
@property (nonatomic) long calendarBookingId;
@property (nonatomic) long userId;
@property (nonatomic) long calendarId;
@property (nonatomic) long calendarResourceId;
@property (nonatomic, retain) NSString *startTime;
@property (nonatomic, retain) NSString *endTime;
@property (nonatomic) Boolean allDay;

- (id)init:(NSDictionary *)jsonObj;

@end
