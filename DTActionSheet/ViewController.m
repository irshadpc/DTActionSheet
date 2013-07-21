//
//  ViewController.m
//  DTActionSheet
//
//  Created by 但 江 on 12-6-18.
//  Copyright (c) 2012年 Dan Thought Studio. All rights reserved.
//

#import "ViewController.h"
#import "DTActionSheet.h"

@interface ViewController ()

@property (strong, nonatomic) UIPickerView *pickerView;
@property (strong, nonatomic) DTActionSheet *actionSheet;
@property (weak, nonatomic) IBOutlet UILabel *weightLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 44, 320, 50*3+5)];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    self.pickerView.showsSelectionIndicator = YES;
    
    self.actionSheet = [[DTActionSheet alloc] initWithContentView: self.pickerView sheetTitle:@"Demo"];
    self.actionSheet.delegate = self;
}

-(IBAction)showSheet {
    [self.actionSheet showInView:self.view];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 4;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
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

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
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
- (void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == DTActionSheetButtonIndexDone) {
        NSLog(@"Click Done Button");
        int tens  = [self.pickerView selectedRowInComponent:0];
        int single = [self.pickerView selectedRowInComponent:1];
        int scale =  [self.pickerView selectedRowInComponent:2];
        float weight = tens * 10 + single + scale * 0.1;
        self.weightLabel.text = [NSString stringWithFormat:@"%0.1f kg", weight];
    } else if (buttonIndex == DTActionSheetButtonIndexCancel) {
        NSLog(@"Click Cancel Button");
    }
}

- (void)viewDidUnload {
    [self setWeightLabel:nil];
    [super viewDidUnload];
}
@end
