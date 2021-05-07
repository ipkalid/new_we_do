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
      body: Column(
        children: [
          Material(
            elevation: 4,
            child: Container(
              color: Color(0xffF9F9F9),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Order Number",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black.withOpacity(.60),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text("#${service.serviceID}"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          _TrackTimeline(
            status: "${service.status}",
          ),
        ],
      ),
    );
  }
}

class _TrackTimeline extends StatelessWidget {
  _TrackTimeline({@required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    print(status);
    Color green = Colors.green;
    Color grey = Colors.grey;

    bool toTheStore = false;
    bool atTheStore = false;
    bool toTheCamp = false;
    bool onTheWay = false;
    bool deliverid = false;

    if (status == "new") {
      toTheStore = false;
      atTheStore = false;
      toTheCamp = false;
      onTheWay = false;
      deliverid = false;
    }

    if (status == "To The Store") {
      toTheStore = true;
      atTheStore = false;
      toTheCamp = false;
      onTheWay = false;
      deliverid = false;
    }
    if (status == "At The Store") {
      toTheStore = true;
      atTheStore = true;
      toTheCamp = false;
      onTheWay = false;
      deliverid = false;
    }
    if (status == "To The Camp") {
      toTheStore = true;
      atTheStore = true;
      toTheCamp = true;
      onTheWay = false;
      deliverid = false;
    }
    if (status == "On The Way") {
      toTheStore = true;
      atTheStore = true;
      toTheCamp = true;
      onTheWay = true;
      deliverid = false;
    }
    if (status == "Delivered") {
      toTheStore = true;
      atTheStore = true;
      toTheCamp = true;
      onTheWay = true;
      deliverid = true;
    }

    return Expanded(
      child: ListView(
        children: [
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.1,
            isFirst: true,
            indicatorStyle: IndicatorStyle(
              width: 20,
              color: (toTheStore) ? green : grey,
              padding: EdgeInsets.all(6),
            ),
            endChild: const _RightChild(
              title: 'To The Store',
              message: 'The captain is heading to the store.',
            ),
            afterLineStyle: LineStyle(
              color: (toTheStore) ? green : grey,
            ),
          ),
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.1,
            indicatorStyle: IndicatorStyle(
              width: 20,
              color: (atTheStore) ? green : grey,
              padding: EdgeInsets.all(6),
            ),
            endChild: _RightChild(
              title: 'At The Store',
              message: 'The captain has arrived to the store and is ordering.',
            ),
            beforeLineStyle: LineStyle(
              color: (atTheStore) ? green : grey,
            ),
            afterLineStyle: LineStyle(
              color: (atTheStore) ? green : grey,
            ),
          ),
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.1,
            indicatorStyle: IndicatorStyle(
              width: 20,
              color: (toTheCamp) ? green : grey,
              padding: EdgeInsets.all(6),
            ),
            endChild: _RightChild(
              title: 'To The Camp',
              message: 'The captain is on his way to the camp.',
            ),
            beforeLineStyle: LineStyle(
              color: (toTheCamp) ? green : grey,
            ),
            afterLineStyle: LineStyle(
              color: (toTheCamp) ? green : grey,
            ),
          ),
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.1,
            indicatorStyle: IndicatorStyle(
              width: 20,
              color: (onTheWay) ? green : grey,
              padding: EdgeInsets.all(6),
            ),
            endChild: _RightChild(
              title: 'On the way',
              message: 'The captain is coming to you.',
            ),
            beforeLineStyle: LineStyle(
              color: (onTheWay) ? green : grey,
            ),
            afterLineStyle: LineStyle(
              color: (onTheWay) ? green : grey,
            ),
          ),
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.1,
            indicatorStyle: IndicatorStyle(
              width: 20,
              color: (deliverid) ? green : grey,
              padding: EdgeInsets.all(6),
            ),
            endChild: _RightChild(
              title: 'Delivered',
              message: 'The captain is at your door.',
            ),
            beforeLineStyle: LineStyle(
              color: (deliverid) ? green : grey,
            ),
            isLast: true,
          ),
        ],
      ),
    );
  }
}

class _RightChild extends StatelessWidget {
  const _RightChild({
    this.title,
    this.message,
    this.disabled = false,
  });

  final String title;
  final String message;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  color: disabled
                      ? const Color(0xFFBABABA)
                      : const Color(0xFF636564),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                message,
                style: TextStyle(
                  color: disabled
                      ? const Color(0xFFD5D5D5)
                      : const Color(0xFF636564),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
