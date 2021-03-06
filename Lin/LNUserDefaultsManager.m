//
//  LNUserDefaultsManager.m
//  Lin
//
//  Created by Tanaka Katsuma on 2013/09/22.
//  Copyright (c) 2013年 Tanaka Katsuma. All rights reserved.
//

#import "LNUserDefaultsManager.h"

static NSString * const LNUserDefaultManagerEnabledKey = @"jp.questbeat.Lin.enabled";
static NSString * const LNUserDefinedSearchPatternKey = @"cn.jasonhotsauce.Lin.searchPattern";
@implementation LNUserDefaultsManager

+ (instancetype)sharedManager
{
    static id _sharedManager;
	static dispatch_once_t _onceToken;
    
	dispatch_once(&_onceToken, ^{
		_sharedManager = [[self alloc] init];
	});
    
    return _sharedManager;
}

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        // Register defaults
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults registerDefaults:@{LNUserDefaultManagerEnabledKey: @(YES)}];
        [userDefaults synchronize];
    }
    
    return self;
}


#pragma mark - Accessors

- (void)setEnabled:(BOOL)enabled
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:enabled forKey:LNUserDefaultManagerEnabledKey];
    [userDefaults synchronize];
}

- (BOOL)isEnabled
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults boolForKey:LNUserDefaultManagerEnabledKey];
}

- (NSArray *)userDefinedSearchPatterns
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *storedData = [userDefaults objectForKey:LNUserDefinedSearchPatternKey];
    return [NSKeyedUnarchiver unarchiveObjectWithData:storedData];
}

- (void)setUserDefinedSearchPatterns:(NSArray *)userDefinedSearchPatterns
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:userDefinedSearchPatterns];
    [userDefaults setObject:encodedObject forKey:LNUserDefinedSearchPatternKey];
    [userDefaults synchronize];
}

@end
