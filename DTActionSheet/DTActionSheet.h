//
//  DTActionSheet.h
//  DTActionSheet
//
//  Created by 但 江 on 12-6-18.
//  Copyright (c) 2012年 Dan Thought Studio. All rights reserved.
//

enum {
    DTActionSheetButtonIndexDone = 1,
    DTActionSheetButtonIndexCancel = 2
};
typedef NSUInteger DTActionSheetButtonIndex;

#import <UIKit/UIKit.h>

@interface DTActionSheet : UIActionSheet

-(id)initWithContentView:(UIView*)contentView sheetTitle:(NSString*)title;

@end
