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

#import "LRMDRRuleService_v6201.h"

/**
 * @author Bruno Farache
 */
@implementation LRMDRRuleService_v6201

- (NSDictionary *)addRuleWithRuleGroupId:(long long)ruleGroupId nameMap:(NSDictionary *)nameMap descriptionMap:(NSDictionary *)descriptionMap type:(NSString *)type typeSettings:(NSString *)typeSettings serviceContext:(LRJSONObjectWrapper *)serviceContext error:(NSError **)error {
	NSMutableDictionary *_params = [NSMutableDictionary dictionaryWithDictionary:@{
		@"ruleGroupId": @(ruleGroupId),
		@"nameMap": nameMap,
		@"descriptionMap": descriptionMap,
		@"type": type,
		@"typeSettings": typeSettings,
	}];

	[self mangleWrapperWithParams:_params name:@"serviceContext" className:@"com.liferay.portal.service.ServiceContext" wrapper:serviceContext];

	NSDictionary *_command = @{@"/mdrrule/add-rule": _params};

	return (NSDictionary *)[self.session invoke:_command error:error];
}

- (void)deleteRuleWithRuleId:(long long)ruleId error:(NSError **)error {
	NSMutableDictionary *_params = [NSMutableDictionary dictionaryWithDictionary:@{
		@"ruleId": @(ruleId)
	}];

	NSDictionary *_command = @{@"/mdrrule/delete-rule": _params};

	[self.session invoke:_command error:error];
}

- (NSDictionary *)fetchRuleWithRuleId:(long long)ruleId error:(NSError **)error {
	NSMutableDictionary *_params = [NSMutableDictionary dictionaryWithDictionary:@{
		@"ruleId": @(ruleId)
	}];

	NSDictionary *_command = @{@"/mdrrule/fetch-rule": _params};

	return (NSDictionary *)[self.session invoke:_command error:error];
}

- (NSDictionary *)getRuleWithRuleId:(long long)ruleId error:(NSError **)error {
	NSMutableDictionary *_params = [NSMutableDictionary dictionaryWithDictionary:@{
		@"ruleId": @(ruleId)
	}];

	NSDictionary *_command = @{@"/mdrrule/get-rule": _params};

	return (NSDictionary *)[self.session invoke:_command error:error];
}

- (NSDictionary *)updateRuleWithRuleId:(long long)ruleId nameMap:(NSDictionary *)nameMap descriptionMap:(NSDictionary *)descriptionMap type:(NSString *)type typeSettings:(NSString *)typeSettings serviceContext:(LRJSONObjectWrapper *)serviceContext error:(NSError **)error {
	NSMutableDictionary *_params = [NSMutableDictionary dictionaryWithDictionary:@{
		@"ruleId": @(ruleId),
		@"nameMap": nameMap,
		@"descriptionMap": descriptionMap,
		@"type": type,
		@"typeSettings": typeSettings,
	}];

	[self mangleWrapperWithParams:_params name:@"serviceContext" className:@"com.liferay.portal.service.ServiceContext" wrapper:serviceContext];

	NSDictionary *_command = @{@"/mdrrule/update-rule": _params};

	return (NSDictionary *)[self.session invoke:_command error:error];
}

- (NSDictionary *)updateRuleWithRuleId:(long long)ruleId nameMap:(NSDictionary *)nameMap descriptionMap:(NSDictionary *)descriptionMap type:(NSString *)type typeSettingsProperties:(LRJSONObjectWrapper *)typeSettingsProperties serviceContext:(LRJSONObjectWrapper *)serviceContext error:(NSError **)error {
	NSMutableDictionary *_params = [NSMutableDictionary dictionaryWithDictionary:@{
		@"ruleId": @(ruleId),
		@"nameMap": nameMap,
		@"descriptionMap": descriptionMap,
		@"type": type,
	}];

	[self mangleWrapperWithParams:_params name:@"typeSettingsProperties" className:@"com.liferay.portal.kernel.util.UnicodeProperties" wrapper:typeSettingsProperties];
	[self mangleWrapperWithParams:_params name:@"serviceContext" className:@"com.liferay.portal.service.ServiceContext" wrapper:serviceContext];

	NSDictionary *_command = @{@"/mdrrule/update-rule": _params};

	return (NSDictionary *)[self.session invoke:_command error:error];
}

@end