//
//  CalenderResource.h
//  Liferay Mobile SDK Sample iOS
//
//  Created by 竹生 泰之 on 2014/05/27.
//  Copyright (c) 2014年 Liferay Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalendarResource : NSObject

@property (nonatomic) long userId;
@property (nonatomic) long groupId;
@property (nonatomic) long calendarId;
@property (nonatomic) long calendarResourceId;

- (id)init:(NSDictionary *)jsonObj;
@end
