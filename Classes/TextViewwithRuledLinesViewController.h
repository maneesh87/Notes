//
//  TextViewwithRuledLinesViewController.h
//  TextViewwithRuledLines
//
//  Created by Maneesh on 17/03/11.
//  
//

#import <UIKit/UIKit.h>
#import "Textview.h"

@interface TextViewwithRuledLinesViewController : UIViewController<UITextViewDelegate,UIScrollViewDelegate> {
	Textview *customTextView;
}
@property (nonatomic,retain)Textview *customTextView;


@end

