//
//  AppDelegate.m
//  iTunesSBApp-macOS
//
//  Created by TakahashiNobuhiro on 2018/08/01.
//  Copyright © 2018 feb19. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    iTunesApplication *iTunes = [SBApplication applicationWithBundleIdentifier:@"com.apple.iTunes"];
    if ( [iTunes isRunning] ) {
        int originalVolume;
        originalVolume = [[NSNumber numberWithDouble:[iTunes soundVolume]] intValue];
        NSLog(@"%d", originalVolume);
        NSLog(@"%@", [iTunes currentTrack]);
        NSLog(@"%@", [[iTunes currentTrack] name]);
        NSLog(@"%@", [[iTunes currentTrack] artist]);
        NSLog(@"%@", [[iTunes currentTrack] album]);
        NSLog(@"%@", [[iTunes currentTrack] albumArtist]);
        NSLog(@"%ld", (long)[[iTunes currentTrack] trackCount]);
        NSLog(@"%ld", (long)[[iTunes currentTrack] trackNumber]);
        NSLog(@"%ld", (long)[[iTunes currentTrack] albumRating]);
        NSLog(@"%ld", (long)[[iTunes currentTrack] rating]);
        NSLog(@"%d", [[iTunes currentTrack] albumLoved]);
        NSLog(@"%@", [[iTunes currentTrack] artworks]);
        NSLog(@"%ld", (long)[[iTunes currentTrack] bpm]);
        NSLog(@"%@", [[iTunes currentTrack] composer]);
        NSLog(@"%@", [[iTunes currentTrack] category]);
        NSLog(@"%ld", (long)[[iTunes currentTrack] discCount]);
        NSLog(@"%ld", (long)[[iTunes currentTrack] discNumber]);
        NSLog(@"%@", [[iTunes currentTrack] time]);
        NSLog(@"%ld", (long)[[iTunes currentTrack] playedCount]);
        NSLog(@"%f", [iTunes playerPosition]);
    }
    
    
    [[NSDistributedNotificationCenter defaultCenter] addObserver:self
                                                        selector:@selector(updateTrackInfoFromITunes:)
                                                            name:@"com.apple.iTunes.playerInfo"
                                                          object:nil];
    [[NSDistributedNotificationCenter defaultCenter] addObserver:self
                                                        selector:@selector(updateTrackInfoFromSpotify:)
                                                            name:@"com.spotify.client.PlaybackStateChanged"
                                                          object:nil];
    

}
- (void)updateTrackInfoFromSpotify: (NSNotification *)notification
{
    NSLog(@"%@", notification.userInfo);
}
- (void)updateTrackInfoFromITunes: (NSNotification *)notification
{
    NSLog(@"%@", notification.userInfo);
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
