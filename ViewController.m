//
//  ViewController.m
//  iCalculate
//
//  Created by Collett Charlton on 9/8/19.
//  Copyright © 2019 Collett. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property UITextField *displayText;
@property UILabel *titleLabel;
@property UIButton *one;
@property UIButton *two;
@property UIButton *three;
@property UIButton *four;
@property UIButton *five;
@property UIButton *six;
@property UIButton *seven;
@property UIButton *eight;
@property UIButton *nine;
@property UIButton *zero;
@property UIButton *equal;
@property UIButton *decimal;
@property UIButton *add;
@property UIButton *subtract;
@property UIButton *divide;
@property UIButton *multiply;
@property NSString *expression;
@property NSInteger value;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    NSLog(@"%f",self.view.frame.size.height);
    NSLog(@"%f",self.view.frame.size.width);
    self.displayText.allowsEditingTextAttributes =NO;
    self.expression = @"";
    
    //notification to tell when the orientation changes
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
        [[NSNotificationCenter defaultCenter]
         addObserver:self selector:@selector(orientationChanged:)
         name:UIDeviceOrientationDidChangeNotification
         object:[UIDevice currentDevice]];
}

- (void) orientationChanged:(NSNotification *)note
{
    UIDevice * device = note.object;
    [self.one removeFromSuperview];
    [self.two removeFromSuperview];
    [self.three removeFromSuperview];
    [self.four removeFromSuperview];
    [self.five removeFromSuperview];
    [self.six removeFromSuperview];
    [self.seven removeFromSuperview];
    [self.eight removeFromSuperview];
    [self.nine removeFromSuperview];
    [self.zero removeFromSuperview];
    [self.titleLabel removeFromSuperview];
    [self.displayText removeFromSuperview];
    [self.add removeFromSuperview];
    [self.subtract removeFromSuperview];
    [self.multiply removeFromSuperview];
    [self.divide removeFromSuperview];
    [self.decimal removeFromSuperview];

    if( device.orientation ==  UIDeviceOrientationPortrait || device.orientation == UIDeviceOrientationPortraitUpsideDown )
    {
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.1,self.view.frame.size.height*0.13,300, 40)];
        self.titleLabel.text = @"iCalculate";
        [self.view addSubview:self.titleLabel];
        self.titleLabel.textColor = [UIColor lightGrayColor];
        
        
        self.displayText = [[UITextField alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.1,self.view.frame.size.height*0.2,self.view.frame.size.width -self.view.frame.size.width*0.2 , self.view.frame.size.height*0.4)];
        [self.view addSubview:self.displayText];
        self.displayText.textColor = [UIColor redColor];
        self.displayText.backgroundColor = [UIColor blackColor];
        self.displayText.text = @"0";
        
        self.one = [UIButton buttonWithType:UIButtonTypeSystem];
        self.one.frame = CGRectMake(self.view.frame.size.width*0.1,self.view.frame.size.height*0.5,34, 50);
        [self.one setTitle:@"1" forState:UIControlStateNormal];
        [self.view addSubview:self.one];
        
        self.two = [UIButton buttonWithType:UIButtonTypeSystem];
        self.two.frame = CGRectMake(self.view.frame.size.width*0.325,self.view.frame.size.height*0.5,34, 50);
        [self.two setTitle:@"2" forState:UIControlStateNormal];
        [self.view addSubview:self.two];
        
        self.three = [UIButton buttonWithType:UIButtonTypeSystem];
        self.three.frame = CGRectMake(self.view.frame.size.width*0.575,self.view.frame.size.height*0.5,34, 50);
        [self.three setTitle:@"3" forState:UIControlStateNormal];
        [self.view addSubview:self.three];
        
        self.four = [UIButton buttonWithType:UIButtonTypeSystem];
        self.four.frame = CGRectMake(self.view.frame.size.width*0.1,self.view.frame.size.height*0.60,34, 50);
        [self.four setTitle:@"4" forState:UIControlStateNormal];
        [self.view addSubview:self.four];
        
        self.five = [UIButton buttonWithType:UIButtonTypeSystem];
        self.five.frame = CGRectMake(self.view.frame.size.width*0.325,self.view.frame.size.height*0.6,34, 50);
        [self.five setTitle:@"5" forState:UIControlStateNormal];
        [self.view addSubview:self.five];
        
        self.six = [UIButton buttonWithType:UIButtonTypeSystem];
        self.six.frame = CGRectMake(self.view.frame.size.width*0.575,self.view.frame.size.height*0.6,34, 50);
        [self.six setTitle:@"6" forState:UIControlStateNormal];
        [self.view addSubview:self.six];
        
        self.seven = [UIButton buttonWithType:UIButtonTypeSystem];
        self.seven.frame = CGRectMake(self.view.frame.size.width*0.1,self.view.frame.size.height*0.7,34, 50);
        [self.seven setTitle:@"7" forState:UIControlStateNormal];
        [self.view addSubview:self.seven];
        
        self.eight = [UIButton buttonWithType:UIButtonTypeSystem];
        self.eight.frame = CGRectMake(self.view.frame.size.width*0.325,self.view.frame.size.height*0.7,34, 50);
        [self.eight setTitle:@"8" forState:UIControlStateNormal];
        [self.view addSubview:self.eight];
        
        self.nine = [UIButton buttonWithType:UIButtonTypeSystem];
        self.nine.frame = CGRectMake(self.view.frame.size.width*0.575,self.view.frame.size.height*0.7,34, 50);
        [self.nine setTitle:@"9" forState:UIControlStateNormal];
        [self.view addSubview:self.nine];
        
        self.zero = [UIButton buttonWithType:UIButtonTypeSystem];
        self.zero.frame = CGRectMake(self.view.frame.size.width*0.1,self.view.frame.size.height*0.8,34, 50);
        [self.zero setTitle:@"0" forState:UIControlStateNormal];
        [self.view addSubview:self.zero];
        
        self.decimal = [UIButton buttonWithType:UIButtonTypeSystem];
        self.decimal.frame = CGRectMake(self.view.frame.size.width*0.325,self.view.frame.size.height*0.8,34, 50);
        [self.decimal setTitle:@"." forState:UIControlStateNormal];
        [self.view addSubview:self.decimal];
        
        self.equal = [UIButton buttonWithType:UIButtonTypeSystem];
        self.equal.frame = CGRectMake(self.view.frame.size.width*0.575,self.view.frame.size.height*0.8,34, 50);
        [self.equal setTitle:@"=" forState:UIControlStateNormal];
        [self.view addSubview:self.equal];
        
        self.add = [UIButton buttonWithType:UIButtonTypeSystem];
        self.add.frame = CGRectMake(self.view.frame.size.width*0.8,self.view.frame.size.height*0.5,34, 50);
        [self.add setTitle:@"+" forState:UIControlStateNormal];
        [self.view addSubview:self.add];
        
        self.subtract = [UIButton buttonWithType:UIButtonTypeSystem];
        self.subtract.frame = CGRectMake(self.view.frame.size.width*0.8,self.view.frame.size.height*0.60,34, 50);
        [self.subtract setTitle:@"-" forState:UIControlStateNormal];
        [self.view addSubview:self.subtract];
        
        self.multiply = [UIButton buttonWithType:UIButtonTypeSystem];
        self.multiply.frame = CGRectMake(self.view.frame.size.width*0.8,self.view.frame.size.height*0.7,34, 50);
        [self.multiply setTitle:@"*" forState:UIControlStateNormal];
        [self.view addSubview:self.multiply];
        
        self.divide = [UIButton buttonWithType:UIButtonTypeSystem];
        self.divide.frame = CGRectMake(self.view.frame.size.width*0.8,self.view.frame.size.height*0.8,34, 50);
        [self.divide setTitle:@"/" forState:UIControlStateNormal];
        [self.view addSubview:self.divide];

    }

    else if ( device.orientation ==  UIDeviceOrientationLandscapeLeft || device.orientation ==  UIDeviceOrientationLandscapeRight )
    {
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.1,self.view.frame.size.height*0.05,200, 40)];
        self.titleLabel.text = @"iCalculate";
        [self.view addSubview:self.titleLabel];
        self.titleLabel.textColor = [UIColor lightGrayColor];
        
        self.displayText = [[UITextField alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.1,self.view.frame.size.height*0.15,self.view.frame.size.width -self.view.frame.size.width*0.2 , self.view.frame.size.height*0.35)];
        [self.view addSubview:self.displayText];
        self.displayText.textColor = [UIColor redColor];
        self.displayText.backgroundColor = [UIColor blackColor];
        
        self.one = [UIButton buttonWithType:UIButtonTypeSystem];
        self.one.frame = CGRectMake(self.view.frame.size.width*0.1,self.view.frame.size.height*0.55,34, 50);
        [self.one setTitle:@"1" forState:UIControlStateNormal];
        [self.view addSubview:self.one];
        
        self.two = [UIButton buttonWithType:UIButtonTypeSystem];
        self.two.frame = CGRectMake(self.view.frame.size.width*0.3,self.view.frame.size.height*0.55,34, 50);
        [self.two setTitle:@"2" forState:UIControlStateNormal];
        [self.view addSubview:self.two];
        
        self.three = [UIButton buttonWithType:UIButtonTypeSystem];
        self.three.frame = CGRectMake(self.view.frame.size.width*0.5,self.view.frame.size.height*0.55,34, 50);
        [self.three setTitle:@"3" forState:UIControlStateNormal];
        [self.view addSubview:self.three];
        
        self.four = [UIButton buttonWithType:UIButtonTypeSystem];
        self.four.frame = CGRectMake(self.view.frame.size.width*0.1,self.view.frame.size.height*0.65,34, 50);
        [self.four setTitle:@"4" forState:UIControlStateNormal];
        [self.view addSubview:self.four];
        
        self.five = [UIButton buttonWithType:UIButtonTypeSystem];
        self.five.frame = CGRectMake(self.view.frame.size.width*0.3,self.view.frame.size.height*0.65,34, 50);
        [self.five setTitle:@"5" forState:UIControlStateNormal];
        [self.view addSubview:self.five];
        
        self.six = [UIButton buttonWithType:UIButtonTypeSystem];
        self.six.frame = CGRectMake(self.view.frame.size.width*0.5,self.view.frame.size.height*0.65,34, 50);
        [self.six setTitle:@"6" forState:UIControlStateNormal];
        [self.view addSubview:self.six];
        
        self.seven = [UIButton buttonWithType:UIButtonTypeSystem];
        self.seven.frame = CGRectMake(self.view.frame.size.width*0.1,self.view.frame.size.height*0.75,34, 50);
        [self.seven setTitle:@"7" forState:UIControlStateNormal];
        [self.view addSubview:self.seven];
        
        self.eight = [UIButton buttonWithType:UIButtonTypeSystem];
        self.eight.frame = CGRectMake(self.view.frame.size.width*0.3,self.view.frame.size.height*0.75,34, 50);
        [self.eight setTitle:@"8" forState:UIControlStateNormal];
        [self.view addSubview:self.eight];
        
        self.nine = [UIButton buttonWithType:UIButtonTypeSystem];
        self.nine.frame = CGRectMake(self.view.frame.size.width*0.5,self.view.frame.size.height*0.75,34, 50);
        [self.nine setTitle:@"9" forState:UIControlStateNormal];
        [self.view addSubview:self.nine];
        
        self.zero = [UIButton buttonWithType:UIButtonTypeSystem];
        self.zero.frame = CGRectMake(self.view.frame.size.width*0.1,self.view.frame.size.height*0.85,34, 50);
        [self.zero setTitle:@"0" forState:UIControlStateNormal];
        [self.view addSubview:self.zero];
        
        self.decimal = [UIButton buttonWithType:UIButtonTypeSystem];
        self.decimal.frame = CGRectMake(self.view.frame.size.width*0.3,self.view.frame.size.height*0.85,34, 50);
        [self.decimal setTitle:@"." forState:UIControlStateNormal];
        [self.view addSubview:self.decimal];
        
        self.equal = [UIButton buttonWithType:UIButtonTypeSystem];
        self.equal.frame = CGRectMake(self.view.frame.size.width*0.5,self.view.frame.size.height*0.85,34, 50);
        [self.equal setTitle:@"=" forState:UIControlStateNormal];
        [self.view addSubview:self.equal];
        
        self.add = [UIButton buttonWithType:UIButtonTypeSystem];
        self.add.frame = CGRectMake(self.view.frame.size.width*0.7,self.view.frame.size.height*0.55,34, 50);
        [self.add setTitle:@"+" forState:UIControlStateNormal];
        [self.view addSubview:self.add];
        
        self.subtract = [UIButton buttonWithType:UIButtonTypeSystem];
        self.subtract.frame = CGRectMake(self.view.frame.size.width*0.7,self.view.frame.size.height*0.65,34, 50);
        [self.subtract setTitle:@"-" forState:UIControlStateNormal];
        [self.view addSubview:self.subtract];
        
        self.multiply = [UIButton buttonWithType:UIButtonTypeSystem];
        self.multiply.frame = CGRectMake(self.view.frame.size.width*0.7,self.view.frame.size.height*0.75,34, 50);
        [self.multiply setTitle:@"*" forState:UIControlStateNormal];
        [self.view addSubview:self.multiply];
        
        self.divide = [UIButton buttonWithType:UIButtonTypeSystem];
        self.divide.frame = CGRectMake(self.view.frame.size.width*0.7,self.view.frame.size.height*0.85,34, 50);
        [self.divide setTitle:@"/" forState:UIControlStateNormal];
        [self.view addSubview:self.divide];

    }
    self.one.titleLabel.font = [UIFont systemFontOfSize:30];
    self.two.titleLabel.font = [UIFont systemFontOfSize:30];
    self.three.titleLabel.font = [UIFont systemFontOfSize:30];
    self.four.titleLabel.font = [UIFont systemFontOfSize:30];
    self.five.titleLabel.font = [UIFont systemFontOfSize:30];
    self.six.titleLabel.font = [UIFont systemFontOfSize:30];
    self.seven.titleLabel.font = [UIFont systemFontOfSize:30];
    self.eight.titleLabel.font = [UIFont systemFontOfSize:30];
    self.nine.titleLabel.font = [UIFont systemFontOfSize:30];
    self.zero.titleLabel.font = [UIFont systemFontOfSize:30];
    self.add.titleLabel.font = [UIFont systemFontOfSize:30];
    self.multiply.titleLabel.font = [UIFont systemFontOfSize:30];
    self.subtract.titleLabel.font = [UIFont systemFontOfSize:30];
    self.divide.titleLabel.font = [UIFont systemFontOfSize:30];
    self.equal.titleLabel.font = [UIFont systemFontOfSize:30];
    self.decimal.titleLabel.font = [UIFont systemFontOfSize:30];
    self.titleLabel.font = [UIFont systemFontOfSize:40];
    self.displayText.font = [UIFont systemFontOfSize:45];

    self.equal.tag = 15;
    
    [self.one addTarget:self action:@selector(expression:) forControlEvents:UIControlEventTouchUpInside];
    [self.two addTarget:self action:@selector(expression:) forControlEvents:UIControlEventTouchUpInside];
    [self.three addTarget:self action:@selector(expression:) forControlEvents:UIControlEventTouchUpInside];
    [self.four addTarget:self action:@selector(expression:) forControlEvents:UIControlEventTouchUpInside];
    [self.five addTarget:self action:@selector(expression:) forControlEvents:UIControlEventTouchUpInside];
    [self.six addTarget:self action:@selector(expression:) forControlEvents:UIControlEventTouchUpInside];
    [self.seven addTarget:self action:@selector(expression:) forControlEvents:UIControlEventTouchUpInside];
    [self.eight addTarget:self action:@selector(expression:) forControlEvents:UIControlEventTouchUpInside];
    [self.nine addTarget:self action:@selector(expression:) forControlEvents:UIControlEventTouchUpInside];
    [self.zero addTarget:self action:@selector(expression:) forControlEvents:UIControlEventTouchUpInside];
    [self.decimal addTarget:self action:@selector(expression:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.add addTarget:self action:@selector(expression:) forControlEvents:UIControlEventTouchUpInside];
    [self.subtract addTarget:self action:@selector(expression:) forControlEvents:UIControlEventTouchUpInside];
    [self.multiply addTarget:self action:@selector(expression:) forControlEvents:UIControlEventTouchUpInside];
    [self.divide addTarget:self action:@selector(expression:) forControlEvents:UIControlEventTouchUpInside];
    [self.equal addTarget:self action:@selector(expression:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //self.displayText.text = @"0";
    [self.displayText endEditing:YES];
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return NO;  // Hide both keyboard and blinking cursor.
}

-(void)expression:(UIButton *)sender{
    // sender is the object that was tapped, in this case its the button.
    NSLog(@"%ld",(long)sender.tag);
    if (sender.tag != 15) {//this is the equal sign tag number
        self.expression = [self.expression stringByAppendingString:sender.currentTitle];
        self.displayText.text = self.expression;
    }
    else
    {
        @try {
            unichar firstChar = [[self.expression uppercaseString] characterAtIndex:0];
            unichar lastChar = [[self.expression uppercaseString] characterAtIndex:[self.expression length]-1];
            if (firstChar == '+' || firstChar == '*'|| firstChar == '/' || lastChar == '+' || lastChar == '-'|| lastChar == '*'|| lastChar == '/') {
                self.displayText.text = @"Invalid expression";
                self.expression = @"";
            }
            else {
                    NSExpression *expression = [NSExpression expressionWithFormat:self.expression];
                    NSNumber *result = [expression expressionValueWithObject:nil context:nil];
                    self.displayText.text = [result stringValue];
                    self.expression = @"";
            }
        }
        @catch (NSException *exception){
            self.displayText.text = @"Invalid expression";
            self.expression = @"";
        }
    }
}

@end
