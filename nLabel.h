//
//  nLabel.h
//
//  Created by Richard Jung on 04.08.2011.
//  Copyright 2011 Richard Jung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface nLabel : UILabel {
    
    BOOL setupCompleted;
}

@property (assign, readwrite) BOOL trimHTMLTags;

- (void)setup;

@end
