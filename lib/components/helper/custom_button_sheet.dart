import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  CustomBottomSheet({@required this.child, this.height = 0.5});
  final Widget child;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * height,
      color: Colors.transparent,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 12),
            height: 6,
            width: 36,
            decoration: BoxDecoration(
              color: Colors.grey[600],
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
