//
//  Voice.h
//  AVideoSpeechDemo
//
//  Created by suge on 2017/3/2.
//  Copyright © 2017年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>
@interface Voice : NSObject <AVSpeechSynthesizerDelegate>
/**文字转化为语音*/
+ (void)textToVoiceWithTheText:(NSString *)text;
/**播放系统声音*/
+ (void)playSystemSound;
/**
 *播放指定的音频文件
 */
+ (void)playSoudWithFilePath:(NSString *)pathStr;
/**
 *移除注册的音频ID
 */
+ (void)removeLastSoundId;
/**
 *调用系统的震动
 */
+ (void)playZhenDong;
@end
