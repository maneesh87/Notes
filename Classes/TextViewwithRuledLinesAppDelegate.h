//
//  TextViewwithRuledLinesAppDelegate.h
//  TextViewwithRuledLines
//
//  Created by Maneesh on 17/03/11.
//  
//

#import <UIKit/UIKit.h>

@class TextViewwithRuledLinesViewController;

@interface TextViewwithRuledLinesAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TextViewwithRuledLinesViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TextViewwithRuledLinesViewController *viewController;

@end

