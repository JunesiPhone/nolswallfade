@interface SBAnimationSettings : NSObject
-(double)duration;
-(void)setDuration:(double)arg1 ;
@end

@interface SBWakeAnimationSettings : NSObject
-(SBAnimationSettings *)sleepWallpaperFilterSettings;
-(void)setAwakeWallpaperFilterSettings:(SBAnimationSettings *)arg1;
@end;

%hook SBScreenWakeAnimationController
	- (void)_startWakeAnimationsForWaking:(_Bool)arg1 animationSettings:(id)arg2{
		SBWakeAnimationSettings* aniSettings = arg2;
		SBAnimationSettings* wallSettings = [aniSettings sleepWallpaperFilterSettings];
		[wallSettings setDuration: 0.0];
		[aniSettings setAwakeWallpaperFilterSettings: wallSettings];
		arg2 = aniSettings;
		%orig;
	}
%end
