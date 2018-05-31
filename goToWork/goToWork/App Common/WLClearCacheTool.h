//
//  WLClearCacheTool.h
//  goToWork
//
//  Created by <15>帝云科技 on 2018/5/30.
//  Copyright © 2018年 青岛卧龙科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLClearCacheTool : NSObject

/*s*
 *  获取path路径下文件夹的大小
 *
 *  @param path 要获取的文件夹 路径
 *
 *  @return 返回path路径下文件夹的大小
 */
+ (NSString *)getCacheSizeWithFilePath:(NSString *)path;

/**
 *  清除path路径下文件夹的缓存
 *
 *  @param path  要清除缓存的文件夹 路径
 *
 *  @return 是否清除成功
 */
+ (BOOL)clearCacheWithFilePath:(NSString *)path;

+ (BOOL)archive:(id)rootObject keyedArchiveName:(NSString *)keyedArchiveName ;

+ (id)unarchive:(NSString *)filePath ;

//删除缓存文件
+ (BOOL)removeFileExistsAtPath:(NSString *)filePath;

//删除缓存目录
+ (BOOL)removeCache;

@end
