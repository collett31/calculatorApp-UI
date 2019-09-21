//
//  ViewController.h
//  iCalculate
//
//  Created by Collett Charlton on 9/8/19.
//  Copyright © 2019 Collett. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIGestureRecognizerDelegate, UITextFieldDelegate>
-(BOOL)isValidString:(NSString *)expression;
-(NSNumber *)evaluateString:(NSString *)expression;
-(void)calculate:(NSString *)exp;

@end

