import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class InfoNews extends StatefulWidget {
  int? num1;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;
  InfoNews(this.num1, this.author, this.title, this.description, this.url,
      this.urlToImage, this.publishedAt, this.content);
  @override
  _InfoNewsState createState() => _InfoNewsState(
        num1,
        author,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content,
      );
}

class _InfoNewsState extends State<InfoNews> {
  int? son;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  _InfoNewsState(
    this.son,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          author.toString(),
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.bookmark),
          ),
        ],
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemBuilder: _itemBuilder,
        itemCount: 1,
      ),
    );
  }

  Widget _itemBuilder(context, index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toString(),
            style: TextStyle(
              fontSize: 35,
              fontFamily: "FontMain",
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.cyan,
              image: DecorationImage(
                image: NetworkImage(urlToImage.toString()),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 15.0),
          Text(
            description.toString(),
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400,
                fontFamily: "FontMain"),
          ),
          SizedBox(height: 12),
          Text(
            content.toString() +
                "The devastating heat wave that ravaged British Columbia last week is being blamed for a massive die-off of mussels, clams and other marine animals that live on the beaches of Western Canada.Christopher Harley, a professor in the zoology department at The University of British Columbia, found countless dead mussels popped open and rotting in their shells on Sunday at Kitsalano Beach, which is a few blocks away from his Vancouver home.Harley studies the effects of climate change on the ecology of rocky shores where clams, mussels and sea stars live, so he wanted to see how the intertidal invertebrates were faring in the record heat wave that hit the area on June 26-28.Lytton, British Columbia, broke Canada's all-time record on June 30 when the temperature topped 121 degrees. The town was all but destroyed in a deadly wildfire.There were 719 deaths reported to the province's coroners between June 25 and July 1 -- three times as many as would normally occur during that time period, according to a statement from Lisa Lapointe, British Columbia's chief coroner. Hundreds of people died in the US and many had to be hospitalized because of the heat.",
            style: TextStyle(
              fontSize: 18,
              fontFamily: "FontMain",
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            "Published at : \t " + publishedAt.toString(),
            style: TextStyle(
              fontSize: 20,
              fontFamily: "FontMain",
              fontWeight: FontWeight.bold,
              color: Colors.black45
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Link to : ",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "FontMain",
                    fontWeight: FontWeight.bold,
                    color: Colors.black45
                  ),
                ),
                TextSpan(
                  text: url.toString(),
                  style: TextStyle(
                    fontSize: 18,
                    
                    color: Colors.cyan,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
