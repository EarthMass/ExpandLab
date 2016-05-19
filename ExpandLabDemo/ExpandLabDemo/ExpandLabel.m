//
//  ExpandLabel.m
//  TestProject
//
//  Created by Guohx on 16/4/26.
//
//

#import "ExpandLabel.h"

static int canClickContainerToExpand = 1; ///<点击 控件区域 控制展开 0 NO,1 YES
static int MIN_LINES_CAN_EXPAND  = 2;
static int FONT_SIZE = 12;

static CGFloat SpaceX = 10.0f;
static CGFloat SpaceY = 10.0f;

@interface ExpandLabel()

@property (nonatomic, strong) UILabel * desLab; ///<文字
@property (nonatomic, strong) UIButton * expandBtn; ///<按钮
@property (nonatomic, assign) BOOL hasExpandBtn; ///<是否显示 展开按钮

@property (nonatomic, strong) UIButton * containerBtn; ///<容器 按钮 控制点击

@property (nonatomic, copy) ExpandLabBlock expandLabBlock;

@end


@implementation ExpandLabel


- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setLabelText:(NSString *)text expandBlock:(ExpandLabBlock)expandBlock {
    
    _expandLabBlock = expandBlock;
    
    [self removeViewInSuperView];
    
    self.desLab = [[UILabel alloc] initWithFrame:CGRectMake(SpaceX, SpaceY, self.frame.size.width - 2*SpaceX, 0)];
    _desLab.font = [UIFont systemFontOfSize:FONT_SIZE];
    _desLab.textColor = [UIColor blackColor];
    
    _desLab.backgroundColor = [UIColor clearColor];
    _desLab.numberOfLines = MIN_LINES_CAN_EXPAND;
    
    [self addSubview:_desLab];
    
    CGSize desLabSize = [text boundingRectWithSize:CGSizeMake(_desLab.frame.size.width, 1000) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:_desLab.font} context:nil].size;

    _desLab.text = [NSString stringWithFormat:@"\t%@",text];
    [_desLab sizeToFit];
    
    //模拟 内容
    NSString * simulateStr = [NSString string];
    for (int i= 0; i < MIN_LINES_CAN_EXPAND; i ++) {
        simulateStr = [simulateStr stringByAppendingString:@"\n"];
    }
    
    //最小可展开的高度
    CGSize limitHForExpandSize = [simulateStr boundingRectWithSize:CGSizeMake(_desLab.frame.size.width, 1000) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:_desLab.font} context:nil].size;
    
    if (desLabSize.height > limitHForExpandSize.height) {
        NSLog(@"--可展开");
        self.expandBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width - 40 - SpaceX, _desLab.frame.size.height + _desLab.frame.origin.y + SpaceY, 40, 20)];

        _expandBtn.titleLabel.font = [UIFont systemFontOfSize:FONT_SIZE];
        
        _expandBtn.backgroundColor = [UIColor yellowColor];
        
        //        expandBtn.backgroundColor = [UIColor redColor];
        [_expandBtn setTitle:@"展开▽" forState:UIControlStateNormal];
        [_expandBtn setTitle:@"收起△" forState:UIControlStateSelected];
        
        [_expandBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        
        [_expandBtn addTarget:self action:@selector(expandBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:_expandBtn];
        
        _hasExpandBtn = YES;
        
        CGRect selfFrame = self.frame;
        selfFrame.size.height = _expandBtn.frame.origin.y + SpaceY + _expandBtn.frame.size.height;
        self.frame = selfFrame;
        
        //点击控件区域 控制展开 收起
        if (canClickContainerToExpand) {
            _containerBtn = [[UIButton alloc] initWithFrame:CGRectZero];
            [_containerBtn addTarget:self action:@selector(expandBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//            _co1203ntainerBtn.backgroundColor = [UIColor colorWithRed:1.000 green:1.000 blue:0.000 alpha:0.350];
            [self addSubview:_containerBtn];
        }
        
    } else {
        
        _hasExpandBtn = NO;
        
        CGRect selfFrame = self.frame;
        selfFrame.size.height = _desLab.frame.size.height + 2*SpaceY;
        self.frame = selfFrame;
        
        
    }
    
   
}

- (void)removeViewInSuperView {
    
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    _hasExpandBtn = NO;
}

- (void)layoutSubviews {
    NSLog(@"layoutSubviews");
    
    CGRect selfFrame = self.frame;
    
    
    if (_hasExpandBtn) {
        selfFrame.size.height = _expandBtn.frame.origin.y + SpaceY + _expandBtn.frame.size.height;
    } else {
        selfFrame.size.height = _desLab.frame.origin.y + SpaceY + _desLab.frame.size.height;
    }
    
    self.frame = selfFrame;
    _containerBtn.frame = self.bounds;
    if (_expandLabBlock) {
        _expandLabBlock();
    }

}

#pragma mark- 展开按钮点击 展开 收起
- (void)expandBtnClick:(UIButton *)sender {
    
    if (!_expandBtn) {
        return;
    }
    _expandBtn.selected = !_expandBtn.selected;
    
    if (_expandBtn.selected) {
        _desLab.numberOfLines = 0;
        
    } else {
        _desLab.numberOfLines = MIN_LINES_CAN_EXPAND;
    }
    [_desLab sizeToFit];
    _expandBtn.frame = CGRectMake(self.frame.size.width - 40 - SpaceX, _desLab.frame.size.height + _desLab.frame.origin.y + SpaceY, 40, 20);
    
   
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
