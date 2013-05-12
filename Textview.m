//
//  Textview.m
//  
//
//  Created by Maneesh on 04/02/11.
//  
//

#import "Textview.h"


@implementation Textview

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
		self.font=[UIFont fontWithName:@"Helvetica" size:20];
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(keyboardWillShow:) name:@"UIKeyboardWillShowNotification" object:nil];
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(keyboardWillHide:) name:@"UIKeyboardWillHideNotification" object:nil];
    }
    return self;
}



- (void)dealloc {
    [super dealloc];
}



-(void)drawRect:(CGRect)rect {
	
// Get the graphics context
CGContextRef ctx = UIGraphicsGetCurrentContext();

// Get the height of a single text line 
NSString *alpha = @"ABCD";
CGSize textSize = [alpha sizeWithFont:self.font constrainedToSize:self.contentSize lineBreakMode:UILineBreakModeWordWrap];
NSUInteger height = textSize.height;

// Get the height of the view or contents of the view whichever is bigger
textSize = [self.text sizeWithFont:self.font constrainedToSize:self.contentSize lineBreakMode:UILineBreakModeWordWrap];
NSUInteger contentHeight = (rect.size.height > textSize.height) ? (NSUInteger)rect.size.height : textSize.height;

NSUInteger offset = 6 + height; // MAGIC Number 6 to offset from 0 to get first line OK ???
contentHeight += offset; // Draw ruled lines 
CGContextSetRGBStrokeColor(ctx, 0.0, 0.0, 0.0, 1); //Color for the ruled lines

for(int i=offset;i < contentHeight;i+=height) 
{ 
	CGPoint lpoints[2] = { CGPointMake(0, i), CGPointMake(rect.size.width, i) };
	CGContextStrokeLineSegments(ctx, lpoints, 2);
}

}



- (void)keyboardWillShow:(NSNotification *)aNotification {
    [self moveTextViewForKeyboard:aNotification up:YES];
}

- (void)keyboardWillHide:(NSNotification *)aNotification {
	[self moveTextViewForKeyboard:aNotification up:NO]; 
}

- (void) moveTextViewForKeyboard:(NSNotification*)aNotification up: (BOOL) up{
	NSDictionary* userInfo = [aNotification userInfo];
	
	// Get animation info from userInfo
	NSTimeInterval animationDuration;
	UIViewAnimationCurve animationCurve;
	
	CGRect keyboardEndFrame;
	
	[[userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] getValue:&animationCurve];
	[[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&animationDuration];
	
	
	[[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] getValue:&keyboardEndFrame];
	
	
	// Animate up or down
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:animationDuration];
	[UIView setAnimationCurve:animationCurve];
	
	CGRect newFrame = self.frame;
	CGRect keyboardFrame = [self convertRect:keyboardEndFrame toView:nil];
	
	newFrame.size.height -= keyboardFrame.size.height * (up? 1 : -1);
	self.frame = newFrame;
	
	[UIView commitAnimations];
}




	

@end
