import 'package:flutter/material.dart';


class InfoCard extends StatelessWidget {
  final String title;
  final String result;

  InfoCard(this.title,this.result);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
          style: TextStyle(
            color: Colors.white38,
            fontSize: 10.0,

          ),),
          Text(result,
            style: TextStyle(
              color: Colors.white,
              fontSize: 19.0,
            ),),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
