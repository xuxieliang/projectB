//
//  ViewController.m
//  UI_HIGH_长MP3播放
//
//  Created by lanou on 15/10/27.
//  Copyright (c) 2015年 xxl. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface ViewController () <AVAudioPlayerDelegate>

@property (nonatomic,strong) AVAudioPlayer *player;

@property (weak, nonatomic) IBOutlet UISlider *timeSlider;
@property (weak, nonatomic) IBOutlet UISlider *speedSlider;
@property (weak, nonatomic) IBOutlet UISlider *voiceSlider;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSURL *mp3Url = [[NSBundle mainBundle] URLForResource:@"bbqne.mp3" withExtension:nil];
    // 创建一个音乐播放器
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:mp3Url error:nil];
    // 准备播放
    [self.player prepareToPlay];
    
    // 打开可以改变速度的开关
    self.player.enableRate = YES;
    
    
    self.player.numberOfLoops = 1; // 0代表播放一次 1代表播放2次
    
    self.player.delegate = self;
    
    self.timeSlider.maximumValue = self.player.duration;
    
    // 监听音乐的中断
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleInterruption:) name:AVAudioSessionInterruptionNotification object:session];
}

- (void)handleInterruption:(NSNotification *)noti {
    if ([noti.userInfo valueForKey:AVAudioSessionInterruptionTypeKey] == 0) {
        [self.player play];
    }
}

- (IBAction)stop:(id)sender {
    [self.player stop];
    
    // 自己指定播放时间到0的位置
    self.player.currentTime = 0;
}
- (IBAction)pause:(id)sender {
    [self.player pause];
}
- (IBAction)play:(id)sender {
    // 播放
    [self.player play];
}
/**
 *  播放时间改变
 */
- (IBAction)changedTime:(UISlider *)sender {
    self.player.currentTime = sender.value;
}
/**
 *  播放速度改变
 */
- (IBAction)changeSpeed:(UISlider *)sender {
    self.player.rate = sender.value;
}
/**
 *  播放音量改变
 */
- (IBAction)changeVoice:(UISlider *)sender {
    self.player.volume = sender.value;
}

#pragma mark - AVAudioPlayerDelegate代理
#pragma mark - 音乐结束之后
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    
}





/**
 *  iOS8以前
 */
#pragma mark - 中断(电话进来)
- (void)audioPlayerBeginInterruption:(AVAudioPlayer *)player {
    
}
#pragma mark - 停止中断(电话挂了)
- (void)audioPlayerEndInterruption:(AVAudioPlayer *)player {
    [self.player play];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
