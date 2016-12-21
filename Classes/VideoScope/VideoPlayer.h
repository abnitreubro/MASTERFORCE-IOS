//
//  VideoPlayer.h
//  P2PCamera
//
//  Created by JS Products on 20/04/16.
//
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import "Constant.h"
#import "RecPathManagement.h"




@protocol videoProtocol <NSObject>

-(void) videoDeletedReloadDatas:(NSString *)itemName;


@end



@interface VideoPlayer : UIViewController<UIActionSheetDelegate>
{
    UIBarButtonItem * shareBtn, * deleteBtn;
    IBOutlet UIImageView *videoImage;
    IBOutlet NSLayoutConstraint *imageHeightConstraint;
    IBOutlet UIView *imageContainingView;
    
    AVPlayerLayer  *playerLayer;
    AVAsset  * asset;
    AVPlayerItem * playerItem;
    
    id playbackObserver;

    IBOutlet UIView *transparentControlView;
    IBOutlet UIView *controlsView;
    IBOutlet UILabel *labelStartTime;
    IBOutlet UILabel *labelStopTime;
    IBOutlet UISlider *movieSlider;
    IBOutlet UIButton *playStopButton;
    
    BOOL isPlaying,isSliding;
    
    RecPathManagement *m_pRecPathMgt;

}

- (IBAction)movieSliderAction:(id)sender;

- (IBAction)playStopButton:(id)sender;

@property (strong,nonatomic)     AVPlayer * player;



@property (strong, nonatomic) NSString *strVideoPath;


@property BOOL isP2P;
@property NSString * date;
@property NSString * picPath;

@property (weak) id delegates;




@end
