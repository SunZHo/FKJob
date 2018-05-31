//
//  WLClearCacheTool.m
//  goToWork
//
//  Created by <15>帝云科技 on 2018/5/30.
//  Copyright © 2018年 青岛卧龙科技. All rights reserved.
//

#import "WLClearCacheTool.h"

@implementation WLClearCacheTool

#pragma mark - 获取path路径下文件夹大小
+ (NSString *)getCacheSizeWithFilePath:(NSString *)path{
    
    // 获取“path”文件夹下的所有文件
    NSArray *subPathArr = [[NSFileManager defaultManager] subpathsAtPath:path];
    NSString *filePath  = nil;
    NSInteger totleSize = 0;
    for (NSString *subPath in subPathArr){
        //        ZYLog(@"getCacheSize = %@",subPath);
        // 0. 把Snapshots文件夹过滤掉,没有访问权限,否则删除时操过200M会失败!!!!!!!!
        if (![subPath containsString:@"Snapshots"]) {
            // 1. 拼接每一个文件的全路径
            filePath =[path stringByAppendingPathComponent:subPath];
        }
        // 2. 是否是文件夹，默认不是
        BOOL isDirectory = NO;
        // 3. 判断文件是否存在
        BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:&isDirectory];
        // 4. 以上判断目的是忽略不需要计算的文件
        if (!isExist || isDirectory || [filePath containsString:@".DS"]){
            // 过滤: 1. 文件夹不存在  2. 过滤文件夹  3. 隐藏文件
            continue;
        }
        // 5. 指定路径，获取这个路径的属性
        NSDictionary *dict = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil];
        /**
         attributesOfItemAtPath: 文件夹路径
         该方法只能获取文件的属性, 无法获取文件夹属性, 所以也是需要遍历文件夹的每一个文件的原因
         */
        // 6. 获取每一个文件的大小
        NSInteger size = [dict[@"NSFileSize"] integerValue];
        // 7. 计算总大小
        totleSize += size;
    }
    
    //8. 将文件夹大小转换为 M/KB/B
    NSString *totleStr = nil;
    if (totleSize > 1000 * 1000){
        totleStr = [NSString stringWithFormat:@"%.2fM",totleSize / 1000.00f /1000.00f];
    }else if (totleSize > 1000){
        totleStr = [NSString stringWithFormat:@"%.2fKB",totleSize / 1000.00f ];
    }else{
        totleStr = [NSString stringWithFormat:@"%.2fB",totleSize / 1.00f];
    }
    return totleStr;
    
}


#pragma mark - 清除path文件夹下缓存大小
+ (BOOL)clearCacheWithFilePath:(NSString *)path{
    
    //拿到path路径的下一级目录的子文件夹
    NSArray *subPathArr = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:nil];
    NSString *filePath = nil;
    NSError *error = nil;
    for (NSString *subPath in subPathArr) {
        filePath = [path stringByAppendingPathComponent:subPath];
        //        ZYLog(@"%@",filePath);
        if (![filePath containsString:@"/Caches/Snapshots"]) {
            //删除子文件夹
            [[NSFileManager defaultManager] removeItemAtPath:filePath error:&error];
        }
        if (error) {
            NSLog(@"clearCacheWithFilePath%@",error);
            return NO;
        }
    }
    return YES;
    
}
//写入
+ (BOOL)archive:(id)rootObject keyedArchiveName:(NSString *)keyedArchiveName {
    
    NSString *keyedArchivePath = [self checkFiletPath:keyedArchiveName];
    return [NSKeyedArchiver archiveRootObject:rootObject toFile:keyedArchivePath];
}
//取出
+ (id)unarchive:(NSString *)filePath
{
    NSString *keyedArchivePath = [self checkFiletPath:filePath];
    return [NSKeyedUnarchiver unarchiveObjectWithFile:keyedArchivePath];
}
//删除缓存文件
+ (BOOL)removeFileExistsAtPath:(NSString *)filePath
{
    NSString *keyedArchivePath = [self checkFiletPath:filePath];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return  [fileManager removeItemAtPath:keyedArchivePath error:nil];
}
//删除缓存目录
+ (BOOL)removeCache {
    NSString *tmpFile = [self dataFilePath];
    if ([self isDirectoryExist:tmpFile] == NO) {
        return YES;
    }
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return  [fileManager removeItemAtPath:tmpFile error:nil];
}
+ (NSString *)checkFiletPath:(NSString *)keyedArchiveName{
    if ([keyedArchiveName rangeOfString:@"/"].location != NSNotFound) {
        keyedArchiveName = [keyedArchiveName stringByReplacingOccurrencesOfString:@"/" withString:@""];
    }
    //判断文件是否存在
    NSString *filePath = [self dataFilePath];
    if ([self isDirectoryExist:filePath] == NO) {
        [self createDirectory:filePath];
    }
    NSString *keyedArchivePath = [filePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist",keyedArchiveName]];
    return keyedArchivePath;
}
//文件
+ (NSString *)dataFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    return [documentDirectory stringByAppendingPathComponent:@"ModelCache"];
    // return [documentDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist",headPath]];
}
+ (BOOL)isDirectoryExist:(NSString *)directoryPath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDir = YES;
    BOOL result = [fileManager fileExistsAtPath:directoryPath isDirectory:&isDir];
    if (result == YES) {
        if (isDir == NO) {
            result = NO;
        }
    }
    return result;
}
+ (BOOL)createDirectory:(NSString *)directoryPath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL result = [fileManager createDirectoryAtPath:directoryPath withIntermediateDirectories:YES attributes:nil error:nil];
    return result;
}

@end
