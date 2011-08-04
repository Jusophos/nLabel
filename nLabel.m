//
//  nLabel.m
//
//  Created by Richard Jung on 04.08.2011.
//  Copyright 2011 Richard Jung. All rights reserved.
//

#import "nLabel.h"

@implementation nLabel

#pragma mark - Memory management
- (id)init
{
    self = [super init];
    if (self) {

        [self setup];
    }
    
    return self;
}

- (void)setup {
    
    if (setupCompleted) {
        
        return;
    }
    
    // Enforce a break mode with characters oder words
    if (self.lineBreakMode != UILineBreakModeWordWrap && self.lineBreakMode != UILineBreakModeCharacterWrap) {
        
        self.lineBreakMode = UILineBreakModeWordWrap;
    }
    
    setupCompleted = YES;
}

- (void)awakeFromNib {
    
    [self setup];
}

- (void)setText:(NSString *)text {
    
    [super setText:text];
    
    float actualFontSize;
    
    CGSize oneLineSize = [self.text sizeWithFont:self.font minFontSize:self.minimumFontSize actualFontSize:&actualFontSize forWidth:self.frame.size.width lineBreakMode:UILineBreakModeWordWrap];
    CGSize size = [self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(self.frame.size.width, (self.text.length * 21)) lineBreakMode:UILineBreakModeWordWrap];
    
    CGRect frame = self.frame;
    frame.size.height = size.height;
    self.frame = frame;
    
    int lines = (int)((size.height / oneLineSize.height) + 0.5);
    self.numberOfLines = lines;
}

@end
