//
//  nLabel.m
//
//  Created by Richard Jung on 04.08.2011.
//  Copyright 2011 Richard Jung. All rights reserved.
//

#import "nLabel.h"

@implementation nLabel

@synthesize trimHTMLTags = _trimHTMLTags;

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
    _trimHTMLTags = NO;
}

- (void)awakeFromNib {
    
    [self setup];
}

- (void)setText:(NSString *)text {

    if (_trimHTMLTags) {
        
        NSRegularExpression *expr = [NSRegularExpression regularExpressionWithPattern:@"\\<([\\w*])\\>([^\\<]*)\\<\\/([\\w*])\\>" options:NSRegularExpressionCaseInsensitive error:nil];
        
        text = [expr stringByReplacingMatchesInString:text options:0 range:NSMakeRange(0, [text length]) withTemplate:@"$2"];
    }
    
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
