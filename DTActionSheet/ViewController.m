//
//  ViewController.m
//  DTActionSheet
//
//  Created by 但 江 on 12-6-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "DTActionSheet.h"

@implementation ViewController

-(IBAction)showSheet{
    
    UIPickerView *pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 44, 320, 50*3+5)];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    pickerView.showsSelectionIndicator = YES;
    
    DTActionSheet *sheet = [[DTActionSheet alloc] initWithContentView:pickerView sheetTitle:@"Demo"];
    [sheet showInView:self.view];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 4;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    switch (component) {
        case 1:
            return 100;
            break;
        case 3:
            return 1;
            break;
        default:
            return 10;
            break;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    switch (component) {
        case 2:
            return [NSString stringWithFormat:@".%d",row];
            break;
        case 3:
            return @"kg";
            break;        
        default:
            return [NSString stringWithFormat:@"%d",row];
            break;            
    }
}

@end
