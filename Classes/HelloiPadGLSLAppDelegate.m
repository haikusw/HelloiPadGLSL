//
//  HelloiPadGLSLAppDelegate.m
//  HelloiPadGLSL
//
//  Created by turner on 3/23/10.
//  Copyright Douglass Turner Consulting 2010. All rights reserved.
//

#import "HelloiPadGLSLAppDelegate.h"
#import "EAGLView.h"
#import "EAGLViewController.h"

@implementation HelloiPadGLSLAppDelegate

@synthesize window		= m_window;
@synthesize controller	= m_controller;

- (void) dealloc {
	
    [m_window		release], m_window		= nil;
    [m_controller	release], m_controller	= nil;
	
    [super dealloc];
}

- (void) applicationDidFinishLaunching:(UIApplication *)application {

	NSLog(@"Hello iPad GLSL AppDelegate - application Did Finish Launching");

    [self.window addSubview:self.controller.view];
    [self.window makeKeyAndVisible];
	
}

- (void) applicationWillResignActive:(UIApplication *)application {
	
	NSLog(@"Hello iPad GLSL AppDelegate - application Will Resign Active - [glView stopAnimation]");
	
	EAGLView *glView = (EAGLView *)self.controller.view;
	[glView stopAnimation];
}

- (void) applicationDidBecomeActive:(UIApplication *)application {
	
	NSLog(@"Hello iPad GLSL AppDelegate - application Did Become Active");
	
}

- (void)applicationWillTerminate:(UIApplication *)application {
	
	NSLog(@"Hello iPad GLSL AppDelegate - application Will Terminate - [glView stopAnimation]");
	
	EAGLView *glView = (EAGLView *)self.controller.view;
	[glView stopAnimation];
}

@end
