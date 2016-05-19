//
//  ExpandLabel.h
//  TestProject
//
//  Created by Guohx on 16/4/26.
//
//

#import <UIKit/UIKit.h>

typedef void(^ExpandLabBlock)(void);
/**
 *  可展开的Label
 */
@interface ExpandLabel : UIView

/**
 *  设置内容 以及相应位置的控件frame改变的block
 *
 *  @param text        内容
 *  @param expandBlock 此处改变 对应控件 frame
 */
- (void)setLabelText:(NSString *)text expandBlock:(ExpandLabBlock)expandBlock;

@end
