import 'package:flutter/material.dart';
import 'package:we_do/model/service_model.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ServiceTrackScreen extends StatelessWidget {
  ServiceTrackScreen({this.service});
  final Service service;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Track"),
      ),
      body: Container(
        child: TimelineTile(
          axis: TimelineAxis.horizontal,
          alignment: TimelineAlign.center,
          endChild: Container(
            constraints: const BoxConstraints(
              minWidth: 120,
            ),
            color: Colors.lightGreenAccent,
          ),
          startChild: Container(
            color: Colors.amberAccent,
          ),
        ),
      ),
    );
  }
}
