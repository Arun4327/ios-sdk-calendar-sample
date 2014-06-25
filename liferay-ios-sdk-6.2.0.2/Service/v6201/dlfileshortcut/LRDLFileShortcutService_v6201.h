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
 * @author Bruno Farache
 */
@interface LRDLFileShortcutService_v6201 : LRBaseService

- (NSDictionary *)addFileShortcutWithGroupId:(long long)groupId folderId:(long long)folderId toFileEntryId:(long long)toFileEntryId serviceContext:(LRJSONObjectWrapper *)serviceContext error:(NSError **)error;
- (void)deleteFileShortcutWithFileShortcutId:(long long)fileShortcutId error:(NSError **)error;
- (NSDictionary *)getFileShortcutWithFileShortcutId:(long long)fileShortcutId error:(NSError **)error;
- (NSDictionary *)updateFileShortcutWithFileShortcutId:(long long)fileShortcutId folderId:(long long)folderId toFileEntryId:(long long)toFileEntryId serviceContext:(LRJSONObjectWrapper *)serviceContext error:(NSError **)error;

@end