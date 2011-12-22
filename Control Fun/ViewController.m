//
//  ViewController.m
//  Control Fun
//
//  Created by Quintin Smith on 12/20/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize nameField;
@synthesize numberField;
@synthesize sliderLabel;
@synthesize leftSwitch;
@synthesize rightSwitch;

@synthesize doSomething;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIImage *buttonImageNormal = [UIImage imageNamed:@"whiteButton.png"];
    UIImage *stretchableButtonImageNormal = [buttonImageNormal stretchableImageWithLeftCapWidth:12 topCapHeight:0];
    
    [doSomething setBackgroundImage:stretchableButtonImageNormal forState:UIControlStateNormal];
    
    UIImage *buttonImagePressed = [UIImage imageNamed:@"blueButton.png"];
    UIImage *stretchableButtonImagePressed = [ buttonImagePressed stretchableImageWithLeftCapWidth:12 topCapHeight:0];
    
    [doSomething setBackgroundImage:stretchableButtonImagePressed forState:UIControlStateHighlighted];
                                   
                                  
}

- (void)viewDidUnload
{
    [self setNameField:nil];
    [self setNumberField:nil];
    [self setSliderLabel:nil];
    [self setLeftSwitch:nil];
    [self setRightSwitch:nil];
    [self setDoSomething:nil];
    
    [self setDoSomething:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(IBAction)textFieldDoneEditing:(id)sender 
{
    [sender resignFirstResponder];

}

-(IBAction)backgroundTap:(id)sender
{
    [nameField resignFirstResponder];
    [numberField resignFirstResponder];
    
}

- (IBAction)sliderChanged:(id)sender {
    UISlider *slider = (UISlider *) sender;
    int progressAsInt = (int)roundf(slider.value);
    sliderLabel.text = [NSString stringWithFormat:@"%d", progressAsInt];
}

- (IBAction)switchChanged:(id)sender 
{
    UISwitch *whichSwitch = (UISwitch *)sender;
    BOOL setting = whichSwitch.isOn;
    [leftSwitch setOn:setting animated:YES];
    [rightSwitch setOn:setting animated:YES];
}

- (IBAction)buttonPressed:(id)sender 
{
   
    if(nameField.text.length <= 0)
    {   
       
        
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:nil message:@"You didn't enter a name" delegate:self cancelButtonTitle:nil otherButtonTitles: nil];
        [alert show];
        [alert dismissWithClickedButtonIndex:0 animated:FALSE];
        
    }
    
    
    else {
        
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Are you sure" 
                                                             delegate:self
                                                    cancelButtonTitle:@"No Way"
                                               destructiveButtonTitle:@"Yes I am sure"
                                                    otherButtonTitles: nil];
    [actionSheet showInView:self.view];
    }
}

-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if(buttonIndex != [actionSheet cancelButtonIndex])
    {
        NSString *msg=nil;
        
        if (nameField.text.length > 0)
        {
            msg = [[NSString alloc] initWithFormat:@" You can breathe easy, %@, everything went ok." , nameField.text];
            
        }else
        {
            msg =@" You can breathe easy, everything went ok";
        }
        
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Something was done"
                              message:msg
                              delegate:self
                              cancelButtonTitle:@"PHEW"
                              otherButtonTitles: nil];
        
        [alert show];
    }
}
    

- (IBAction)toggleControls:(id)sender 
{
    //0 == switches index
    if([sender selectedSegmentIndex]==0)
    {
        leftSwitch.hidden =NO;
        rightSwitch.hidden=NO;
        doSomething.hidden = YES;
    }
    else
    {
        leftSwitch.hidden=YES;
        rightSwitch.hidden=YES;
        doSomething.hidden=NO;
    }
}



@end
