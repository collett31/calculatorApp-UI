//
//  AppDelegate.h
//  iCalculate
//
//  Created by Collett Charlton on 9/8/19.
//  Copyright © 2019 Collett. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

