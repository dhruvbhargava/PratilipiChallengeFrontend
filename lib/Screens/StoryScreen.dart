import 'package:flutter/material.dart';
import 'package:pratilipi_blog/Models/Story.dart';
import '../services/StoriesService.dart';

class StoryPage extends StatefulWidget {
  Story story;
  StoryPage({@required this.story});
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PratipiBlog"),
        centerTitle: true,
      ),
      body: StoryCard(story: widget.story),
    );
  }
}

class StoryCard extends StatefulWidget {
  Story story;
  StoryCard({@required this.story});
  @override
  _StoryCardState createState() => _StoryCardState();
}

class _StoryCardState extends State<StoryCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.story.title,
            style: TextStyle(
                fontSize: 80, fontWeight: FontWeight.w800, color: Colors.black),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.bookmark),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Views: ",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.story.viewsTotal.toString() + ","),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.face),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "liveViews: ",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.story.liveViews.toString()),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(widget.story.content,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54)),
        )
      ],
    );
  }
}
