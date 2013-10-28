//
//  DeviceViewController.m
//  TabNav
//
//  Created by user on 11-8-2.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "DeviceViewController.h"

@implementation DeviceViewController

@synthesize  request;
@synthesize guank;

int suiji;
AVAudioPlayer *audioplay;

- (void) viewDidLoad
{
   
  //  [self newgame];
    
 self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"back.png"]];
    guanka = 1;
    answer01 = @"吕布";
    answer02 = @"孙权";
    answer03 = @"关羽";
    answer04 = @"诸葛亮";
    answer05 = @"张飞";
    answer06 = @"刘备";
    answer07 = @"曹操";
    
    request1 = @"能和刘备、关羽、张飞对打不输的猛将是？";
    request2 = @"谁和刘备、曹操三分天下？";
    request3 = @"持青龙偃月刀的三国名将是？";
    request4 = @"刘备三顾茅庐是请谁？";
    request5 = @"长坂坡一声吼退敌的猛将是？";
    request6 = @"字号玄德的是？";
    request7 = @"挟天子以令诸侯的是？";
    
    
  //  NSDictionary *aswRequest = [NSDictionary dictionaryWithObjectsAndKeys:request1,answer01,request2,answer02,request3,answer03,request4,answer04,nil];
    
    image.image = [UIImage imageNamed:@"diaochan.jpeg"];
    image.frame = CGRectMake(30, 30, 250, 320);
    [image.layer setMasksToBounds:YES];
    [image.layer setCornerRadius:55.0];
    [_bt2 setBackgroundImage:[UIImage imageNamed:@"Basic_Card_Icon_15"] forState:UIControlStateNormal];
    [_bt1 setBackgroundImage:[UIImage imageNamed:@"Basic_Card_Icon_24"] forState:UIControlStateNormal];
    [self newgame];
    [self playSound];
      [self canBecomeFirstResponder];

   
}

#pragma mark -
#pragma mark - MotionShake Event
-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    
}

-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    if(motion == UIEventSubtypeMotionShake){
        [self newgame];

        NSLog(@"Shake!!!!!!!!!!!");
    }
}

-(void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    
}

-(void)viewDidAppear:(BOOL)animated{
    [self canBecomeFirstResponder];
}


-(BOOL)canBecomeFirstResponder{
    return YES;
}

-(void)playSound
{
    
    NSString *mp3File = [[NSBundle mainBundle]pathForResource:@"aGreatGiantPlay" ofType:@"mp3"];
    
    if (nil != audioplay) {
        [audioplay stop];//<----在释放前需要先停止播放器

    }
    
    audioplay = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:mp3File] error:NULL];
    [audioplay play];
}

