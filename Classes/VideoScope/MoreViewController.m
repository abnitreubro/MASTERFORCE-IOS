//
//  MoreViewController.m
//  VideoScope
//
//  Created by JS Products on 04/03/16.
//  Copyright © 2016  JS Products. All rights reserved.
//

#import "MoreViewController.h"
#import "Constant.h"
@interface MoreViewController ()

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tabBarController.tabBar setTintColor:[UIColor colorWithRed:0.2968 green:0.84765625 blue:0.390625 alpha:1]];

    
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:ISRECORDAUDIO]intValue]==1) {
        self.recordAudioSwitch.on=YES;
    }
    else
    self.recordAudioSwitch.on=NO;
    
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:RECORDINGTIME]intValue]>0) {
        self.lblRecordingTime.text=[NSString stringWithFormat:@"Record: %@ min",[[NSUserDefaults standardUserDefaults]objectForKey:RECORDINGTIME]];
        self.recordingTimeStepper.value=[[[NSUserDefaults standardUserDefaults]objectForKey:RECORDINGTIME]doubleValue];
    }
    else{
        self.lblRecordingTime.text=[NSString stringWithFormat:@"Record: 1 min"];
        self.recordingTimeStepper.value=1.0;
    }
    
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];

}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}






#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section==0)
        return 2;
    
    else if(section== 1)
        return 2;
    else if(section== 2)
        return 1;


    return 0;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 1) {
        
        if (indexPath.row == 0) {
            
            NSURL *URL = [[NSBundle mainBundle] URLForResource:@"65207_mf_mx1020_manual-electronic_v18" withExtension:@"pdf"];
            
            if (URL) {
                // Initialize Document Interaction Controller
                self.documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:URL];
                
                // Set Document Name Manually which will override the default PDF name in Navigation title
                self.documentInteractionController.name = @"MX1020 Manual";
                
                // Configure Document Interaction Controller
                [self.documentInteractionController setDelegate:self];
                
                // Preview PDF
                [self.documentInteractionController presentPreviewAnimated:YES];
                
            }
        }
        if (indexPath.row == 1) {
            NSURL *URL = [[NSBundle mainBundle] URLForResource:@"65259_mf_mx1021_manual-electronic_v16" withExtension:@"pdf"];
            
            if (URL) {
                // Initialize Document Interaction Controller
                self.documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:URL];
                
                // Set Document Name Manually which will override the default PDF name in Navigation title
                self.documentInteractionController.name = @"MX1021 Manual";

                // Configure Document Interaction Controller
                [self.documentInteractionController setDelegate:self];
                
                // Preview PDF
                [self.documentInteractionController presentPreviewAnimated:YES];
                
            }

        }

    }
    
}

#pragma mark-  UIDocumentInteractionController Delegate Implemenattion

- (UIViewController *) documentInteractionControllerViewControllerForPreview: (UIDocumentInteractionController *) controller {
    return self;
}


#pragma mark- Actions from View
- (IBAction)actionRecordingTimeStepper:(UIStepper*)sender {
    
    self.lblRecordingTime.text=[NSString stringWithFormat:@"Record: %d min",(int)sender.value];
    [[NSUserDefaults standardUserDefaults]setObject:[NSString stringWithFormat:@"%d",(int)sender.value] forKey:RECORDINGTIME];
    
}

- (IBAction)actionRecordSwitch:(UISwitch*)sender {
    
    if ([sender isOn])
        [[NSUserDefaults standardUserDefaults]setObject:@"1" forKey:ISRECORDAUDIO];//ON
    else
        [[NSUserDefaults standardUserDefaults]setObject:@"0" forKey:ISRECORDAUDIO];// OFF
}



@end




