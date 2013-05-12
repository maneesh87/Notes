//
//  TextViewwithRuledLinesViewController.m
//  TextViewwithRuledLines
//
//  Created by Maneesh on 17/03/11.
//  
//

#import "TextViewwithRuledLinesViewController.h"
#import "Textview.h"
@implementation TextViewwithRuledLinesViewController

@synthesize customTextView;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.customTextView=[[Textview alloc] initWithFrame:self.view.frame];
	self.customTextView.delegate=self;
	self.customTextView.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
	[self.view addSubview:self.customTextView];
}



// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


// any offset change

- (void)scrollViewDidScroll:(UIScrollView *)scrollView;                                               
{
	NSLog(@"text view scrolled");
	[customTextView setNeedsDisplay];
	
}


@end
