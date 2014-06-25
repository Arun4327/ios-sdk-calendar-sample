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

#import "LRShoppingItemService_v6201.h"

/**
 * @author Bruno Farache
 */
@implementation LRShoppingItemService_v6201

- (void)addBookItemsWithGroupId:(long long)groupId categoryId:(long long)categoryId isbns:(NSArray *)isbns error:(NSError **)error {
	NSMutableDictionary *_params = [NSMutableDictionary dictionaryWithDictionary:@{
		@"groupId": @(groupId),
		@"categoryId": @(categoryId),
		@"isbns": isbns
	}];

	NSDictionary *_command = @{@"/shoppingitem/add-book-items": _params};

	[self.session invoke:_command error:error];
}

- (NSDictionary *)addItemWithGroupId:(long long)groupId categoryId:(long long)categoryId sku:(NSString *)sku name:(NSString *)name description:(NSString *)description properties:(NSString *)properties fieldsQuantities:(NSString *)fieldsQuantities requiresShipping:(BOOL)requiresShipping stockQuantity:(int)stockQuantity featured:(BOOL)featured sale:(LRJSONObjectWrapper *)sale smallImage:(BOOL)smallImage smallImageURL:(NSString *)smallImageURL smallFile:(LRJSONObjectWrapper *)smallFile mediumImage:(BOOL)mediumImage mediumImageURL:(NSString *)mediumImageURL mediumFile:(LRJSONObjectWrapper *)mediumFile largeImage:(BOOL)largeImage largeImageURL:(NSString *)largeImageURL largeFile:(LRJSONObjectWrapper *)largeFile itemFields:(NSArray *)itemFields itemPrices:(NSArray *)itemPrices serviceContext:(LRJSONObjectWrapper *)serviceContext error:(NSError **)error {
	NSMutableDictionary *_params = [NSMutableDictionary dictionaryWithDictionary:@{
		@"groupId": @(groupId),
		@"categoryId": @(categoryId),
		@"sku": sku,
		@"name": name,
		@"description": description,
		@"properties": properties,
		@"fieldsQuantities": fieldsQuantities,
		@"requiresShipping": @(requiresShipping),
		@"stockQuantity": @(stockQuantity),
		@"featured": @(featured),
		@"smallImage": @(smallImage),
		@"smallImageURL": smallImageURL,
		@"mediumImage": @(mediumImage),
		@"mediumImageURL": mediumImageURL,
		@"largeImage": @(largeImage),
		@"largeImageURL": largeImageURL,
		@"itemFields": itemFields,
		@"itemPrices": itemPrices,
	}];

	[self mangleWrapperWithParams:_params name:@"sale" className:@"java.lang.Boolean" wrapper:sale];
	[self mangleWrapperWithParams:_params name:@"smallFile" className:@"java.io.File" wrapper:smallFile];
	[self mangleWrapperWithParams:_params name:@"mediumFile" className:@"java.io.File" wrapper:mediumFile];
	[self mangleWrapperWithParams:_params name:@"largeFile" className:@"java.io.File" wrapper:largeFile];
	[self mangleWrapperWithParams:_params name:@"serviceContext" className:@"com.liferay.portal.service.ServiceContext" wrapper:serviceContext];

	NSDictionary *_command = @{@"/shoppingitem/add-item": _params};

	return (NSDictionary *)[self.session invoke:_command error:error];
}

- (void)deleteItemWithItemId:(long long)itemId error:(NSError **)error {
	NSMutableDictionary *_params = [NSMutableDictionary dictionaryWithDictionary:@{
		@"itemId": @(itemId)
	}];

	NSDictionary *_command = @{@"/shoppingitem/delete-item": _params};

	[self.session invoke:_command error:error];
}

- (NSNumber *)getCategoriesItemsCountWithGroupId:(long long)groupId categoryIds:(NSArray *)categoryIds error:(NSError **)error {
	NSMutableDictionary *_params = [NSMutableDictionary dictionaryWithDictionary:@{
		@"groupId": @(groupId),
		@"categoryIds": categoryIds
	}];

	NSDictionary *_command = @{@"/shoppingitem/get-categories-items-count": _params};

	return (NSNumber *)[self.session invoke:_command error:error];
}

- (NSDictionary *)getItemWithItemId:(long long)itemId error:(NSError **)error {
	NSMutableDictionary *_params = [NSMutableDictionary dictionaryWithDictionary:@{
		@"itemId": @(itemId)
	}];

	NSDictionary *_command = @{@"/shoppingitem/get-item": _params};

	return (NSDictionary *)[self.session invoke:_command error:error];
}

