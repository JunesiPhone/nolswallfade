/* classes skipped for brevity */
@interface SBAnimationSettings : NSObject
@property (assign, nonatomic) CGFloat duration;
@end

@interface SBWakeAnimationSettings : NSObject
@property (nonatomic, retain) SBAnimationSettings *sleepWallpaperFilterSettings;
@property (nonatomic, retain) SBAnimationSettings *awakeWallpaperFilterSettings;
@end;

%hook SBScreenWakeAnimationController
    - (void)_startWakeAnimationsForWaking:(BOOL)isWaking animationSettings:(SBWakeAnimationSettings *)animationSettings {
        SBAnimationSettings *wallSettings = animationSettings.sleepWallpaperFilterSettings;
        wallSettings.duration = 0;
        animationSettings.awakeWallpaperFilterSettings = wallSettings;
        
        %orig;
    }
%end
