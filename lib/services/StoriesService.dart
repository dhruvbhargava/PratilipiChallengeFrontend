import 'dart:convert';

import 'package:http/http.dart';
import 'package:pratilipi_blog/Models/Story.dart';
import '../constants.dart';

Future<List<Story>> getPreviews() async {
  List<Story> previews = List();
  String target = PREVIEW_URL;
  Response response = await get(target);
  List resp = jsonDecode(response.body)["previews"];
  print(resp);
  for (var i in resp) {
    previews.add(Story(id: i["_id"], title: i["title"]));
  }
  print("doneHere");
  return previews;
}

Future<Story> getFullStory(story) async {
  if (story.content == EMPTY) {
    String target =
        FULL_STORY_URL + "?userId=${userGlobal.Name}&storyId=${story.id}";
    Response response = await get(target);
    final resp = jsonDecode(response.body);
    story.content = resp["content"];
    story.viewsTotal = resp["viewsTotal"];
    return story;
  } else
    return story;
}
