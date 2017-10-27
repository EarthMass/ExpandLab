
//
//  UIkitVC.m
//  TestProject
//
//  Created by Guohx on 16/4/26.
//
//

#import "UIkitVC.h"
#import "ExpandLabel.h"

@interface UIkitVC () {
    ExpandLabel * expandLab;
    UILabel * bottomLab;
}

@end

@implementation UIkitVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initUI];
}

- (void)initUI {
    
    
    __block typeof(self) weakSelf = self;
    
    expandLab = [[ExpandLabel alloc] initWithFrame:CGRectMake(10, 50, 300, 600)];
    [expandLab setLabelText:@"放大发发看房看房卡难看啦女阿卡拉萨路那边那把大把大神了奥德赛吧是不是把那边艾斯比啊是\n\ndafa放大发发看房看房卡难看啦女阿卡拉萨路那边那把大把大神了奥德赛吧是不是把那边艾斯比啊是\n\ndafa放大发发看房看房卡难看啦女阿卡拉萨路那边那把大把大神了奥德赛吧是不是把那边艾斯比啊是\n\ndafa放大发发看房看房卡难看啦女阿卡拉萨路那边那把大把大神了奥德赛吧是不是把那边艾斯比啊是\n\ndafa" expandBlock:^{
        
        //点击展开 界面重新布局
        [weakSelf updateUI];
    }];
    expandLab.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:expandLab];
    
    bottomLab = [[UILabel alloc] initWithFrame:CGRectMake(0, expandLab.frame.origin.y + expandLab.frame.size.height + 20, 320, 20)];
    bottomLab.text = @"底部控件 用于";
    [self.view addSubview:bottomLab];
    
    //按钮
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 500, 200, 20)];
    [btn addTarget:self action:@selector(changeText:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"改变文字" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [btn setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn];
}

- (void)updateUI {
    bottomLab.frame = CGRectMake(0, expandLab.frame.origin.y + expandLab.frame.size.height + 20, 320, 20);
}

- (void)changeText:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    
    __block typeof(self) weakSelf = self;
    
    if (sender.selected) {
        [expandLab setLabelText:@"放大发发看房看房卡难看啦" expandBlock:^{
            
            //点击展开 界面重新布局
            [weakSelf updateUI];
        }];
    } else {
        [expandLab setLabelText:@"With in-depth panel discussions on domestic and global news and current affairs, Today gives you the story behind the headlines." expandBlock:^{
            
            //点击展开 界面重新布局
            [weakSelf updateUI];
        }];

    }
    
    [self updateUI];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
