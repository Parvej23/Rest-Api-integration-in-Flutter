import 'package:flutter/material.dart';
import 'package:rest_api/helper/comment_helper.dart';
import 'package:rest_api/model/comments.dart';
class HomePage extends StatefulWidget {
  static const String routeName='/';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Comment>? comments;
  bool isLoaded= false;
  getData() async{
    comments= await CommentHelper().getComments();
    setState(() {
      isLoaded=true;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Api"),),
      body: Visibility(
        visible: isLoaded,
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: comments?.length??0,
          itemBuilder: (_,index){
            return Card(
              child: ListTile(
                title: Text(comments![index].email),
                subtitle: Text(comments![index].body),
              ),
            );
          },
        ),
      ),
    );
  }
}
