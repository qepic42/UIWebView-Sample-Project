//
//  DetailViewController.m
//  LoadingViewAnimations
//
//  Created by Q on 17.11.10.
//  Copyright (c) 2010 PQ-Developing.com. All rights reserved.
//

#import "DetailViewController.h"


@implementation DetailViewController
@synthesize array;


#pragma mark -
#pragma mark LoadView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.3 alpha:1.0];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    myTableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] style:UITableViewStyleGrouped];
	myTableView.delegate = self;
	myTableView.dataSource = self;
    myTableView.backgroundColor = [UIColor colorWithWhite:0.3 alpha:1.0];
	
	self.navigationItem.title = @"Loading…";
	
    NSLog(@"HTML: %@",array.articleHTMLCode);
    
	self.view = myTableView;
    
    [self initUIWebView];
    
}


#pragma mark -
#pragma mark InitWebView

- (void)initUIWebView{
    
    // WebView initialisieren&allozieren mit einer bestimmten Größe
    myWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 416)];
    
    // Delegate des WebViews setzen
    [myWebView setDelegate:self];
    
    // Main.View Hintergrund setzen
    self.view.backgroundColor = [UIColor colorWithWhite:0.6 alpha:0.8];
    
    // CSS-Datei hinzufügen
    NSString *cssLink = @"<link href=\"https://files.me.com/jgaller/i4ilge\" rel=\"stylesheet\" type=\"text/css\" />\n";
    NSString *cssAndHTML = [NSString stringWithFormat:@"%@ %@",cssLink, array.articleHTMLCode];
    
    // URL zusammen setzen
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:path];
    
    // URL laden
    [myWebView loadHTMLString:cssAndHTML baseURL:baseURL];
    
    // WebView zum Main.View hinzufügen
    [self.view addSubview:myWebView];
    
} 

#pragma mark -
#pragma mark WebView delegate methods

- (void)webViewDidStartLoad:(UIWebView *)webView {  
    
	// Lade.View initialisieren&allozieren und Setup durchführen
    myView = [[UIView alloc]init];
    myView.backgroundColor = [UIColor colorWithWhite:0.2 alpha:1.0];
    
	// Lade.View zum Haupt.View machen
	self.view = myView;
    
    // MenuBar.Network.Indikator starten
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
	// Indikator initialisieren&allozieren und Setup durchführen
    myIndicator = [self setupActivityIndicator:myIndicator :YES];
    
	myButton = [self setupButton:myButton];
   
	// NavigationBar.Title festlegen
	self.navigationItem.title = @"Loading…";
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    [UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:1.5];	
    
    if ([array.articleTitle isEqualToString:@"Apple is epic"]){
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:myWebView cache:YES];
    }else if ([array.articleTitle isEqualToString:@"Story 2"]){
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:myWebView cache:YES];
    }else if ([array.articleTitle isEqualToString:@"Story 3"]){
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:myWebView cache:YES];
    }else if ([array.articleTitle isEqualToString:@"Story 4"]){
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:myWebView cache:YES];
    }
    
    [UIView commitAnimations];
    
	[myButton removeFromSuperview];
	
	myView.hidden = YES;
    self.view = myWebView;
	
    [myIndicator stopAnimating];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    self.navigationItem.title = array.articleTitle;
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
    myView.hidden = YES;
    
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [myIndicator stopAnimating];
    
	NSString* errorString = [NSString stringWithFormat:
							 @"<html style=\"background-color:#222022;\"><center><font size=+3 color='red'>An error occurred:<br>%@</font></center></html>",
							 error.localizedDescription];
    
	[myWebView loadHTMLString:errorString baseURL:nil];
    
}


#pragma mark -
#pragma mark LoadingView elements

-(UIActivityIndicatorView *)setupActivityIndicator:(UIActivityIndicatorView *)activityIndicator: (BOOL)startIndicator{
    
	// Indikator initialisieren&allozieren und Setup durchführen
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
	// Indikator Center-Punkt auf View festlegen
	activityIndicator.center = CGPointMake(160, 157);
	
	// Indikator ausblenden, wenn gestoppt wird
    activityIndicator.hidesWhenStopped = YES;
    
	// Wenn Parameter startIndicator = YES den Indikator starten
	if (startIndicator) {
		[activityIndicator startAnimating];
	}
    
    // Indikator zum Main.View hinzufügen
	[self.view addSubview:activityIndicator];
    
	// Indikator zurückgeben
    return activityIndicator;
}

-(UIButton *)setupButton:(UIButton *)button{
	
    button = [[UIButton alloc]init];
	button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Loading…" forState:UIControlStateNormal];
	button.alpha = 0.7;
    button.frame = CGRectMake(95, 130, 130, 115);
    button.enabled = NO;
    
    [self.view addSubview:button];
    
    return button;
	
}

#pragma mark -
#pragma mark TableView Management

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath  {  
    return 460;  
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell.
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}


#pragma mark -
#pragma mark Memory Management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [array release];
    [super dealloc];
}


@end
