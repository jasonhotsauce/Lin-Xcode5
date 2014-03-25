//
//  LNRegularExpressionPattern.m
//  Lin
//
//  Created by Tanaka Katsuma on 2013/08/21.
//  Copyright (c) 2013年 Tanaka Katsuma. All rights reserved.
//

#import "LNRegularExpressionPattern.h"

static NSString *const LNRegularExpressionPatternPatternKey = @"pattern";
static NSString *const LNRegularExpressionPatternRangeKey = @"range";
static NSString *const LNRegularExpressionPatternEntityRangeIndexKey = @"entityRangeIndex";
static NSString *const LNRegularExpressionPatternKeyRangeIndexKey = @"keyRangeIndex";

@interface LNRegularExpressionPattern ()

@property (nonatomic, copy, readwrite) NSString *pattern;
@property (nonatomic, assign, readwrite) NSUInteger numberOfRanges;
@property (nonatomic, assign, readwrite) NSUInteger entityRangeIndex;
@property (nonatomic, assign, readwrite) NSUInteger keyRangeIndex;

@end

@implementation LNRegularExpressionPattern

+ (instancetype)patternWithString:(NSString *)string numberOfRanges:(NSUInteger)numberOfRanges entityRangeIndex:(NSUInteger)entityRangeIndex keyRangeIndex:(NSUInteger)keyRangeIndex
{
    return [[self alloc] initWithString:string
                         numberOfRanges:numberOfRanges
                       entityRangeIndex:entityRangeIndex
                          keyRangeIndex:keyRangeIndex];
}

- (instancetype)initWithString:(NSString *)string numberOfRanges:(NSUInteger)numberOfRanges entityRangeIndex:(NSUInteger)entityRangeIndex keyRangeIndex:(NSUInteger)keyRangeIndex
{
    self = [super init];
    
    if (self) {
        self.pattern = string;
        self.numberOfRanges = numberOfRanges;
        self.entityRangeIndex = entityRangeIndex;
        self.keyRangeIndex = keyRangeIndex;
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.pattern = [aDecoder decodeObjectForKey:LNRegularExpressionPatternPatternKey];
        self.numberOfRanges = [[aDecoder decodeObjectForKey:LNRegularExpressionPatternRangeKey] integerValue];
        self.entityRangeIndex = [[aDecoder decodeObjectForKey:LNRegularExpressionPatternEntityRangeIndexKey] integerValue];
        self.keyRangeIndex = [[aDecoder decodeObjectForKey:LNRegularExpressionPatternKeyRangeIndexKey] integerValue];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.pattern forKey:LNRegularExpressionPatternPatternKey];
    [aCoder encodeObject:@(self.numberOfRanges) forKey:LNRegularExpressionPatternRangeKey];
    [aCoder encodeObject:@(self.entityRangeIndex) forKey:LNRegularExpressionPatternEntityRangeIndexKey];
    [aCoder encodeObject:@(self.keyRangeIndex) forKey:LNRegularExpressionPatternKeyRangeIndexKey];
}

@end
