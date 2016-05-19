# ExpandLab
可展开的Label控件
使用：IOS7+

可展开的Label
可设置最小行数
点击整个区域展开隐藏
UI更新通过block

一个简单的小控件

expandLab = [[ExpandLabel alloc] initWithFrame:CGRectMake(10, 50, 300, 600)];
    [expandLab setLabelText:@"放大发发看房看房卡难看啦女阿卡拉萨路那边那把大把大神了奥德赛吧是不是把那边艾斯比啊是\n\ndafa放大发发看房看房卡难看啦女阿卡拉萨路那边那把大把大神了奥德赛吧是不是把那边艾斯比啊是\n\ndafa放大发发看房看房卡难看啦女阿卡拉萨路那边那把大把大神了奥德赛吧是不是把那边艾斯比啊是\n\ndafa放大发发看房看房卡难看啦女阿卡拉萨路那边那把大把大神了奥德赛吧是不是把那边艾斯比啊是\n\ndafa" expandBlock:^{
        
        //点击展开 界面重新布局
        [weakSelf updateUI];
    }];
