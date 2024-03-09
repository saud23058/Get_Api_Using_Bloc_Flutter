import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:api_using_bloc/models/post_models.dart';
import 'package:http/http.dart' as http;
class  PostRepo{
  Future<List<PostModels>>fetchPost () async {
    try{
      final response =await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
      if(response.statusCode==200){
        final body=json.decode(response.body)as List;
        return body.map((e){
          return PostModels(
            postId: e['postId'],
            email: e['email'] as String,
            body: e['body'] as String,
          );
        }).toList();
      }
    }on SocketException{
      throw Exception('error while fetching data');
    }on TimeoutException{
      throw Exception('error while fetching data');
    }
    throw Exception('error while fetching data');
  }
}