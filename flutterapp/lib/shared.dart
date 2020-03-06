import 'package:shared_preferences/shared_preferences.dart';
import './diarymodel.dart';

class shareData {
  static List<diaryitem> diaryList = new List();

  static Future init() async {
    SharedPreferences prefs =  await SharedPreferences.getInstance();
    List contentList = prefs.getStringList('diarycontent');
    List timeList = prefs.getStringList('timeList');
    List <diaryitem>list = List();
    if (contentList == null) {
      diaryitem default1 = diaryitem('Flutter是谷歌的移动UI框架，可以快速在iOS和Android上构建高质量的原生用户界面。 Flutter可以与现有的代码一起工作。在全世界，Flutter正在被越来越多的开发者和组织使用，并且Flutter是完全免费、开源的。', '1583388798000');
      diaryitem default2 = diaryitem('使用Flutter内置美丽的Material Design和Cupertino（iOS风格）widget、丰富的motion API、平滑而自然的滑动效果和平台感知，为您的用户带来全新体验。', '1580796798000');
      list.add(default2);
      list.add(default1);
      
      saveDiaryData(default1);
      saveDiaryData(default2);
    } else {
      if (contentList.length > 0) {
        for (var i = 0; i < contentList.length; i++) {
          diaryitem item = diaryitem(contentList[i], timeList[i]);
          list.add(item);
        }
      }
    }
    diaryList = list;
  }

  static saveDiaryData(diaryitem item) async {
    SharedPreferences prefs =  await SharedPreferences.getInstance();
    List<String> contentList = prefs.getStringList('diarycontent');
    if (contentList == null) {
      contentList = new List();
    }
    contentList.insert(0, item.content);
    List<String> timeList = prefs.getStringList('timeList');
    if (timeList == null) {
      timeList = new List();
    }
    timeList.insert(0, item.time);
    prefs.setStringList('diarycontent', contentList);
    prefs.setStringList('timeList', timeList);
  }

  static addDiaryData(diaryitem item) async {
    saveDiaryData(item);
    diaryList.insert(0, item);
  }

  static replaceDiaryData(diaryitem item, int index) async {
    SharedPreferences prefs =  await SharedPreferences.getInstance();
    List<String> contentList = prefs.getStringList('diarycontent');
    if (contentList == null) {
      contentList = new List();
    }
    contentList.replaceRange(index, index + 1, [item.content]);
    List<String> timeList = prefs.getStringList('timeList');
    if (timeList == null) {
      timeList = new List();
    }
    timeList.replaceRange(index, index + 1, [item.time]);
    prefs.setStringList('diarycontent', contentList);
    prefs.setStringList('timeList', timeList);

  }


}