- (void)newgame{

     int y = arc4random()  % 2;
     int x = arc4random()  % 8;
  
    NSLog(@"%d",x);
    
   if (guanka == 1) {
     request.text = request1;
       if (y != 0) {
           [_bt1 setTitle:answer01 forState:normal];
           
           if (x == 1) {
               
               [_bt2 setTitle:answer01 forState:normal];
           }
           
           if (x == 2) {
               [_bt2 setTitle:answer02 forState:normal];
           }
           
           if (x == 3) {
               [_bt2 setTitle:answer03 forState:normal];
           }
           
           if (x == 4) {
               [_bt2 setTitle:answer04 forState:normal];
           }
           
           if (x == 5) {
               [_bt2 setTitle:answer05 forState:normal];
           }
           
           if (x == 6) {
               [_bt2 setTitle:answer06 forState:normal];
           }
           
           if (x == 7) {
               [_bt2 setTitle:answer07 forState:normal];
           }
           

       }
       else
       {
        [_bt2 setTitle:answer01 forState:normal];
           
           if (x == 1) {
               
               [_bt1 setTitle:answer01 forState:normal];
           }
           
           if (x == 2) {
               [_bt1 setTitle:answer02 forState:normal];
           }
           
           if (x == 3) {
               [_bt1 setTitle:answer03 forState:normal];
           }
           
           if (x == 4) {
               [_bt1 setTitle:answer04 forState:normal];
           }
           
           if (x == 5) {
               [_bt1 setTitle:answer05 forState:normal];
           }
           
           if (x == 6) {
               [_bt1 setTitle:answer06 forState:normal];
           }
           
           if (x == 7) {
               [_bt1 setTitle:answer07 forState:normal];
           }
           

       }
   }
    if (guanka == 2)
    {
    request.text = request2;
        if (y != 0) {
            [_bt1 setTitle:answer02 forState:normal];
            
            if (x == 1) {
                
                [_bt2 setTitle:answer01 forState:normal];
            }
            
            if (x == 2) {
                [_bt2 setTitle:answer02 forState:normal];
            }
            
            if (x == 3) {
                [_bt2 setTitle:answer03 forState:normal];
            }
            
            if (x == 4) {
                [_bt2 setTitle:answer04 forState:normal];
            }
            
            if (x == 5) {
                [_bt2 setTitle:answer05 forState:normal];
            }
            
            if (x == 6) {
                [_bt2 setTitle:answer06 forState:normal];
            }
            
            if (x == 7) {
                [_bt2 setTitle:answer07 forState:normal];
            }
        }
            else
            {
                [_bt2 setTitle:answer02 forState:normal];
                
                if (x == 1) {
                    
                    [_bt1 setTitle:answer01 forState:normal];
                }
                
                if (x == 2) {
                    [_bt1 setTitle:answer02 forState:normal];
                }
                
                if (x == 3) {
                    [_bt1 setTitle:answer03 forState:normal];
                }
                
                if (x == 4) {
                    [_bt1 setTitle:answer04 forState:normal];
                }
                
                if (x == 5) {
                    [_bt1 setTitle:answer05 forState:normal];
                }
                
                if (x == 6) {
                    [_bt1 setTitle:answer06 forState:normal];
                }
                
                if (x == 7) {
                    [_bt1 setTitle:answer07 forState:normal];
                }
            }
          
    }
    if (guanka == 3)
    {
        request.text = request3;
        if (y != 0) {
            [_bt1 setTitle:answer03 forState:normal];
            
            if (x == 1) {
                
                [_bt2 setTitle:answer01 forState:normal];
            }
            
            if (x == 2) {
                [_bt2 setTitle:answer02 forState:normal];
            }
            
            if (x == 3) {
                [_bt2 setTitle:answer03 forState:normal];
            }
            
            if (x == 4) {
                [_bt2 setTitle:answer04 forState:normal];
            }
            
            if (x == 5) {
                [_bt2 setTitle:answer05 forState:normal];
            }
            
            if (x == 6) {
                [_bt2 setTitle:answer06 forState:normal];
            }
            
            if (x == 7) {
                [_bt2 setTitle:answer07 forState:normal];
            }
        }
        else
        {
            [_bt2 setTitle:answer03 forState:normal];
            
            if (x == 1) {
                
                [_bt1 setTitle:answer01 forState:normal];
            }
            
            if (x == 2) {
                [_bt1 setTitle:answer02 forState:normal];
            }
            
            if (x == 3) {
                [_bt1 setTitle:answer03 forState:normal];
            }
            
            if (x == 4) {
                [_bt1 setTitle:answer04 forState:normal];
            }
            
            if (x == 5) {
                [_bt1 setTitle:answer05 forState:normal];
            }
            
            if (x == 6) {
                [_bt1 setTitle:answer06 forState:normal];
            }
            
            if (x == 7) {
                [_bt1 setTitle:answer07 forState:normal];
            }
        }

    }
    if (guanka == 4)
    {
        request.text = request4;
        
        if (y != 0) {
            [_bt1 setTitle:answer04 forState:normal];
            
            if (x == 1) {
                
                [_bt2 setTitle:answer01 forState:normal];
            }
            
            if (x == 2) {
                [_bt2 setTitle:answer02 forState:normal];
            }
            
            if (x == 3) {
                [_bt2 setTitle:answer03 forState:normal];
            }
            
            if (x == 4) {
                [_bt2 setTitle:answer04 forState:normal];
            }
            
            if (x == 5) {
                [_bt2 setTitle:answer05 forState:normal];
            }
            
            if (x == 6) {
                [_bt2 setTitle:answer06 forState:normal];
            }
            
            if (x == 7) {
                [_bt2 setTitle:answer07 forState:normal];
            }
        }
        else
        {
            [_bt2 setTitle:answer04 forState:normal];
            
            if (x == 1) {
                
                [_bt1 setTitle:answer01 forState:normal];
            }
            
            if (x == 2) {
                [_bt1 setTitle:answer02 forState:normal];
            }
            
            if (x == 3) {
                [_bt1 setTitle:answer03 forState:normal];
            }
            
            if (x == 4) {
                [_bt1 setTitle:answer04 forState:normal];
            }
            
            if (x == 5) {
                [_bt1 setTitle:answer05 forState:normal];
            }
            
            if (x == 6) {
                [_bt1 setTitle:answer06 forState:normal];
            }
            
            if (x == 7) {
                [_bt1 setTitle:answer07 forState:normal];
            }
        }

    }
 
    if (guanka == 5)
    {
        request.text = request5;
        if (y != 0) {
            [_bt1 setTitle:answer05 forState:normal];
            
            if (x == 1) {
                
                [_bt2 setTitle:answer01 forState:normal];
            }
            
            if (x == 2) {
                [_bt2 setTitle:answer02 forState:normal];
            }
            
            if (x == 3) {
                [_bt2 setTitle:answer03 forState:normal];
            }
            
            if (x == 4) {
                [_bt2 setTitle:answer04 forState:normal];
            }
            
            if (x == 5) {
                [_bt2 setTitle:answer05 forState:normal];
            }
            
            if (x == 6) {
                [_bt2 setTitle:answer06 forState:normal];
            }
            
            if (x == 7) {
                [_bt2 setTitle:answer07 forState:normal];
            }
        }
        else
        {
            [_bt2 setTitle:answer05 forState:normal];
            
            if (x == 1) {
                
                [_bt1 setTitle:answer01 forState:normal];
            }
            
            if (x == 2) {
                [_bt1 setTitle:answer02 forState:normal];
            }
            
            if (x == 3) {
                [_bt1 setTitle:answer03 forState:normal];
            }
            
            if (x == 4) {
                [_bt1 setTitle:answer04 forState:normal];
            }
            
            if (x == 5) {
                [_bt1 setTitle:answer05 forState:normal];
            }
            
            if (x == 6) {
                [_bt1 setTitle:answer06 forState:normal];
            }
            
            if (x == 7) {
                [_bt1 setTitle:answer07 forState:normal];
            }
        }
        
    }
    
    if (guanka == 6)
    {
        request.text = request6;
        if (y != 0) {
            [_bt1 setTitle:answer06 forState:normal];
            
            if (x == 1) {
                
                [_bt2 setTitle:answer01 forState:normal];
            }
            
            if (x == 2) {
                [_bt2 setTitle:answer02 forState:normal];
            }
            
            if (x == 3) {
                [_bt2 setTitle:answer03 forState:normal];
            }
            
            if (x == 4) {
                [_bt2 setTitle:answer04 forState:normal];
            }
            
            if (x == 5) {
                [_bt2 setTitle:answer05 forState:normal];
            }
            
            if (x == 6) {
                [_bt2 setTitle:answer06 forState:normal];
            }
            
            if (x == 7) {
                [_bt2 setTitle:answer07 forState:normal];
            }
        }
        else
        {
            [_bt2 setTitle:answer06 forState:normal];
            
            if (x == 1) {
                
                [_bt1 setTitle:answer01 forState:normal];
            }
            
            if (x == 2) {
                [_bt1 setTitle:answer02 forState:normal];
            }
            
            if (x == 3) {
                [_bt1 setTitle:answer03 forState:normal];
            }
            
            if (x == 4) {
                [_bt1 setTitle:answer04 forState:normal];
            }
            
            if (x == 5) {
                [_bt1 setTitle:answer05 forState:normal];
            }
            
            if (x == 6) {
                [_bt1 setTitle:answer06 forState:normal];
            }
            
            if (x == 7) {
                [_bt1 setTitle:answer07 forState:normal];
            }
        }
        
    }
    
    if (guanka == 7)
    {
        request.text = request7;
        if (y != 0) {
            [_bt1 setTitle:answer07 forState:normal];
            
            if (x == 1) {
                
                [_bt2 setTitle:answer01 forState:normal];
            }
            
            if (x == 2) {
                [_bt2 setTitle:answer02 forState:normal];
            }
            
            if (x == 3) {
                [_bt2 setTitle:answer03 forState:normal];
            }
            
            if (x == 4) {
                [_bt2 setTitle:answer04 forState:normal];
            }
            
            if (x == 5) {
                [_bt2 setTitle:answer05 forState:normal];
            }
            
            if (x == 6) {
                [_bt2 setTitle:answer06 forState:normal];
            }
            
            if (x == 7) {
                [_bt2 setTitle:answer07 forState:normal];
            }
        }
        else
        {
            [_bt2 setTitle:answer07 forState:normal];
            
            if (x == 1) {
                
                [_bt1 setTitle:answer01 forState:normal];
            }
            
            if (x == 2) {
                [_bt1 setTitle:answer02 forState:normal];
            }
            
            if (x == 3) {
                [_bt1 setTitle:answer03 forState:normal];
            }
            
            if (x == 4) {
                [_bt1 setTitle:answer04 forState:normal];
            }
            
            if (x == 5) {
                [_bt1 setTitle:answer05 forState:normal];
            }
            
            if (x == 6) {
                [_bt1 setTitle:answer06 forState:normal];
            }
            
            if (x == 7) {
                [_bt1 setTitle:answer07 forState:normal];
            }
        }
        
    }
    
    
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
	// Release anything that's not essential, such as cached data
}


