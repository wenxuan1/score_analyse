import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();

class ScoreList {
  List list = [
    {
      'id': 0,
      'name': "开学考试",
      'time': "2020年 6月13日"
    },
    {
      'id': 1,
      'name': "第一次摸底考试",
      'time': "2020年 7月1日"
    },
    {
      'id': 2,
      'name': "第二次考试",
      'time': "2021年 7月23日"
    },
    {
      'id': 3,
      'name': "第三次考试",
      'time': "2023年 9月23日"
    },
    {
      'id': 4,
      'name': "第四次摸底考试",
      'time': "2020年 7月13日"
    },
    {
      'id': 5,
      'name': "第五次期中考试",
      'time': "2021年 1月23日"
    },
    {
      'id': 6,
      'name': "第六次期中考试",
      'time': "2021年 9月23日"
    },
    {
      'id': 7,
      'name': "第七次摸底考试",
      'time': "2021年 7月1日"
    },
    {
      'id': 8,
      'name': "期末考试",
      'time': "2021年 7月23日"
    },
    {
      'id': 9,
      'name': "第一百次考试",
      'time': "2023年 9月23日"
    }
  ];

  ScoreList(this.list);
}
