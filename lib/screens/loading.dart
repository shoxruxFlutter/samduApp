// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:samduapp/constant.dart';
import 'package:samduapp/models/api_response.dart';
import 'package:samduapp/services/user_service.dart';
import 'package:flutter/material.dart';



class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void _loadUserInfo() async {
    String token = await getToken();
    if(token == ''){
Navigator.of(context).pushReplacementNamed('/login');
    }
    else {
      ApiResponse response = await getUserDetail();
      if (response.error == null){
        Navigator.of(context).pushReplacementNamed('/home_screen');
      }
      else if (response.error == unauthorized){
Navigator.of(context).pushReplacementNamed('/login');
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${response.error}'),
        ));
      }
    }
  }

  @override
  void initState() {
    _loadUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: const Center(
        child:  CircularProgressIndicator()
      ),
    );
  }
}