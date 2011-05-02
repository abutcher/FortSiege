//
//  FortSiegeAppDelegate.m
//  FortSiege
//
//  Created by Andrew Butcher on 2/1/11.
//  Copyright West Virginia University 2011. All rights reserved.
//

#import "cocos2d.h"
#import "FortSiegeAppDelegate.h"
#import "GameConfig.h"
#import "FortSiege.h"
#import "RootViewController.h"
#import "FortSiegeWorld.h"
#import "LevelScene.h"

@implementation FortSiegeAppDelegate

@synthesize window;

- (void) removeStartupFlicker
{
	//
	// THIS CODE REMOVES THE STARTUP FLICKER
	//
	// Uncomment the following code if you Application only supports landscape mode
	//
#if GAME_AUTOROTATION == kGameAutorotationUIViewController

//	CC_ENABLE_DEFAULT_GL_STATES();
//	CCDirector *director = [CCDirector sharedDirector];
//	CGSize size = [director winSize];
//	CCSprite *sprite = [CCSprite spriteWithFile:@"Default.png"];
//	sprite.position = ccp(size.width/2, size.height/2);
//	sprite.rotation = -90;
//	[sprite visit];
//	[[director openGLView] swapBuffers];
//	CC_ENABLE_DEFAULT_GL_STATES();
	
#endif // GAME_AUTOROTATION == kGameAutorotationUIViewController	
}
- (void) applicationDidFinishLaunching:(UIApplication*)application {
	// Init the window
	window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	// Try to use CADisplayLink director
	// if it fails (SDK < 3.1) use the default director
	if( ! [CCDirector setDirectorType:kCCDirectorTypeDisplayLink] )
		[CCDirector setDirectorType:kCCDirectorTypeDefault];
	
	CCDirector *director = [CCDirector sharedDirector];
    
	// If the rotation is going to be controlled by a UIViewController
	// then the device orientation should be "Portrait".
	[director setDeviceOrientation:kCCDeviceOrientationLandscapeLeft];
    
	[director setAnimationInterval:1.0/60];
	[director setDisplayFPS:YES];
	
	// Alloc & init the EAGLView
	//  1. Transparency (alpha blending), and device camera overlay requires an alpha channel,
	//     so must use RGBA8 color format. If not using device overlay or alpha blending
	//     (transparency) in any 3D or 2D graphics this can be changed to kEAGLColorFormatRGB565.
	//	2. 3D rendering requires a depth format of 16 bit.
	EAGLView *glView = [EAGLView viewWithFrame: [window bounds]
								   pixelFormat: kEAGLColorFormatRGBA8
								   depthFormat: GL_DEPTH_COMPONENT16_OES];
	
	// Turn on multiple touches if needed
	[glView setMultipleTouchEnabled: YES];
	
	// attach the openglView to the director
	[director setOpenGLView:glView];
    
	// Enables High Res mode (Retina Display) on iPhone 4 and maintains low res on all other devices
    //	if( ! [director enableRetinaDisplay:YES] )
    //		CCLOG(@"Retina Display Not supported");
    
	
	// make the GL view a child of the main window and present it
	[window addSubview: glView];
	[window makeKeyAndVisible];
    
	// Default texture format for PNG/BMP/TIFF/JPEG/GIF images
	// It can be RGBA8888, RGBA4444, RGB5_A1, RGB565
	// You can change anytime.
	[CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA8888];
	
	
	// ******** START OF COCOS3D SETUP CODE... ********
	
	// Create the customized 3D world.
//	cc3world = [[FortSiegeWorld mainWorld] retain];
	
	// Create the CC3 layer that supports 3D rendering and give it a nice sky-blue background
	CC3Layer* cc3Layer = [MainMenuScene node];
	cc3Layer.cc3World = [FortSiegeWorld mainWorld];	// attach 3D world to 3D layer
	
	// Start the 3D world model and schedule its periodic updates.
	[[FortSiegeWorld mainWorld] play];
	[cc3Layer scheduleUpdate];
    
	ControllableCCLayer* mainLayer = cc3Layer;
	
	// The 3D layer can run either direcly in the scene, or it can run as a smaller "sub-window"
	// within any standard CCLayer. So you can have a mostly 2D window, with a smaller 3D window
	// embedded in it. To experiment with this smaller embedded 3D window, uncomment the following lines:
    //	CGSize winSize = [[CCDirector sharedDirector] winSize];
    //	cc3Layer.position = CGPointMake(30.0, 40.0);
    //	cc3Layer.contentSize = CGSizeMake(winSize.width - 70.0, winSize.width - 40.0);
    //	cc3Layer.alignContentSizeWithDeviceOrientation = YES;
    //	mainLayer = [ControllableCCLayer layerWithColor: ccc4(0, 0, 0, 255)];
    //	[mainLayer addChild: cc3Layer];
	
	// The controller is optional. If you want to auto-rotate the view when the device orientation
	// changes, or if you want to display a device camera behind a combined 3D & 2D scene
	// (augmented reality), use a controller. Otherwise you can simply remove the following lines
	// and uncomment the lines below these lines that uses the traditional CCDirector scene startup.
	viewController = [[CCNodeController controller] retain];
	//viewController.doesAutoRotate = YES;
    viewController.wantsFullScreenLayout = YES;
	[viewController runSceneOnNode: mainLayer];		// attach the layer to the controller and run a scene with it
	
	// If a controller is NOT used, uncomment the following standard CCDirector scene startup lines,
	// and remove the lines above that reference viewContoller.
    //	CCScene *scene = [CCScene node];
    //	[scene addChild: mainLayer];
    //	[[CCDirector sharedDirector] runWithScene: scene];
	
}

- (void)applicationWillResignActive:(UIApplication *)application {
	[[CCDirector sharedDirector] pause];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
	[[CCDirector sharedDirector] resume];
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
	[[CCDirector sharedDirector] purgeCachedData];
	[[FortSiegeWorld mainWorld] cleanCaches];
}

-(void) applicationDidEnterBackground:(UIApplication*)application {
	[[CCDirector sharedDirector] stopAnimation];
}

-(void) applicationWillEnterForeground:(UIApplication*)application {
	[[CCDirector sharedDirector] startAnimation];
}

- (void)applicationWillTerminate:(UIApplication *)application {
	CCDirector *director = [CCDirector sharedDirector];
	
	[[director openGLView] removeFromSuperview];
	
	[viewController release];
	
	[window release];
	
	[director end];	
}

- (void)applicationSignificantTimeChange:(UIApplication *)application {
	[[CCDirector sharedDirector] setNextDeltaTimeZero:YES];
}

- (void)dealloc {
	[[CCDirector sharedDirector] release];
	[window release];
    [viewController release];
    [[FortSiegeWorld mainWorld] release];
	[super dealloc];
}

@end
