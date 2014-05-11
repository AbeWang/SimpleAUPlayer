//
//  KKViewController.m
//  AUSimplePlayer
//
//  Created by Abe on 14/5/9.
//

#import "KKViewController.h"
#import "KKEQListViewController.h"
#import "AUSimplePlayer.h"

@implementation KKViewController

- (void)loadView
{
	[super loadView];

	songLengthLabel.text = @"";
	[AUSimplePlayer sharedPlayer].delegate = self;
}

- (IBAction)playSong:(id)sender
{
	if ([[AUSimplePlayer sharedPlayer] isPlaying]) {
		return;
	}
	[[AUSimplePlayer sharedPlayer] playLocalFile:[NSURL fileURLWithPath:@"/Users/abe/Documents/test.mp3"]];
}

- (IBAction)showEQList:(id)sender
{
    if ([AUSimplePlayer sharedPlayer].isPlaying) {
        KKEQListViewController *EQListViewController = [[KKEQListViewController alloc] initWithStyle:UITableViewStylePlain];
        UINavigationController *naviController = [[UINavigationController alloc] initWithRootViewController:EQListViewController];
        [self presentViewController:naviController animated:YES completion:nil];
    }
}

- (IBAction)play:(id)sender
{
	[[AUSimplePlayer sharedPlayer] play];
}

- (IBAction)pause:(id)sender
{
	[[AUSimplePlayer sharedPlayer] pause];
}

- (IBAction)stop:(id)sender
{
	[[AUSimplePlayer sharedPlayer] stop];
}

#pragma mark AUSimplePlayer Delegates

- (void)simplePlayerDidStartPlaying:(AUSimplePlayer *)inPlayer
{
	NSLog(@"%s", __PRETTY_FUNCTION__);
}
- (void)simplePlayerDidPausePlaying:(AUSimplePlayer *)inPlayer
{
	NSLog(@"%s", __PRETTY_FUNCTION__);
}
- (void)simplePlayerDidStopPlaying:(AUSimplePlayer *)inPlayer
{
	NSLog(@"%s", __PRETTY_FUNCTION__);
}
- (void)simplePlayer:(AUSimplePlayer *)inPlayer updateSongLength:(NSTimeInterval)inLength
{
	NSLog(@"%s", __PRETTY_FUNCTION__);
	songLengthLabel.text = [NSString stringWithFormat:@"%f", inLength];
}

@end
