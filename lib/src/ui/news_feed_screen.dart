import 'package:flutter/material.dart';
import 'package:linked_redesign/src/styles/app_colors.dart';

class NewsFeedScreen extends StatefulWidget {
  @override
  _NewsFeedScreenState createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  List<NewsFeedModel> newsFeedList;

  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() {
    newsFeedList = List();
    List.generate(30, (index) {
      newsFeedList.add(NewsFeedModel(
          "Ashish Rawat",
          "https://media-exp1.licdn.com/dms/image/C5103AQHpyZyF9uuJ5g/profile-displayphoto-shrink_200_200/0?e=1585180800&v=beta&t=4UizUlQ-MLSOQxzQdFgQVEt3XkNndVIvtb9-pcIjWmE",
          "Android App Developer",
          "This is a demo description but we will add some",
          "https://media-exp1.licdn.com/dms/image/C4E22AQE30g9RAzQ26g/feedshare-shrink_1280/0?e=1582761600&v=beta&t=fWo45sWullorTIpw8eiD8XjQfD6NkDeYgt4-mBGMpz0",
          "344",
          "25"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.linkedinLightGray,
      appBar: AppBar(
        title: Text("News"),
        elevation: 0,
        centerTitle: false,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.add_comment),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: ListView.builder(
            itemCount: newsFeedList.length,
            itemBuilder: (context, index) {
              return NewFeedCard(newsFeedList[index]);
            }),
      ),
    );
  }
}

class NewsFeedModel {
  String name;
  String avatarUrl;
  String designation;
  String description;
  String imageUrl;
  String likes;
  String comments;

  NewsFeedModel(this.name, this.avatarUrl, this.designation, this.description,
      this.imageUrl, this.likes, this.comments);
}

class NewFeedCard extends StatelessWidget {
  NewsFeedModel newsFeedModel;

  NewFeedCard(this.newsFeedModel);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            enabled: true,
            title: Text(
              newsFeedModel.name,
              style: TextStyle(
                  color: AppColors.linkedinBlack, fontWeight: FontWeight.w500),
            ),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(newsFeedModel.avatarUrl),
            ),
            subtitle: Text(
              newsFeedModel.designation,
              style: TextStyle(color: AppColors.linkedinBlue),
            ),
            trailing: Icon(
              Icons.more_vert,
              color: AppColors.linkedinBlue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              newsFeedModel.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Image.network(newsFeedModel.imageUrl),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "${newsFeedModel.likes} likes",
                        style: TextStyle(color: AppColors.linkedinDarkGray),
                      ),
                      Text(
                        "${newsFeedModel.comments} comments",
                        style: TextStyle(color: AppColors.linkedinDarkGray),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: SizedBox(
                      width: 10,
                    )),
                Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(Icons.share),
                          Icon(Icons.comment),
                          Icon(Icons.favorite_border),
                        ],
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
