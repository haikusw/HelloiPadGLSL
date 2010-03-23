//
//  EAGLView.m
//  HelloiPadGLSL
//
//  Created by turner on 3/23/10.
//  Copyright Douglass Turner Consulting 2010. All rights reserved.
//

#import "EAGLView.h"
#import "ES2Renderer.h"

@implementation EAGLView

@synthesize displayLink = _displayLink;
@synthesize renderer = _renderer;
@synthesize animating = _animating;

@dynamic animationFrameInterval;

+ (Class)layerClass {
    return [CAEAGLLayer class];
}

- (void)dealloc {
	
    [_displayLink	release], _displayLink	= nil;
    [_renderer		release], _renderer		= nil;
	
    [super dealloc];
}

- (id)initWithCoder:(NSCoder*)coder {    
	
    if ((self = [super initWithCoder:coder])) {
		
        CAEAGLLayer *eaglLayer = (CAEAGLLayer *)self.layer;

        eaglLayer.opaque = YES;
        eaglLayer.drawableProperties = 
		[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:NO], 
		 kEAGLDrawablePropertyRetainedBacking, 
		 kEAGLColorFormatRGBA8, 
		 kEAGLDrawablePropertyColorFormat, 
		 nil];

        self.renderer = [[[ES2Renderer alloc] init] autorelease];

		if (!self.renderer) {
			
			[self release];
			return nil;
			
		} // if (!self.renderer)
 
		self.animating			= NO;
		animationFrameInterval = 1;
		self.displayLink		= nil;
		
        // A system version of 3.1 or greater is required to use CADisplayLink. 
        NSString *currentSystemVersion = [[UIDevice currentDevice] systemVersion];
        NSString *requiredSystemVersion = @"3.1";
		
		NSLog(@"CurrentSystem: %@ RequiredSystem: %@", currentSystemVersion, requiredSystemVersion);
				
    } // if ((self = [super initWithCoder:coder]))

    return self;
}

- (void)drawView:(id)sender {
	
    [self.renderer render];
}

- (void)layoutSubviews {
	
    [self.renderer resizeFromLayer:(CAEAGLLayer*)self.layer];
    [self drawView:nil];
}

- (NSInteger)animationFrameInterval {
	
    return animationFrameInterval;
}

- (void)setAnimationFrameInterval:(NSInteger)frameInterval {
	
    // Frame interval defines how many display frames must pass between each time the
    // display link fires. The display link will only fire 30 times a second when the
    // frame internal is two on a display that refreshes 60 times a second. The default
    // frame interval setting of one will fire 60 times a second when the display refreshes
    // at 60 times a second. A frame interval setting of less than one results in undefined
    // behavior.
    if (frameInterval >= 1) {
		
		animationFrameInterval = frameInterval;
		
        if (self.isAnimating) {
			
            [self stopAnimation];
            [self startAnimation];
			
        } // if (self.isAnimating)
		
    } // if (frameInterval >= 1)
}

- (void)startAnimation {
	
    if (!self.isAnimating) {
		
		self.displayLink = [NSClassFromString(@"CADisplayLink") displayLinkWithTarget:self selector:@selector(drawView:)];
		[self.displayLink setFrameInterval:animationFrameInterval];
		[self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
			
        self.animating = YES;
		
    }  // if (!self.isAnimating)
	
}

- (void)stopAnimation {
	
    if (self.isAnimating) {
		
		[self.displayLink invalidate];
		self.displayLink = nil;

        self.animating = NO;
		
    } // if (self.isAnimating)
	
}

@end
