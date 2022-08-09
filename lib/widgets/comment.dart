import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mekelletimes/model/comment.dart';
import 'package:mekelletimes/provider/comments_provider.dart';
import 'package:provider/provider.dart';

class CommentSection extends StatefulWidget {
  final String newsId;
  final dynamic comment;
  CommentSection({this.newsId, this.comment});

  @override
  _CommentSectionState createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  bool like = false;
  bool isValid = false;
  bool isEditing = false;

  final _formKey = GlobalKey<FormState>();
  // final _scaffoldKey = GlobalKey<ScaffoldState>();

  var updatedComment = Comment(
    commentId: null,
    comment: '',
    userId: null,
    newsId: null,
  );

  // @override
  // void didChangeDependencies() {
  //   Provider.of<CommentProvider>(context).fetchComments(widget.newsId);
  //   super.didChangeDependencies();
  // }

  Future<void> updateComment() async {
    _formKey.currentState.validate();
    _formKey.currentState.save();
    await Provider.of<CommentProvider>(context, listen: false)
        .updateComment(updatedComment);
  }

  Future<void> deleteComment() async {
    await Provider.of<CommentProvider>(context, listen: false)
        .deleteComment(widget.comment['_id']);
  }

  @override
  Widget build(BuildContext context) {
    final loadedComment = widget.comment;

    var commentUserId = loadedComment['user']['_id'];
    var loggedInUserId =
        Provider.of<CommentProvider>(context, listen: true).userId;

    // print('commentUserId: $commentUserId');
    // print('loggedInUser: $loggedInUserId');

    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Container(
                // height:50,
                // width: 70,

                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50)),
                padding: EdgeInsets.only(left: 15),
                child: Image.asset(
                  'assets/images/image1.jpg',
                  height: 50,
                )),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 15, bottom: 20),
              child: Text(
                loadedComment['user']['name'],
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 15, bottom: 20),
              child: Text("/"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, top: 15, bottom: 20),
              child: Text(DateFormat.yMMMMd().format(DateTime.now())),
            )
          ]),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, top: 15, bottom: 20, right: 20),
            child: isEditing
                ? Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          onSaved: (newValue) {
                            updatedComment = Comment(
                                commentId: loadedComment['_id'],
                                comment: newValue,
                                userId: loadedComment['user']['_id'],
                                newsId: widget.newsId);
                          },
                          initialValue: loadedComment['comment'],
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                        IconButton(
                          onPressed: () {
                            updateComment();
                            setState(() {
                              isEditing = false;
                            });
                            Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text('Successfully updated')));
                          },
                          icon: FaIcon(FontAwesomeIcons.edit,
                              color: Colors.green),
                        ),
                      ],
                    ),
                  )
                : Text(loadedComment['comment']),
          ),
          commentUserId == loggedInUserId
              ? isEditing
                  ? Text('`')
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isEditing = !isEditing;
                            });
                            // updateComment();
                          },
                          icon: FaIcon(FontAwesomeIcons.edit,
                              color: Colors.green),
                        ),
                        IconButton(
                          onPressed: () {
                            deleteComment();
                            Scaffold.of(context).showSnackBar(
                                SnackBar(content: Text('Deleted!')));
                          },
                          icon:
                              FaIcon(FontAwesomeIcons.trash, color: Colors.red),
                        )
                      ],
                    )
              : Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, right: 15.0, bottom: 10),
                  child: IconButton(
                    icon: like
                        ? FaIcon(FontAwesomeIcons.thumbsDown)
                        : FaIcon(FontAwesomeIcons.thumbsUp),
                    color: Colors.red,
                    onPressed: () {
                      setState(() {
                        like = !like;
                      });
                    },
                    alignment: Alignment.bottomRight,
                  ),
                ),
        ]);
  }
}
