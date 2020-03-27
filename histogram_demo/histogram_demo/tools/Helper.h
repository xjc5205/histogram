
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Helper : NSObject

//截取保留两位小数
+(NSString *)notRounding:(NSString *)price afterPoint:(NSInteger)position;
@end
