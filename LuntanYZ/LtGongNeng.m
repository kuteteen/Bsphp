#import <WebKit/WebKit.h>
#import "LtShengMing.h"
#import <CaptainHook/CaptainHook.h>
#import <UIKit/UIKit.h>
#import <Cycript/Cycript.h>

#import "SCLAlertView.h"
#import "LtShengMing.h"
#import "LtConfig.h"

//构建功能详细代码
//匹配关键词

static NSString *MUFENGKEY  =   @"MUFENG";
@interface JD : UIViewController<WKNavigationDelegate>
@end
@implementation JD
static JD *jd = nil;
+ (JD *)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (jd == nil) {
            jd = [[self alloc] init];
        }
    });
    return jd;
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    @autoreleasepool {
        
        
        NSString *doc = @"document.body.outerHTML";
        [webView evaluateJavaScript:doc
                  completionHandler:^(id _Nullable htmlStr, NSError * _Nullable error)
        {
                      if (error)
                      {
                          NSLog(@"JSError:%@",error);
                      }
                      NSLog(@"html:%@",htmlStr);
            if ([(NSString *)htmlStr containsString:@"欢迎注册登陆"])
            {
                [webView removeFromSuperview];
                SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];
                [alert addTimerToButtonIndex:0 reverse:YES];
                [alert addButton:@"登陆" actionBlock:^{
                    
                    [NSObject denglu];
                    
                }];
                [alert addButton:@"注册" actionBlock:^{
                    
                    [NSObject zhuche];
                    
                }];
                [alert showWaiting:@"登陆提示" subTitle:@"您没登入\n请先/注册/登陆\n购买VIP即可" closeButtonTitle:nil duration:4];
            }
            
            if ([(NSString *)htmlStr containsString:@"状态普通"])
            {
                SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];
                [alert addTimerToButtonIndex:0 reverse:YES];
                [webView removeFromSuperview];
                
                NSRange name1 = [htmlStr rangeOfString:@"66166"];
                NSRange name2 = [htmlStr rangeOfString:@"99199"];
                NSRange name = NSMakeRange(name1.location + name1.length, name2.location - name1.location - name1.length);
                NSString *member = [htmlStr substringWithRange:name];
                [alert addButton:@"购买VIP会员"  actionBlock:^{
                    [NSObject goumai];
                }];
                [alert addButton:@"退出游戏"  actionBlock:^{
                    exit(0);
                }];
                                                            
                                                        
                [alert showInfo:member subTitle:@"您不是VIP用请先购买" closeButtonTitle:nil duration:10];
            }
            if ([(NSString *)htmlStr containsString:htmlStr])//设备检查
            {
               if ([htmlStr containsString:@"本机"]) {
                    if ([htmlStr containsString:@"其他设备"])
                    {
                        SCLAlertView *alert =[[SCLAlertView alloc] initWithNewWindow];
                        [alert addTimerToButtonIndex:0 reverse:YES];
                        
                        [alert showWarning:nil title:@"登陆设备过多" subTitle:@"请往下翻动\n除本机外 其他设备退出\n登陆太多设备禁封论坛VIP后果自负" closeButtonTitle:@"知道" duration:5];
                        NSLog(@"提示设备多提示退出方法");
                    }
                    else {
                        [webView removeFromSuperview];
                            [NSObject huoqukey];
                           
                       

                        
                        
                       
                    }
                    
                }
                
            }
            
            if ([(NSString *)htmlStr containsString:@"尊敬的VIP用户"])
            {
                
                [NSObject huoqukey];
                [webView removeFromSuperview];
            }
            
            
        }] ;


    }
}




/**清除缓存和cookie*/

- (void)cleanCacheAndCookie{
    
    //清除cookies
    
    NSHTTPCookie *cookie;
    
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    
    for (cookie in [storage cookies]){
        
        [storage deleteCookie:cookie];
        
    }
    
    //清除UIWebView的缓存
    
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    
    NSURLCache * cache = [NSURLCache sharedURLCache];
    
    [cache removeAllCachedResponses];
    
    [cache setDiskCapacity:0];
    
    [cache setMemoryCapacity:0];
    
}
  


