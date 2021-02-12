import 'package:flutter/material.dart';
import 'package:nytapp/models/Results.dart';

// List item view with an onTap call back -- used ListTile widget
class ArticleListItem extends StatefulWidget {
  final Results result;
  final Function onTapped;

  ArticleListItem(this.result, this.onTapped);

  @override
  _ArticleListItemState createState() => _ArticleListItemState();
}

class _ArticleListItemState extends State<ArticleListItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: InkWell(
        onTap: () => {widget.onTapped()},
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('${widget.result.title}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${widget.result.byline}'),
                  Row(
                    children: [
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Icon(
                          Icons.calendar_today,
                          size: 15,
                        ),
                      ),
                      Text('${widget.result.publishedDate}'),
                    ],
                  ),
                ],
              ),
              leading: widget.result.media.isNotEmpty &&
                      widget.result?.media[0].mediaMetadata.isNotEmpty
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(
                          widget.result?.media[0]?.mediaMetadata[0]?.url),
                    )
                  : CircleAvatar(
                      backgroundColor: Colors.blue,
                    ),
              trailing: Icon(Icons.arrow_forward_ios,key: Key('forwardArrow'),),
            ),
          ],
        ),
      ),
    );
  }
}
