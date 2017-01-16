
#import <UIKit/UIKit.h>

typedef enum{
    /** 最新 */
    XMmessageTypeNewest = 1,
    /** 新闻 */
    XMmessageTypenews = 2,
    /** 赛事 */
    XMmessageTypePlay = 3,
    /** 娱乐 */
    XMmessageTypeGame = 4,
}XMmessageType;//信息类型


/** 用户注册成功的通知 */
UIKIT_EXTERN NSString *XMRegisterSuccessNotification;

/** 用户登录成功的通知 */
UIKIT_EXTERN NSString *XMLoginSuccessNotification;

/** 用户需要自动登录 */
UIKIT_EXTERN NSString *XMautoLoginNotification;
/** 用户获取数据成功 */
UIKIT_EXTERN NSString *XMNewsNotification;