- (NSArray *)getItemsWithGroupId:(long long)groupId categoryId:(long long)categoryId error:(NSError **)error {
	NSMutableDictionary *_params = [NSMutableDictionary dictionaryWithDictionary:@{
		@"groupId": @(groupId),
		@"categoryId": @(categoryId)
	}];

	NSDictionary *_command = @{@"/shoppingitem/get-items": _params};

	return (NSArray *)[self.session invoke:_command error:error];
}

- (NSArray *)getItemsWithGroupId:(long long)groupId categoryId:(long long)categoryId start:(int)start end:(int)end obc:(LRJSONObjectWrapper *)obc error:(NSError **)error {
	NSMutableDictionary *_params = [NSMutableDictionary dictionaryWithDictionary:@{
		@"groupId": @(groupId),
		@"categoryId": @(categoryId),
		@"start": @(start),
		@"end": @(end),
	}];

	[self mangleWrapperWithParams:_params name:@"obc" className:@"com.liferay.portal.kernel.util.OrderByComparator" wrapper:obc];

	NSDictionary *_command = @{@"/shoppingitem/get-items": _params};

	return (NSArray *)[self.session invoke:_command error:error];
}

- (NSNumber *)getItemsCountWithGroupId:(long long)groupId categoryId:(long long)categoryId error:(NSError **)error {
	NSMutableDictionary *_params = [NSMutableDictionary dictionaryWithDictionary:@{
		@"groupId": @(groupId),
		@"categoryId": @(categoryId)
	}];

	NSDictionary *_command = @{@"/shoppingitem/get-items-count": _params};

	return (NSNumber *)[self.session invoke:_command error:error];
}

- (NSArray *)getItemsPrevAndNextWithItemId:(long long)itemId obc:(LRJSONObjectWrapper *)obc error:(NSError **)error {
	NSMutableDictionary *_params = [NSMutableDictionary dictionaryWithDictionary:@{
		@"itemId": @(itemId),
	}];

	[self mangleWrapperWithParams:_params name:@"obc" className:@"com.liferay.portal.kernel.util.OrderByComparator" wrapper:obc];

	NSDictionary *_command = @{@"/shoppingitem/get-items-prev-and-next": _params};

	return (NSArray *)[self.session invoke:_command error:error];
}

- (NSDictionary *)updateItemWithItemId:(long long)itemId groupId:(long long)groupId categoryId:(long long)categoryId sku:(NSString *)sku name:(NSString *)name description:(NSString *)description properties:(NSString *)properties fieldsQuantities:(NSString *)fieldsQuantities requiresShipping:(BOOL)requiresShipping stockQuantity:(int)stockQuantity featured:(BOOL)featured sale:(LRJSONObjectWrapper *)sale smallImage:(BOOL)smallImage smallImageURL:(NSString *)smallImageURL smallFile:(LRJSONObjectWrapper *)smallFile mediumImage:(BOOL)mediumImage mediumImageURL:(NSString *)mediumImageURL mediumFile:(LRJSONObjectWrapper *)mediumFile largeImage:(BOOL)largeImage largeImageURL:(NSString *)largeImageURL largeFile:(LRJSONObjectWrapper *)largeFile itemFields:(NSArray *)itemFields itemPrices:(NSArray *)itemPrices serviceContext:(LRJSONObjectWrapper *)serviceContext error:(NSError **)error {
	NSMutableDictionary *_params = [NSMutableDictionary dictionaryWithDictionary:@{
		@"itemId": @(itemId),
		@"groupId": @(groupId),
		@"categoryId": @(categoryId),
		@"sku": sku,
		@"name": name,
		@"description": description,
		@"properties": properties,
		@"fieldsQuantities": fieldsQuantities,
		@"requiresShipping": @(requiresShipping),
		@"stockQuantity": @(stockQuantity),
		@"featured": @(featured),
		@"smallImage": @(smallImage),
		@"smallImageURL": smallImageURL,
		@"mediumImage": @(mediumImage),
		@"mediumImageURL": mediumImageURL,
		@"largeImage": @(largeImage),
		@"largeImageURL": largeImageURL,
		@"itemFields": itemFields,
		@"itemPrices": itemPrices,
	}];

	[self mangleWrapperWithParams:_params name:@"sale" className:@"java.lang.Boolean" wrapper:sale];
	[self mangleWrapperWithParams:_params name:@"smallFile" className:@"java.io.File" wrapper:smallFile];
	[self mangleWrapperWithParams:_params name:@"mediumFile" className:@"java.io.File" wrapper:mediumFile];
	[self mangleWrapperWithParams:_params name:@"largeFile" className:@"java.io.File" wrapper:largeFile];
	[self mangleWrapperWithParams:_params name:@"serviceContext" className:@"com.liferay.portal.service.ServiceContext" wrapper:serviceContext];

	NSDictionary *_command = @{@"/shoppingitem/update-item": _params};

	return (NSDictionary *)[self.session invoke:_command error:error];
}

@end