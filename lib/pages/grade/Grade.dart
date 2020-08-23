import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:score_analyse/components/addDialog/AddDialog.dart';

class Grade extends StatefulWidget {
  int examId;

  Grade({Key key, this.examId}) : super(key: key);

  @override
  _GradeState createState() => _GradeState();
}

class User {
  final String studentNames;
  final int china;
  final int math;
  final int english;
  final int physics;
  final int chemistry;
  final int biology;
  final int total;
  bool selected = false;

  User(this.studentNames, this.china, this.math, this.english,
      this.physics, this.chemistry, this.biology, this.total, {this.selected = false});
}

class _GradeState extends State<Grade> {
  // 考试假数据（考试具体成绩信息展示）
  List _list = [
    {
      'id': 0,
      'name': "开学考试",
      'time': "2020年 6月13日",
      'score': {
        '王五': {
          'china': 95,
          'math': 90,
          'english': 86,
          'physics': 91,
          'chemistry': 93,
          'biology': 89
        },
        '张三': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三1': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四2': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三3': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四4': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三5': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四6': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三7': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四8': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三9': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四10': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三11': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四12': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三13': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四14': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        }
      }
    },
    {
      'id': 1,
      'name': "第一次摸底考试",
      'time': "2020年 7月1日",
      'score': {
        '王五': {
          'china': 95,
          'math': 90,
          'english': 86,
          'physics': 91,
          'chemistry': 93,
          'biology': 89
        },
        '张三': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三1': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四2': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三3': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四4': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三5': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四6': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三7': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四8': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三9': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四10': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三11': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四12': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三13': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四14': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        }
      }
    },
    {
      'id': 2,
      'name': "第二次考试",
      'time': "2021年 7月23日",
      'score': {
        '王五': {
          'china': 95,
          'math': 90,
          'english': 86,
          'physics': 91,
          'chemistry': 93,
          'biology': 89
        },
        '张三': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三1': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四2': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三3': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四4': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三5': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四6': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三7': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四8': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三9': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四10': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三11': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四12': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三13': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四14': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        }
      }
    },
    {
      'id': 3,
      'name': "第三次考试",
      'time': "2023年 9月23日",
      'score': {
        '王五': {
          'china': 95,
          'math': 90,
          'english': 86,
          'physics': 91,
          'chemistry': 93,
          'biology': 89
        },
        '张三': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三1': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四2': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三3': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四4': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三5': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四6': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三7': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四8': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三9': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四10': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三11': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四12': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三13': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四14': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        }
      }
    },
    {
      'id': 4,
      'name': "第四次摸底考试",
      'time': "2020年 7月13日",
      'score': {
        '王五': {
          'china': 95,
          'math': 90,
          'english': 86,
          'physics': 91,
          'chemistry': 93,
          'biology': 89
        },
        '张三': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三1': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四2': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三3': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四4': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三5': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四6': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三7': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四8': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三9': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四10': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三11': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四12': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三13': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四14': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        }
      }
    },
    {
      'id': 5,
      'name': "第五次期中考试",
      'time': "2021年 1月23日",
      'score': {
        '王五': {
          'china': 95,
          'math': 90,
          'english': 86,
          'physics': 91,
          'chemistry': 93,
          'biology': 89
        },
        '张三': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三1': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四2': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三3': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四4': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三5': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四6': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三7': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四8': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三9': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四10': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三11': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四12': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三13': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四14': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        }
      }
    },
    {
      'id': 6,
      'name': "第六次期中考试",
      'time': "2021年 9月23日",
      'score': {
        '王五': {
          'china': 95,
          'math': 90,
          'english': 86,
          'physics': 91,
          'chemistry': 93,
          'biology': 89
        },
        '张三': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三1': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四2': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三3': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四4': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三5': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四6': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三7': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四8': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三9': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四10': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三11': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四12': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三13': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四14': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        }
      }
    },
    {
      'id': 7,
      'name': "第七次摸底考试",
      'time': "2021年 7月1日",
      'score': {
        '王五': {
          'china': 95,
          'math': 90,
          'english': 86,
          'physics': 91,
          'chemistry': 93,
          'biology': 89
        },
        '张三': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三1': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四2': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三3': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四4': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三5': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四6': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三7': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四8': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三9': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四10': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三11': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四12': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三13': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四14': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        }
      }
    },
    {
      'id': 8,
      'name': "期末考试",
      'time': "2021年 7月23日",
      'score': {
        '王五': {
          'china': 95,
          'math': 90,
          'english': 86,
          'physics': 91,
          'chemistry': 93,
          'biology': 89
        },
        '张三': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三1': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四2': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三3': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四4': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三5': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四6': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三7': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四8': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三9': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四10': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三11': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四12': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三13': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四14': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        }
      }
    },
    {
      'id': 9,
      'name': "第一百次考试",
      'time': "2023年 9月23日",
      'score': {
        '王五': {
          'china': 95,
          'math': 90,
          'english': 86,
          'physics': 91,
          'chemistry': 93,
          'biology': 89
        },
        '张三': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三1': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四2': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三3': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四4': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三5': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四6': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三7': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四8': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三9': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四10': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三11': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四12': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        },
        '张三13': {
          'china': 65,
          'math': 30,
          'english': 56,
          'physics': 21,
          'chemistry': 93,
          'biology': 99
        },
        '李四14': {
          'china': 85,
          'math': 34,
          'english': 86,
          'physics': 51,
          'chemistry': 93,
          'biology': 99
        }
      }
    }
  ];

  List studentNames = []; // 学生姓名的list数组
  List china = []; // 学生语文成绩的list数组
  List math = []; // 学生数学成绩的list数组
  List english = []; // 学生英语成绩的list数组
  List physics = []; // 学生物理成绩的list数组
  List chemistry = []; // 学生化学成绩的list数组
  List biology = []; // 学生生物成绩的list数组
  List<User> _data = []; // 展示的数据源
  var _sortAscending = true;
  var _sortIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Map scoreList = json.decode(json.encode(_list[widget.examId]["score"]));
    scoreList.forEach((key, value) {
      studentNames.add(key);
      china.add(value['china']);
      math.add(value['math']);
      english.add(value['english']);
      physics.add(value['physics']);
      chemistry.add(value['chemistry']);
      biology.add(value['biology']);
    });
    
    List.generate(studentNames.length, (index) => {
      _data.add(User(studentNames[index], china[index], math[index], english[index], physics[index], chemistry[index], biology[index],
          china[index]+math[index]+english[index]+physics[index]+chemistry[index]+biology[index]
      ))
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(
          _list[widget.examId]["name"],
          style: TextStyle(
            fontSize: 30
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF42A5F5),
                Color(0xFF3D5AFE),
                Color(0xFF0018EB),
              ]
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: PaginatedDataTable(
            header: Text(_list[widget.examId]["time"]),
            actions: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AddDialog()
                  ).then((v) {
                    setState(() {
                      _data.add(User(v[0], v[1], v[2], v[3], v[4], v[5], v[6], v[7]));
                    });
                  });
                }
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("提示"),
                        content: Text("确认删除选中成绩吗？"),
                        actions: [
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("取消")
                          ),
                          FlatButton(
                              onPressed: () {
                                setState(() {
                                  _data.removeWhere((element) {
                                    return element.selected == true;
                                  });
                                });
                                Navigator.of(context).pop();
                              },
                              child: Text("确认")
                          ),
                        ],
                      );
                    }
                  );
                }
              )
            ],
            onSelectAll: (all) {
              setState(() {
                _data.forEach((element) {
                  element.selected = all;
                });
              });
            },
            sortColumnIndex: _sortIndex,
            sortAscending: _sortAscending,
            columns: [
              DataColumn(label: Text("排名")),
              DataColumn(label: Text("姓名")),
              DataColumn(
                label: Text("语文"),
                  onSort: (index, sort) {
                    setState(() {
                      _sortIndex = index;
                      _sortAscending = sort;
                      if (sort) {
                        _data.sort((a, b) => a.china.compareTo(b.china));
                      } else {
                        _data.sort((a, b) => b.china.compareTo(a.china));
                      }
                    });
                  }
              ),
              DataColumn(
                label: Text("数学"),
                  onSort: (index, sort) {
                    setState(() {
                      _sortIndex = index;
                      _sortAscending = sort;
                      if (sort) {
                        _data.sort((a, b) => a.math.compareTo(b.math));
                      } else {
                        _data.sort((a, b) => b.math.compareTo(a.math));
                      }
                    });
                  }
              ),
              DataColumn(
                label: Text("英语"),
                  onSort: (index, sort) {
                    setState(() {
                      _sortIndex = index;
                      _sortAscending = sort;
                      if (sort) {
                        _data.sort((a, b) => a.english.compareTo(b.english));
                      } else {
                        _data.sort((a, b) => b.english.compareTo(a.english));
                      }
                    });
                  }
              ),
              DataColumn(
                label: Text("物理"),
                  onSort: (index, sort) {
                    setState(() {
                      _sortIndex = index;
                      _sortAscending = sort;
                      if (sort) {
                        _data.sort((a, b) => a.physics.compareTo(b.physics));
                      } else {
                        _data.sort((a, b) => b.physics.compareTo(a.physics));
                      }
                    });
                  }
              ),
              DataColumn(
                label: Text("化学"),
                  onSort: (index, sort) {
                    setState(() {
                      _sortIndex = index;
                      _sortAscending = sort;
                      if (sort) {
                        _data.sort((a, b) => a.chemistry.compareTo(b.chemistry));
                      } else {
                        _data.sort((a, b) => b.chemistry.compareTo(a.chemistry));
                      }
                    });
                  }
              ),
              DataColumn(
                label: Text("生物"),
                onSort: (index, sort) {
                  setState(() {
                    _sortIndex = index;
                    _sortAscending = sort;
                    if (sort) {
                      _data.sort((a, b) => a.biology.compareTo(b.biology));
                    } else {
                      _data.sort((a, b) => b.biology.compareTo(a.biology));
                    }
                  });
                }
              ),
              DataColumn(
                label: Text("总成绩"),
                onSort: (index, sort) {
                  setState(() {
                    _sortIndex = index;
                    _sortAscending = sort;
                    if (sort) {
                      _data.sort((a, b) => a.total.compareTo(b.total));
                    } else {
                      _data.sort((a, b) => b.total.compareTo(a.total));
                    }
                  });
                }
              )
            ],
            source: MyDataTableSource(_data)
          ),
      ),
    );
  }
}

// 数据源
class MyDataTableSource extends DataTableSource {
  final List<User> data;

  MyDataTableSource(this.data);

  @override
  DataRow getRow(int index) {
    // TODO: implement getRow
    if (index >= data.length) {
      return null;
    }
    return DataRow.byIndex(
      index: index,
      selected: data[index].selected,
      onSelectChanged: (select) {
        data[index].selected = select;
        notifyListeners();
      },
      cells: [
        DataCell(Text("${index + 1}")),
        DataCell(Text(data[index].studentNames)),
        DataCell(Text("${data[index].china}")),
        DataCell(Text("${data[index].math}")),
        DataCell(Text("${data[index].english}")),
        DataCell(Text("${data[index].physics}")),
        DataCell(Text("${data[index].chemistry}")),
        DataCell(Text("${data[index].biology}")),
        DataCell(Text("${data[index].total}"))
      ]
    );
  }

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0; // 选中的行数

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => data.length; // 行数
}
