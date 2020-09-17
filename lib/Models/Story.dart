import 'package:flutter/foundation.dart';
import 'package:pratilipi_blog/constants.dart';

class Story {
  String title;
  String id;
  String content;
  int viewsTotal;
  int liveViews;
  Story({@required this.title, @required this.id}) {
    this.content = EMPTY;
    this.viewsTotal = 0;
    this.liveViews = 0;
  }
}