- (IBAction)answer1:(id)sender {
    
    NSLog(@"%@",_bt1.currentTitle);
   
    if (guanka == 1)
    {
     
        if (_bt1.currentTitle == answer01) {
              UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"答案" message:@"恭喜你答对了！" delegate:self
                                              cancelButtonTitle:answer01
                                              otherButtonTitles: nil];
        [alert show];
            
            guanka = guanka + 1;
            
            NSLog(@"关卡：%d",guanka);
            guank.text =  [NSString stringWithFormat:@"%d", guanka];
       [self newgame];

         
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"答案" message:@"很遗憾，您答错了。" delegate:self
                                                  cancelButtonTitle:@"再接再励"
                                                  otherButtonTitles: nil];
            [alert show];
        
        }

          }
    
  
   else if (guanka == 2)
    {
        if (_bt1.currentTitle == answer02)
        {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"答案" message:@"恭喜你答对了！" delegate:self
                                            cancelButtonTitle:answer02
                                            otherButtonTitles: nil];
            [alert show];
            
            guanka = guanka + 1;
            
            NSLog(@"关卡：%d",guanka);
            guank.text =  [NSString stringWithFormat:@"%d", guanka];
         [self newgame];
        }
        
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"答案" message:@"很遗憾，您答错了。" delegate:self
                                                  cancelButtonTitle:@"再接再励"
                                                  otherButtonTitles: nil];
            [alert show];
        }
    }
  else if
   (guanka == 3)
    {
        if (_bt1.currentTitle == answer03)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"答案" message:@"恭喜你答对了！" delegate:self
                                                  cancelButtonTitle:answer03
                                                  otherButtonTitles: nil];
            [alert show];
            
            guanka = guanka + 1;
            
            NSLog(@"关卡：%d",guanka);
            guank.text =  [NSString stringWithFormat:@"%d", guanka];
        [self newgame];
        }
        
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"答案" message:@"很遗憾，您答错了。" delegate:self
                                                  cancelButtonTitle:@"再接再励"
                                                  otherButtonTitles: nil];
            [alert show];
        }
    }
 else if (guanka == 4)
    {
        if (_bt1.currentTitle == answer04)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"答案" message:@"恭喜你答对了！" delegate:self
                                                  cancelButtonTitle:answer04
                                                  otherButtonTitles: nil];
            [alert show];
            
            guanka = guanka + 1;
            
            NSLog(@"关卡：%d",guanka);
            guank.text =  [NSString stringWithFormat:@"%d", guanka];
         [self newgame];
        }
        
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"答案" message:@"很遗憾，您答错了。" delegate:self
                                                  cancelButtonTitle:@"再接再励"
                                                  otherButtonTitles: nil];
            [alert show];
        }
    }
   else if (guanka == 5)
    {
        if (_bt1.currentTitle == answer05)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"答案" message:@"恭喜你答对了！" delegate:self
                                                  cancelButtonTitle:answer05
                                                  otherButtonTitles: nil];
            [alert show];
            
            guanka = guanka + 1;
            
            NSLog(@"关卡：%d",guanka);
            guank.text =  [NSString stringWithFormat:@"%d", guanka];
        [self newgame];
        }
        
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"答案" message:@"很遗憾，您答错了。" delegate:self
                                                  cancelButtonTitle:@"再接再励"
                                                  otherButtonTitles: nil];
            [alert show];
        }
    }
    
  else if (guanka == 6)
    {
        if (_bt1.currentTitle == answer06)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"答案" message:@"恭喜你答对了！" delegate:self
                                                  cancelButtonTitle:answer06
                                                  otherButtonTitles: nil];
            [alert show];
            
            guanka = guanka + 1;
            
            NSLog(@"关卡：%d",guanka);
            guank.text =  [NSString stringWithFormat:@"%d", guanka];
         [self newgame];
        }
        
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"答案" message:@"很遗憾，您答错了。" delegate:self
                                                  cancelButtonTitle:@"再接再励"
                                                  otherButtonTitles: nil];
            [alert show];
        }
    }
