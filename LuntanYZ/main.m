#import <Foundation/Foundation.h>
#import "LtShengMing.h"
#import <WebKit/WebKit.h>
#import "SCLAlertView.h"
#import "Gongneng.h"
#import "LtShengMing.h"
#import "DLGMem.h"
//程序主文件代码
@implementation main : NSObject
static void __attribute__((constructor)) entry()
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[[DLGMem alloc] init] launchDLGMem];
    });
    if (1)
    {
        [NSObject shouye];
    }else
    {
        [NSObject Bsphp];
    }
}



@end

