import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mom_app/core/utils/media_query_values.dart';

class OpenFullImage extends StatelessWidget {
  final String? url;

  const OpenFullImage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.network(
          url!,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
