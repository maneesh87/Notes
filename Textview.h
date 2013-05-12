//
//  Textview.h
//  
//
//  Created by Maneesh on 04/02/11.
//  
//

#import <UIKit/UIKit.h>


@interface Textview : UITextView {

}
- (void) moveTextViewForKeyboard:(NSNotification*)aNotification up: (BOOL) up;
@end
