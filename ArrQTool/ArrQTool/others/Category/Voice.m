//
//  Voice.m
//  AVideoSpeechDemo
//
//  Created by suge on 2017/3/2.
//  Copyright © 2017年 qingyun. All rights reserved.
//

#import "Voice.h"
static int lastSoundID;
@implementation Voice
/**文字转化为语音*/
+ (void)textToVoiceWithTheText:(NSString *)text{
    AVSpeechSynthesizer *av = [[AVSpeechSynthesizer alloc]init];
//    av.delegate = self;
    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc]initWithString:text];  //需要转换的文本
    
    AVSpeechSynthesisVoice *voiceType = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"];
    utterance.voice = voiceType;
    //设置语速
    //    utterance.rate *= 0.5;顾客加价100元
    //设置音量
    utterance.volume = 1.0;

    
    [av speakUtterance:utterance];

}
/**播放系统声音*/
+ (void)playSystemSound{
    AudioServicesPlaySystemSound(1007);
}
/**
 *播放指定的音频文件
 */
+ (void)playSoudWithFilePath:(NSString *)pathStr{
//    //查找声音文件（此声音文件是编者自己添加到程序包中去的）
//    NSString *filePath2 = [[NSBundle mainBundle] pathForResource:@"44th Street Medium" ofType:@"caf"];
    
    //构建URL
    NSURL *url3 = [NSURL fileURLWithPath:pathStr];
    //创建系统声音ID
    SystemSoundID soundID;
    //注册声音文件，并且将ID保存
    AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)(url3), &soundID);
    //播放声音
    AudioServicesPlaySystemSound(soundID);
    
    lastSoundID = soundID;
}
+ (void)removeLastSoundId{
    //移除注册的系统声音
    AudioServicesRemoveSystemSoundCompletion(lastSoundID);
}
/**
 *调用系统的震动
 */
+ (void)playZhenDong{
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}
@end
