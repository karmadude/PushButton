//
//  PushButtonView.h
//  PushButton
//
//  Created by Karmadude on 5/26/11.
//  Copyright 2011 VUnite Media. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

// via http://cocoamatic.blogspot.com/2010/07/uicolor-macro-with-hex-values.html
//RGB color macro
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//RGB color macro with alpha
#define UIColorFromRGBA(rgbValue,a) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

@class PushButton;

@protocol PushButtonViewDelegate

- (void) buttonSelected:(id)bv;
- (void) buttonClicked:(id)bv;

@end

@interface PushButtonView : UIControl {
    NSObject<PushButtonViewDelegate> *delegate;
    
    UILabel *textLabel;
    int radius;
    int positionUpY;
    int positionDownY;
    float shadowHeight;
    
    UIColor *defaultBorderColor;
    UIColor *selectedBorderColor;
    
    UIColor *defaultGradientColor1;
    UIColor *defaultGradientColor2;
    UIColor *defaultShadowGradientColor1;
    UIColor *defaultShadowGradientColor2;
    
    UIColor *selectedGradientColor1;
    UIColor *selectedGradientColor2;
    UIColor *selectedShadowGradientColor1;
    UIColor *selectedShadowGradientColor2;
    
    UIColor *textColor;
    UIColor *selectedTextColor;
    UIColor *textShadowColor;
    UIColor *selectedTextShadowColor;
    
    
    CAGradientLayer *contentGradientLayer;
    CAGradientLayer *shadowGradientLayer;
}

@property (assign) NSObject<PushButtonViewDelegate> *delegate;

@property (nonatomic, retain) UILabel *textLabel;
@property (nonatomic, assign) int radius;
@property (nonatomic, assign) float shadowHeight;

@property (nonatomic, retain) UIColor *defaultBorderColor;
@property (nonatomic, retain) UIColor *selectedBorderColor;

@property (nonatomic, retain) UIColor *defaultGradientColor1;
@property (nonatomic, retain) UIColor *defaultGradientColor2;
@property (nonatomic, retain) UIColor *defaultShadowGradientColor1;
@property (nonatomic, retain) UIColor *defaultShadowGradientColor2;

@property (nonatomic, retain) UIColor *selectedGradientColor1;
@property (nonatomic, retain) UIColor *selectedGradientColor2;
@property (nonatomic, retain) UIColor *selectedShadowGradientColor1;
@property (nonatomic, retain) UIColor *selectedShadowGradientColor2;

@property (nonatomic, retain) UIColor *textColor;
@property (nonatomic, retain) UIColor *selectedTextColor;
@property (nonatomic, retain) UIColor *textShadowColor;
@property (nonatomic, retain) UIColor *selectedTextShadowColor;

@property (nonatomic, retain) CAGradientLayer *contentGradientLayer;
@property (nonatomic, retain) CAGradientLayer *shadowGradientLayer;

- (void) showShadow:(BOOL)show;
- (void) triggerTouchEnded;

@end
