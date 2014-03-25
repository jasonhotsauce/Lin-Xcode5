//
//  LNRegularExpressionPattern+type.m
//  Lin
//
//  Created by Tanaka Katsuma on 2013/08/21.
//  Copyright (c) 2013年 Tanaka Katsuma. All rights reserved.
//

#import "LNRegularExpressionPattern+type.h"
#import <objc/runtime.h>

static NSString * const LNRegularExpressionPatternTypePropertyKey = @"type";

@implementation LNRegularExpressionPattern (type)

- (LNEntityType)type
{
    return [objc_getAssociatedObject(self, (__bridge const void *)(LNRegularExpressionPatternTypePropertyKey)) unsignedIntegerValue];
}

- (void)setType:(LNEntityType)type
{
    objc_setAssociatedObject(self, (__bridge const void *)(LNRegularExpressionPatternTypePropertyKey), @(type), OBJC_ASSOCIATION_ASSIGN);
}

+ (instancetype)patternWithType:(LNEntityType)type
{
    LNRegularExpressionPattern *regularExpression = nil;
    
    NSString *pattern = nil;
    NSUInteger numberOfRanges = 0;
    NSUInteger entityRangeIndex = 0;
    NSUInteger keyRangeIndex = 1;
    
    switch (type) {
        case LNEntityTypeLocalizedString:
        {
            pattern = @"NSLocalizedString\\s*\\(\\s*@\"(.*?)\"\\s*,\\s*(.*?)\\s*\\)";
            numberOfRanges = 3;
        }
            break;
        case LNEntityTypeLocalizedStringForKey:
        {
            pattern = @"localizedStringForKey:\\s*@\"(.*?)\"\\s*value:\\s*(.*?)\\s*table:\\s*(.*?)";
            numberOfRanges = 4;
        }
            break;
        case LNEntityTypeLocalizedStringFromTable:
        {
            pattern = @"NSLocalizedStringFromTable\\s*\\(\\s*@\"(.*?)\"\\s*,\\s*(.*?)\\s*,\\s*(.*?)\\s*\\)";
            numberOfRanges = 4;
        }
            break;
        case LNEntityTypeLocalizedStringFromTableInBundle:
        {
            pattern = @"NSLocalizedStringFromTableInBundle\\s*\\(\\s*@\"(.*?)\"\\s*,\\s*(.*?)\\s*,\\s*(.*?)\\s*,\\s*(.*?)\\s*\\)";
            numberOfRanges = 5;
        }
            break;
        case LNEntityTypeLocalizedStringWithDefaultValue:
        {
            pattern = @"NSLocalizedStringWithDefaultValue\\s*\\(\\s*@\"(.*?)\"\\s*,\\s*(.*?)\\s*,\\s*(.*?)\\s*,\\s*(.*?)\\s*,\\s*(.*?)\\s*\\)";
            numberOfRanges = 6;
        }
            break;
        
        case LNEntityTypeLocalizedStringUserDefined:
        {
            
            pattern = @"NSLocalizedStringWithDefaultValue\\s*\\(\\s*@\"(.*?)\"\\s*,\\s*(.*?)\\s*,\\s*(.*?)\\s*,\\s*(.*?)\\s*,\\s*(.*?)\\s*\\)";
            numberOfRanges = 6;
        }
            break;
    }
    
    if (pattern) {
        regularExpression = [LNRegularExpressionPattern patternWithString:pattern
                                                           numberOfRanges:numberOfRanges
                                                         entityRangeIndex:entityRangeIndex
                                                            keyRangeIndex:keyRangeIndex];
        regularExpression.type = type;
    }
    
    return regularExpression;
}

@end
