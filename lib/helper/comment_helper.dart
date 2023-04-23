import 'package:http/http.dart' as http;

import '../model/comments.dart';
class CommentHelper{
  Future<List<Comment>?> getComments() async{
    var response= await http.get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
    if(response.statusCode==200){
      var data= response.body;
      return commentFromJson(data);
    }
  }
}