else if  (guanka == 7)
    {
        if (_bt1.currentTitle == answer07)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"答案" message:@"恭喜你答对了！" delegate:self
                                                  cancelButtonTitle:answer07
                                                  otherButtonTitles: nil];
            [alert show];
            
            guanka = guanka + 1;
            
            NSLog(@"关卡：%d",guanka);
            guank.text =  [NSString stringWithFormat:@"%d", guanka];
          [self newgame];
        }
        
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"答案" message:@"很遗憾，您答错了。" delegate:self
                                                  cancelButtonTitle:@"再接再励"
                                                  otherButtonTitles: nil];
            [alert show];
        }
    }
else if (guanka > 7)
  {
      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"通关" message:@"恭喜你闯关成功" delegate:self
                                            cancelButtonTitle:@"恭喜"
                                            otherButtonTitles: nil];
      [alert show];
  }


    
    }

- (IBAction)answer2:(id)sender {
    
    NSLog(@"%@",_bt2.currentTitle);
    
    if (guanka == 1)
    {
        
        if (_bt2.currentTitle == answer01) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"答案" message:@"恭喜你答对了！" delegate:self
                                                  cancelButtonTitle:answer01
                                                  otherButtonTitles: nil];
            [alert show];
            
            guanka = guanka + 1;
            
            NSLog(@"关卡：%d",guanka);
            guank.text =  [NSString stringWithFormat:@"%d", guanka];
        [self newgame];
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"答案" message:@"很遗憾，您答错了。" delegate:self
                                                  cancelButtonTitle:@"再接再励"
                                                  otherButtonTitles: nil];
            [alert show];
            
        }
    }
    else if (guanka == 2)
    {
        if (_bt2.currentTitle == answer02)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"答案" message:@"恭喜你答对了！" delegate:self
                                                  cancelButtonTitle:answer02
                                                  otherButtonTitles: nil];
            [alert show];
            
            guanka = guanka + 1;
            
            NSLog(@"关卡：%d",guanka);
            guank.text =  [NSString stringWithFormat:@"%d", guanka];
         [self newgame];
        }
        
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"答案" message:@"很遗憾，您答错了。" delegate:self
                                                  cancelButtonTitle:@"再接再励"
                                                  otherButtonTitles: nil];
            [alert show];
        }
    }
    else if  (guanka == 3)
    {
        if (_bt2.currentTitle == answer03)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"答案" message:@"恭喜你答对了！" delegate:self
                                                  cancelButtonTitle:answer03
                                                  otherButtonTitles: nil];
            [alert show];
            
            guanka = guanka + 1;
            
            NSLog(@"关卡：%d",guanka);
            guank.text =  [NSString stringWithFormat:@"%d", guanka];
          [self newgame];
        }
        
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"答案" message:@"很遗憾，您答错了。" delegate:self
                                                  cancelButtonTitle:@"再接再励"
                                                  otherButtonTitles: nil];
            [alert show];
        }
    }
  else if  (guanka == 4)
    {
        if (_bt2.currentTitle == answer04)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"答案" message:@"恭喜你答对了！" delegate:self
                                                  cancelButtonTitle:answer04
                                                  otherButtonTitles: nil];
            [alert show];
            
            guanka = guanka + 1;
            
            NSLog(@"关卡：%d",guanka);
            guank.text =  [NSString stringWithFormat:@"%d", guanka];
        [self newgame];
        }
        
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"答案" message:@"很遗憾，您答错了。" delegate:self
                                                  cancelButtonTitle:@"再接再励"
                                                  otherButtonTitles: nil];
            [alert show];
        }
    }
  else if  (guanka == 5)
    {
        if (_bt2.currentTitle == answer05)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"答案" message:@"恭喜你答对了！" delegate:self
                                                  cancelButtonTitle:answer05
                                                  otherButtonTitles: nil];
            [alert show];
            
            guanka = guanka + 1;
            
            NSLog(@"关卡：%d",guanka);
            guank.text =  [NSString stringWithFormat:@"%d", guanka];
          [self newgame];
        }
        
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"答案" message:@"很遗憾，您答错了。" delegate:self
                                                  cancelButtonTitle:@"再接再励"
                                                  otherButtonTitles: nil];
            [alert show];
        }
    }
