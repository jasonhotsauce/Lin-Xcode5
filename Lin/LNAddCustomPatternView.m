//
//  LNAddCustomPatternView.m
//  Lin
//
//  Created by Wenbin Zhang on 3/23/14.
//  Copyright (c) 2014 Tanaka Katsuma. All rights reserved.
//

#import "LNAddCustomPatternView.h"

@interface LNAddCustomPatternView ()

@property (weak) IBOutlet NSTextField *searchPatternTextField;

@property (weak) IBOutlet NSTextField *rangeTextField;

@end

@implementation LNAddCustomPatternView

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (NSString *)searchPattern
{
    return self.searchPatternTextField.stringValue;
}

- (NSInteger)range
{
    return [self.rangeTextField.stringValue integerValue];
}

@end
