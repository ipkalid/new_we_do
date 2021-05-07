import 'package:flutter/material.dart';
import 'package:we_do/components/widgets/service_related/request_related/request_screen.dart';
import 'package:we_do/components/widgets/service_related/service_screen.dart';
import 'package:we_do/model/request_model.dart';
import 'package:we_do/model/service_model.dart';

class RequestCard extends StatelessWidget {
  RequestCard({this.request, this.service});
  final Request request;
  final Service service;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => (service == null)
          ? _goRequestScreen(context)
          : _goServiceScreen(context),
      child: Container(
        height: 85,
        decoration: BoxDecoration(
          color: Color(0xffFAFAFA),
          borderRadius: BorderRadius.all(Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, .2),
              blurRadius: 8,
              offset: Offset(3, 3),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              Container(
                child: Icon(
                  Icons.food_bank,
                  size: 48,
                ),
              ),
              SizedBox(width: 4),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      (service == null)
                          ? (request.deliverFrom == null)
                              ? "Null"
                              : request.deliverFrom
                          : service.request.deliverFrom,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      (service == null)
                          ? (request.deliveryTime == null)
                              ? "Null"
                              : request.deliveryTime
                          : service.request.deliveryTime,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
      ),
    );
  }

  void _goServiceScreen(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ServiceScreen(
          service: service,
        ),
      ),
    );
  }

  void _goRequestScreen(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RequestScreen(
          request: request,
        ),
      ),
    );
  }
}