@end
@implementation NSObject (hook)
- (BOOL)shouye//1
{
    UIWindow    *window =   [[UIApplication sharedApplication] keyWindow];
    WKWebView   *webView    =   [[WKWebView alloc] initWithFrame:window.bounds];
    webView.navigationDelegate  =   [JD sharedInstance];
   
    [webView loadRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://iosgods.cn/"]]];
    [window addSubview:webView];
    return 0;
}


- (BOOL)denglu//2
{
    
       dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
           
           UIWindow    *window =   [[UIApplication sharedApplication] keyWindow];
           WKWebView   *webView    =   [[WKWebView alloc] initWithFrame:window.bounds];
           webView.navigationDelegate  =   [JD sharedInstance];
          
           [webView loadRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://iosgods.cn/index.php?/login/"]]];
           [window addSubview:webView];
           
           
           
       });
      
    return 0;
    
}
- (BOOL)zhuche//3
{
    
       dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
           
           UIWindow    *window =   [[UIApplication sharedApplication] keyWindow];
           WKWebView   *webView    =   [[WKWebView alloc] initWithFrame:window.bounds];
           webView.navigationDelegate  =   [JD sharedInstance];
          
           [webView loadRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://iosgods.cn/index.php?/register/"]]];
           [window addSubview:webView];
       });
    return 0;
    
}
- (BOOL)goumai//4
{
    
       dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
           
           UIWindow    *window =   [[UIApplication sharedApplication] keyWindow];
           WKWebView   *webView    =   [[WKWebView alloc] initWithFrame:window.bounds];
           webView.navigationDelegate  =   [JD sharedInstance];
          
           [webView loadRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://iosgods.cn/index.php?/clients/credit/"]]];
           [window addSubview:webView];
       });
    return 0;
    
}
-(BOOL)huoqukey//5
{
   
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSString *requestStr = @"https://iosgods.cn/";
        NSString *htmlStr = [NSString stringWithContentsOfURL:[NSURL URLWithString:requestStr] encoding:NSUTF8StringEncoding error:nil];
        
        NSRange name1 = [htmlStr rangeOfString:@"我日"];
        NSRange name2 = [htmlStr rangeOfString:@"你妈"];
        NSRange name = NSMakeRange(name1.location + name1.length, name2.location - name1.location - name1.length);
        NSString *member = [htmlStr substringWithRange:name];
        NSLog(@"打印出用ID啦：    %@",member);
        NSString *url = @"https://iosgods.cn/html/index.php?member_id=";
        NSLog(@"打印拼接后的URL：    %@%@",url,member);
        NSString * mysql = [url stringByAppendingString:member];
        NSLog(@"打印mysql链接：    %@",mysql);
        
        NSLog(@"验证设备");
        NSString *mysqlurl = [NSString stringWithContentsOfURL:[NSURL URLWithString:mysql] encoding:NSUTF8StringEncoding error:nil];
        UIWindow    *window =   [[UIApplication sharedApplication] keyWindow];
        WKWebView   *webView    =   [[WKWebView alloc] initWithFrame:window.bounds];
//        NSLog(@"打印出用KEY啦：    %@",mysqlurl);
        
        if ((mysqlurl.length)>50) {
           
            
            SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];
            [alert addTimerToButtonIndex:0 reverse:YES];
            [alert addButton:@"退出其他设备" actionBlock:^{
//                NSLog(@"打印出用KEY啦：    %@",mysqlurl);
//                NSLog(@"长度大于33  ：%@",mysqlurl);
                [webView loadRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://iosgods.cn/index.php?/settings/devices/"]]];
                [window addSubview:webView];
//                NSLog(@"打印出用KEY啦：    %@",mysqlurl);
               
            }];
            [alert showSuccess:@"被迫下线" subTitle:@"您的账号在其地方登入" closeButtonTitle:nil duration:5];
            
        }
        if ((mysqlurl.length)<50 && 20<(mysqlurl.length))  {
            
            SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];
            [alert addTimerToButtonIndex:0 reverse:YES];
            NSRange vip1 = [htmlStr rangeOfString:@"44144"];
            NSRange vip2 = [htmlStr rangeOfString:@"55155"];
            NSRange range = NSMakeRange(vip1.location + vip1.length, vip2.location - vip1.location - vip1.length);
            NSString *vipday = [htmlStr substringWithRange:range];
            NSRange name1 = [htmlStr rangeOfString:@"66166"];
            NSRange name2 = [htmlStr rangeOfString:@"99199"];
            NSRange name = NSMakeRange(name1.location + name1.length, name2.location - name1.location - name1.length);
            NSString *member = [htmlStr substringWithRange:name];

            
            [alert addButton:@"开始游戏" actionBlock:^{
                //当 20<KEY<50 开始循环
               
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                    NSLog(@"打印出用KEY啦：    %@",mysqlurl);
//                    NSLog(@"验证成功 长度小于33  ：%@",mysqlurl);
                    
                    //设置时间间隔
                    static dispatch_source_t _timer;
                    NSTimeInterval period = 120.f;
                    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
                    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
                    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), period * NSEC_PER_SEC, 0);
                    // 事件回调
                    dispatch_source_set_event_handler(_timer, ^{
                        dispatch_async(dispatch_get_main_queue(), ^{
                            NSString *mysqlurl = [NSString stringWithContentsOfURL:[NSURL URLWithString:mysql] encoding:NSUTF8StringEncoding error:nil];
                            
                            if ((mysqlurl.length)>50) {
                                NSLog(@"打印出用KEY啦：    %@",mysqlurl);
                                NSLog(@"长度大于33  打开设备退出界面：%@",mysqlurl);
                                
                                SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];
                                [alert addTimerToButtonIndex:0 reverse:YES];
                                [alert addButton:@"退出其他设备" actionBlock:^{
                                    //当KEY>50提示设备
                                    [NSObject shebei];
                                    //关闭定时器循环
                                    dispatch_source_cancel(_timer);
                                    
                                    
                                }];
                                [alert addButton:@"退出游戏" actionBlock:^{
                                    exit(0);
                                }];
                                [alert showSuccess:@"被迫下线" subTitle:@"您的账号在其地方登入" closeButtonTitle:nil duration:5];
                                
                            } else {
                                //KEY当没有或者小于50 关闭浏览器
                                
                                [webView removeFromSuperview];
                                
                            }
                        });});
                        
                    // 开启定时器
                    dispatch_resume(_timer);
                        
                    // 关闭定时器
                    // dispatch_source_cancel(_timer);
                    
                   
                });
                
                //当 20<KEY<50 循环结束
               
            }];
            [alert addButton:@"购买/续费" actionBlock:^{
                [NSObject goumai];
            }];
            [alert showSuccess:member subTitle:vipday closeButtonTitle:nil duration:5];
            
        }
    });
    return 0;
    
    
    
}

- (BOOL)shebei//6
{
    
       dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
           
           UIWindow    *window =   [[UIApplication sharedApplication] keyWindow];
           WKWebView   *webView    =   [[WKWebView alloc] initWithFrame:window.bounds];
           webView.navigationDelegate  =   [JD sharedInstance];
          
           [webView loadRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://iosgods.cn/index.php?/settings/devices"]]];
           [window addSubview:webView];
         

             
           
       });
    return 0;
    
}




@end
