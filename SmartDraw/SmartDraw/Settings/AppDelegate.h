//
//  AppDelegate.h
//  SmartDraw
//
//  Created by Fabrice Froehly on 01/09/2020.
//  Copyright © 2020 Fabrice Froehly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

