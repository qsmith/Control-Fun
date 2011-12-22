//
//  ViewController.h
//  Control Fun
//
//  Created by Quintin Smith on 12/20/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIActionSheetDelegate>



@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *numberField;
@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;
@property (weak, nonatomic) IBOutlet UISwitch *leftSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *rightSwitch;

@property (weak, nonatomic) IBOutlet UIButton *doSomething;





-(IBAction)textFieldDoneEditing:(id)sender;
-(IBAction)backgroundTap:(id)sender;

- (IBAction)sliderChanged:(id)sender;
- (IBAction)switchChanged:(id)sender;
- (IBAction)buttonPressed:(id)sender;

- (IBAction)toggleControls:(id)sender;
@end