else if (guanka == 6)
    {
        if (_bt2.currentTitle == answer06)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"答案" message:@"恭喜你答对了！" delegate:self
                                                  cancelButtonTitle:answer06
                                                  otherButtonTitles: nil];
            [alert show];
            
            guanka = guanka + 1;
            
            NSLog(@"关卡：%d",guanka);
            guank.text =  [NSString stringWithFormat:@"%d", guanka];
          [self newgame];
        }
        
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"答案" message:@"很遗憾，您答错了。" delegate:self
                                                  cancelButtonTitle:@"再接再励"
                                                  otherButtonTitles: nil];
            [alert show];
        }
    }
else if (guanka == 7)
    {
        if (_bt2.currentTitle == answer07)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"答案" message:@"恭喜你答对了！" delegate:self
                                                  cancelButtonTitle:answer07
                                                  otherButtonTitles: nil];
            [alert show];
            
            guanka = guanka + 1;
            
            NSLog(@"关卡：%d",guanka);
            guank.text =  [NSString stringWithFormat:@"%d", guanka];
           [self newgame];
        }
        
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"答案" message:@"很遗憾，您答错了。" delegate:self
                                                  cancelButtonTitle:@"再接再励"
                                                  otherButtonTitles: nil];
            [alert show];
        }
    }
    else if  (guanka > 7)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"通关" message:@"恭喜你闯关成功" delegate:self
                                              cancelButtonTitle:@"恭喜"
                                              otherButtonTitles: nil];
        [alert show];
    }
   
}

- (IBAction)newgameon:(id)sender
{
    guanka = 1;
   guank.text =  [NSString stringWithFormat:@"%d", guanka];
    [self newgame];
  
    
}

- (void)next
    {
        
    }

@end
