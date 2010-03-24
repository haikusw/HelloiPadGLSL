//
//  HelloiPadGLSLAppDelegate.h
//  HelloiPadGLSL
//
//  Created by turner on 3/23/10.
//  Copyright Douglass Turner Consulting 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EAGLViewController;

@interface HelloiPadGLSLAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow			*m_window;
	EAGLViewController	*m_controller;
}

@property (nonatomic, retain) IBOutlet UIWindow				*window;
@property (nonatomic, retain) IBOutlet EAGLViewController	*controller;

@end
