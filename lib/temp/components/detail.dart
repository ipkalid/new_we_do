import 'package:flutter/material.dart';
import '../../style/style.dart';
import '../../style/constant.dart';

class Detail extends StatelessWidget {

  final String detail;

  Detail({@required this.detail});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: detailsBackground,
      child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Text("Details",
                style: headerStyle(context),
              ),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            children: [
              Expanded(
                child: Text(detail,
                  //maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                  style: detailsStyle(context),
                ),
              ),
            ],
          ),
        ],
      ),
        ),
    );
  }
}
