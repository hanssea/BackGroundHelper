//
//  BackGroundHelper.h
//  BackGroundHelper
//
//  Created by maso on 2019/3/18.
//  Copyright © 2019年 Hanssea. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BackGroundHelper : NSObject

/**
 创建单利

 @return BackGroundHelper
 */
+ (BackGroundHelper *)shared;

/**
 后台任务终止时保持线程
 */
- (void)keep;

/**
 应用程序变为活动状态关闭保持
 */
- (void)stop;

/**
 程序进入后台启动保活
 */
- (void)run;
@end

NS_ASSUME_NONNULL_END
