//
//  PushButtonView.m
//  PushButton
//
//  Created by Karmadude on 5/26/11.
//  Copyright 2011 VUnite Media. All rights reserved.
//

#import "PushButtonView.h"


@implementation PushButtonView

@synthesize delegate;

@synthesize textLabel;
@synthesize radius;
@synthesize shadowHeight;

@synthesize defaultBorderColor;
@synthesize selectedBorderColor;

@synthesize defaultGradientColor1;
@synthesize defaultGradientColor2;
@synthesize defaultShadowGradientColor1;
@synthesize defaultShadowGradientColor2;

@synthesize selectedGradientColor1;
@synthesize selectedGradientColor2;
@synthesize selectedShadowGradientColor1;
@synthesize selectedShadowGradientColor2;

@synthesize textColor;
@synthesize selectedTextColor;
@synthesize textShadowColor;
@synthesize selectedTextShadowColor;

@synthesize contentGradientLayer;
@synthesize shadowGradientLayer;

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
        [self setOpaque:NO];
        
        self.enabled = YES;
        self.radius = 10.0f;
        
        self.layer.cornerRadius = radius;
        [self showShadow: YES];
        
        self.defaultBorderColor = UIColorFromRGB(0xdddddd);
        self.selectedBorderColor = UIColorFromRGB(0x5ea8f1);
        
        self.shadowGradientLayer = [CAGradientLayer layer];
        self.defaultShadowGradientColor1 = UIColorFromRGB(0xb3b3b3);
        self.defaultShadowGradientColor2 = UIColorFromRGB(0x939393);
        self.selectedShadowGradientColor1 = UIColorFromRGB(0x5a8cbc);
        self.selectedShadowGradientColor2 = UIColorFromRGB(0x3e6b96);
        shadowGradientLayer.colors = [NSArray arrayWithObjects:
                                      (id)defaultShadowGradientColor1.CGColor, 
                                      defaultShadowGradientColor2.CGColor, nil];
        shadowGradientLayer.locations = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.8f], [NSNumber numberWithFloat:1.0f], nil];
        shadowGradientLayer.frame = CGRectMake(0.0f, 5.0f, CGRectGetWidth(frame), CGRectGetHeight(frame) - 5.0f);
        shadowGradientLayer.cornerRadius = radius;
        [self.layer addSublayer:shadowGradientLayer];
        
        self.contentGradientLayer = [CAGradientLayer layer];
        self.defaultGradientColor1 = UIColorFromRGB(0xF4f4f4);
        self.defaultGradientColor2 = UIColorFromRGB(0xe5e5e5);
        self.selectedGradientColor1 = UIColorFromRGB(0x79bbfb);
        self.selectedGradientColor2 = UIColorFromRGB(0x5faff2);
        contentGradientLayer.colors = [NSArray arrayWithObjects:
                                       (id)defaultGradientColor1.CGColor, 
                                       defaultGradientColor2.CGColor, nil];
        contentGradientLayer.frame = CGRectMake(0.0f, 0.0f, CGRectGetWidth(frame), CGRectGetHeight(frame) - 7.0f);
        contentGradientLayer.cornerRadius = radius;
        contentGradientLayer.borderWidth= 1.0f;
        contentGradientLayer.borderColor = defaultBorderColor.CGColor;
        [self.layer addSublayer:contentGradientLayer];
        positionUpY = contentGradientLayer.position.y;
        positionDownY = positionUpY + 5.0f;
        
        self.textColor = UIColorFromRGB(0xbebebe);
        self.selectedTextColor = UIColorFromRGB(0xffffff);
        self.textShadowColor = UIColorFromRGBA(0xffffff, 0.75f);
        self.selectedTextShadowColor = UIColorFromRGBA(0x000000, 0.45f);
        
        self.textLabel = [[[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.bounds.size.width, self.bounds.size.height - 7.0f)] autorelease];
        [self.textLabel setBackgroundColor:[UIColor clearColor]];
        [self.textLabel setShadowColor:textShadowColor];
        [self.textLabel setShadowOffset:CGSizeMake(0, 1)];
        self.textLabel.font = [UIFont boldSystemFontOfSize:self.bounds.size.height * 18.0f / 54.0f];
        self.textLabel.textColor = textColor;
        self.textLabel.textAlignment = UITextAlignmentCenter;
        self.textLabel.text = @"Push Button";
        [contentGradientLayer addSublayer:textLabel.layer];
        
        [self addTarget:self action:@selector(highlightStateChanged) forControlEvents:UIControlStateHighlighted];
        [self addTarget:self action:@selector(selectedStateChanged) forControlEvents:UIControlStateSelected];
    }
    return self;
}

