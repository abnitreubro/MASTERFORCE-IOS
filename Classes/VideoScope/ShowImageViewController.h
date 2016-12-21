//
//  ShowImageViewController.h
//  VideoScope
//
//  Created by JS Products on 15/03/16.
//  Copyright © 2016  JS Products. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "Constant.h"
#import "PicPathManagement.h"



@protocol ImageViewerProtocol <NSObject>

-(void) deletedPleaseReloadTheImages:(NSString *)itemName;

@end



@interface ShowImageViewController : UIViewController<UIScrollViewDelegate, UIActionSheetDelegate>
{
    
    IBOutlet UIImageView *interfaceImage;
    IBOutlet UIScrollView *interFaceScrollView;
    
    PicPathManagement *m_pPicPathMgt;

}

@property (nonatomic, strong) NSString* strImagePath;

@property BOOL isP2P;
@property NSString * date;
@property NSString * picPath;

@property (weak) id delegates;



@end
