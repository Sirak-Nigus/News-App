import 'package:flutter/material.dart';
import 'package:mekelletimes/model/comment.dart';
import 'package:mekelletimes/provider/comments_provider.dart';
import 'package:provider/provider.dart';

class CommentForm extends StatefulWidget {
  final String newsId;

  CommentForm({Key key, this.newsId}) : super(key: key);

  @override
  _CommentFormState createState() => _CommentFormState();
}

class _CommentFormState extends State<CommentForm> {
  String commentContent;
  bool isAuth = false;

  final _formKey = GlobalKey<FormState>();

  var _comment = Comment(
    commentId: null,
    newsId: '',
    comment: '',
  );

  Future<void> saveForm() async {
    bool isValid = _formKey.currentState.validate();
    if (!isValid) {
      return print('invalidForm');
    }
    _formKey.currentState.save();

    await Provider.of<CommentProvider>(context, listen: false)
        .postComment(_comment);
    _formKey.currentState.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0, right: 14.0, top: 10),
      child: Form(
          key: _formKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Write Comment'),
            SizedBox(height: 10),
            TextFormField(
              onSaved: (value) {
                _comment = Comment(
                    commentId: _comment.commentId,
                    comment: value,
                    newsId: widget.newsId,
                    createdAt: null,
                    userId: _comment.userId);
              },

              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Write Comment',
                  hintStyle: TextStyle(color: Colors.black),
                  labelText: 'Write Comment'),

              maxLines: 4,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a comment';
                }
                return null;
              },
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.next,
              // onSaved: (value) {
              //   editedProduct = Product(
              //       id: editedProduct.id,
              //       title: editedProduct.title,
              //       description: value,
              //       price: editedProduct.price,
              //       imageUrl: editedProduct.imageUrl,
              //       isFavorite: editedProduct.isFavorite
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)),
                    onPressed: () {
                      saveForm();
                    },
                    child: Text('Submit')),
              ],
            ),
          ])),
    );
  }
}