- (void)highlightStateChanged {
    if( self.highlighted ) {
        [self showShadow: NO];
        self.contentGradientLayer.position = CGPointMake(contentGradientLayer.position.x, 
                                                         positionDownY);
    } else {
        [self showShadow: YES];
        self.contentGradientLayer.position = CGPointMake(contentGradientLayer.position.x, 
                                                         positionUpY);
    }
}

- (void)selectedStateChanged {
    if(self.selected) {
        shadowGradientLayer.colors = [NSArray arrayWithObjects:
                                      (id)selectedShadowGradientColor1.CGColor, 
                                      selectedShadowGradientColor2.CGColor, nil];
        contentGradientLayer.colors = [NSArray arrayWithObjects:
                                       (id)selectedGradientColor1.CGColor, 
                                       selectedGradientColor2.CGColor, nil];
        contentGradientLayer.borderColor = selectedBorderColor.CGColor;
        
        textLabel.textColor = selectedTextColor;
        [textLabel setShadowColor:selectedTextShadowColor];
    } else {
        [self showShadow: YES];
        shadowGradientLayer.colors = [NSArray arrayWithObjects:
                                      (id)defaultShadowGradientColor1.CGColor, 
                                      defaultShadowGradientColor2.CGColor, nil];
        contentGradientLayer.colors = [NSArray arrayWithObjects:
                                       (id)defaultGradientColor1.CGColor, 
                                       defaultGradientColor2.CGColor, nil];
        contentGradientLayer.borderColor = defaultBorderColor.CGColor;
        
        textLabel.textColor = textColor;
        [textLabel setShadowColor:textShadowColor];
    }
    
    if(delegate != nil && [delegate respondsToSelector:@selector(buttonSelected:)])
        [delegate buttonSelected:self];
}

- (void) triggerTouchEnded {
    self.selected = !self.selected;
    if(delegate != nil && 
       [delegate respondsToSelector:@selector(buttonClicked:)]) 
    {
        [delegate buttonClicked:self];
    }
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    [self sendActionsForControlEvents:UIControlStateSelected];
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    [self sendActionsForControlEvents:UIControlStateHighlighted];
}

- (void) showShadow:(BOOL)show {
    if(show) {
        self.layer.shadowColor = UIColorFromRGB(0xCFCFCF).CGColor;
        self.layer.shadowOffset = CGSizeMake(0.0f, 2.0f);
        self.layer.shadowOpacity = 1.0f;
        self.layer.shadowRadius = 3.0f;
    } else {
        self.layer.shadowOpacity = 0.0f;
    }
    
}

- (void) layoutSubviews {
    
}

/*// Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 
 }
 */

- (BOOL)beginTrackingWithTouch:(UITouch*)touch withEvent:(UIEvent*)event
{
	return [super beginTrackingWithTouch:touch withEvent:event];
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint point = [touch locationInView:self];

    if(CGRectContainsPoint(self.bounds, point)) {
        self.highlighted = YES;
    } else {
        self.highlighted = NO;
    }
	return [super continueTrackingWithTouch:touch withEvent:event];
}


- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
	CGPoint point = [touch locationInView:self];
    
    self.highlighted = NO;
    if(CGRectContainsPoint(self.bounds, point)) {
        [self triggerTouchEnded];
    }
        
    [super endTrackingWithTouch:touch withEvent:event];
}

- (NSString *)description {
    return textLabel.text;
}

- (void)dealloc {
    self.delegate = nil;
    
    self.textLabel = nil;
    
    self.defaultBorderColor = nil;
    self.selectedBorderColor = nil;
    
    self.defaultGradientColor1=nil;
    self.defaultGradientColor2=nil;
    self.defaultShadowGradientColor1=nil;
    self.defaultShadowGradientColor2=nil;
    
    self.selectedGradientColor1=nil;
    self.selectedGradientColor2=nil;
    self.selectedShadowGradientColor1=nil;
    self.selectedShadowGradientColor2=nil;
    
    self.textColor = nil;
    self.selectedTextColor = nil;
    self.textShadowColor = nil;
    self.selectedTextShadowColor = nil;
    
    self.contentGradientLayer=nil;
    self.shadowGradientLayer=nil;
    
    [super dealloc];
}


@end