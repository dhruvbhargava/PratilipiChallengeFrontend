import 'package:flutter/material.dart';
import 'package:pratilipi_blog/Models/Story.dart';
import 'package:pratilipi_blog/Screens/StoryScreen.dart';
import '../services/StoriesService.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("PratipiBlog"),
          centerTitle: true,
          actions: [IconButton(icon: Icon(Icons.logout), onPressed: () {})],
        ),
        body: Stories());
  }
}

class Stories extends StatefulWidget {
  @override
  _StoriesState createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  @override
  bool loading = true;
  List<Story> previews;
  Widget build(BuildContext context) {
    if (loading) {
      getPreviews().then((value) => {
            setState(() {
              loading = false;
              previews = value;
            })
          });
    }

    return loading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: previews.length,
            itemBuilder: (contex, index) => ListTile(
                  title: Text(previews[index].title),
                  leading: Icon(Icons.book),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () async {
                    previews[index] = await getFullStory(previews[index]);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                StoryPage(story: previews[index])));
                  },
                ));
  }
}
