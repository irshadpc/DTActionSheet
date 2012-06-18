//
//  DTActionSheet.m
//  DTActionSheet
//
//  Created by 但 江 on 12-6-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DTActionSheet.h"

@interface DTActionSheet()
@property (nonatomic,strong) UIView* contentView;
@property (nonatomic,strong) UIToolbar* toolBar;
@end

@implementation DTActionSheet

@synthesize contentView=_contentView;
@synthesize toolBar=_toolBar;

-(id)initWithContentView:(UIView*)contentView sheetTitle:(NSString*)title;
{
    self = [super init];
    if (self) 
    {
        _contentView = contentView;
        int btnnum = (contentView.frame.size.height-5)/50; // (height+44-20-25)/50
        for(int i=0; i<btnnum; i++)
        {
            [self addButtonWithTitle:@" "];
        }
        _toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        _toolBar.barStyle = UIBarStyleBlackOpaque;
        
        UIBarButtonItem *titleButton = [[UIBarButtonItem alloc] initWithTitle:title 
                                                                        style:UIBarButtonItemStylePlain 
                                                                       target:nil 
                                                                       action:nil];
        
        UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" 
                                                                        style:UIBarButtonItemStyleDone 
                                                                       target:self
                                                                       action:@selector(done)];
        
        UIBarButtonItem *leftButton  = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" 
                                                                        style:UIBarButtonItemStyleBordered 
                                                                       target:self 
                                                                       action:@selector(cancel)];
        
        UIBarButtonItem *fixedButton  = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace 
                                                                                      target:nil 
                                                                                      action:nil];
        
        [_toolBar setItems: [NSArray arrayWithObjects:leftButton,fixedButton,titleButton,fixedButton,rightButton,nil]];
        
        [self addSubview:_toolBar];
        [self addSubview:_contentView];
    }
    return self;
}

-(void)done
{
    [self dismissWithClickedButtonIndex:0 animated:YES];
}
-(void)cancel
{
    [self dismissWithClickedButtonIndex:0 animated:YES];
}


@end
