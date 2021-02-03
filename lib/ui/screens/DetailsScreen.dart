import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nytapp/models/Results.dart';
import 'package:nytapp/utils/Strings.dart';
import 'package:nytapp/utils/Utils.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatelessWidget {
  final Results result;

  DetailsScreen(this.result);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView  (
          scrollDirection: Axis.vertical,
          child: Container(
            child:
              _detailsOutlineWidget(),

          ),
        ),
      ),
    );
  }



// simple column widget to display data
  Widget _detailsOutlineWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ListTile(
          title: Text(Strings.articleTitle),
          subtitle: Text(result.title),
        ),
        ListTile(
          title: Text(Strings.articleAbstract),
          subtitle: Text(result.abstract),
        ),
        ListTile(
          title: Text(Strings.publishedDate),
          subtitle: Text("${Utils().getFormattedDate(result.publishedDate)}"),
        ),
        InkWell(
          onTap: () {
            _launchURL(result.url);
          },
          child: ListTile(
            title: Text(
                Strings.articleLink,
              style: TextStyle(color: Colors.blue),
            ),
            trailing: IconButton(
              icon: Icon(Icons.link),
            ),

          ),
        ),
        Center(child: Image.network(result.media[0].mediaMetadata[result.media[0].mediaMetadata.length - 1]?.url)),
      ],
    );
  }

  _launchURL(String url) async { // web launcher
    // this function uses url_launcher to start url link
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
