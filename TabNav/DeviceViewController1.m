//
//  DeviceViewController.m
//  TabNav
//
//  Created by user on 11-8-2.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "DeviceViewController1.h"

@implementation DeviceViewController1

@synthesize greeting, nameInput, webData, soapResults, xmlParser;





-(IBAction)buttonClick:(id)sender
{
	greeting.text = @"Getting time …";
	[nameInput resignFirstResponder];
	[self getOffesetUTCTimeSOAP];
}
- (void)getOffesetUTCTimeSOAP
{
	recordResults = NO;
	//封装soap请求消息
	NSString *soapMessage = [NSString stringWithFormat:
							 @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
							 "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
							 "<soap:Body>\n"
							 "<getOffesetUTCTime xmlns=\"http://www.Nanonull.com/TimeService/\">\n"
							 "<hoursOffset>%@</hoursOffset>\n"
							 "</getOffesetUTCTime>\n"
							 "</soap:Body>\n"
							 "</soap:Envelope>\n",nameInput.text
							 ];
	NSLog(@"%@",soapMessage);
	//请求发送到的路径
	NSURL *url = [NSURL URLWithString:@"http://www.nanonull.com/TimeService/TimeService.asmx"];
	NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
	NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
	
	//以下对请求信息添加属性前四句是必有的，第五句是soap信息。
	[theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
	[theRequest addValue: @"http://www.Nanonull.com/TimeService/getOffesetUTCTime" forHTTPHeaderField:@"SOAPAction"];
	
	[theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
	[theRequest setHTTPMethod:@"POST"];
	[theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
	
	//请求
	NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
	
	//如果连接已经建好，则初始化data
	if( theConnection )
	{
		webData = [NSMutableData data];
	}
	else
	{
		NSLog(@"theConnection is NULL");
	}
	
	
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	[webData setLength: 0];
	NSLog(@"connection: didReceiveResponse:1");
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	[webData appendData:data];
	NSLog(@"connection: didReceiveData:2");
    
}

//如果电脑没有连接网络，则出现此信息（不是网络服务器不通）
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
	NSLog(@"ERROR with theConenction");
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	NSLog(@"3 DONE. Received Bytes: %d", [webData length]);
	NSString *theXML = [[NSString alloc] initWithBytes: [webData mutableBytes] length:[webData length] encoding:NSUTF8StringEncoding];
	NSLog(@"%@",theXML);
	
	//重新加載xmlParser
	
	xmlParser = [[NSXMLParser alloc] initWithData: webData];
	[xmlParser setDelegate: self];
	[xmlParser setShouldResolveExternalEntities: YES];
	[xmlParser parse];
	
	//[webData release];
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict
{
	NSLog(@"4 parser didStarElemen: namespaceURI: attributes:");
    
    if( [elementName isEqualToString:@"getOffesetUTCTimeResult"])
	{
		if(!soapResults)
		{
			soapResults = [[NSMutableString alloc] init];
		}
		recordResults = YES;
	}
	
}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	NSLog(@"5 parser: foundCharacters:");
    
	if( recordResults )
	{
		[soapResults appendString: string];
	}
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
	NSLog(@"6 parser: didEndElement:");
    
	if( [elementName isEqualToString:@"getOffesetUTCTimeResult"])
	{
		recordResults = FALSE;
		 greeting.text = [[NSString stringWithFormat:@"T%@ ",nameInput.text] stringByAppendingString:soapResults];		
		soapResults = nil;
		NSLog(@"hoursOffset result");
	}
	
}
- (void)parserDidStartDocument:(NSXMLParser *)parser{
	NSLog(@"-------------------start--------------");
}
- (void)parserDidEndDocument:(NSXMLParser *)parser{
	NSLog(@"-------------------end--------------");
}
/*
 Implement loadView if you want to create a view hierarchy programmatically
 - (void)loadView {
 }
 */

/*
 Implement viewDidLoad if you need to do additional setup after loading the view.
 - (void)viewDidLoad {
 [super viewDidLoad];
 }
 */


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
	// Release anything that's not essential, such as cached data
}


@end
