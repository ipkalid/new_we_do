import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_do/model/service_model.dart';
import 'package:we_do/style/constant.dart';
import 'package:we_do/style/style.dart';
import 'package:we_do/temp/components/main_button.dart';
import 'package:we_do/temp/components/text_field_with_label.dart';

class CReportDetails extends StatefulWidget {
  Service theService;

  CReportDetails({this.theService});

  @override
  _CReportDetailsState createState() => _CReportDetailsState();
}

class _CReportDetailsState extends State<CReportDetails> {
  Service theService;

  String reportTitle = '', details = '', submissionResponse = '';

  Color reportTitleBorder = fieldBorderColor;
  Color detailsBorder = fieldBorderColor;

  _CReportDetailsState({this.theService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.chevron_down,
            size: 32,
          ),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: Text(
          "Report",
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 16),
        children: [
          Text(submissionResponse, style: warningTextStyle(context)),
          SizedBox(
            height: 10,
          ),
          TextFieldWithLabel(
            borderColor: reportTitleBorder,
            label: "Report Title",
            onChanged: (value) {
              reportTitle = value;
            },
          ),
          SizedBox(height: 16),
          TextFieldWithLabel(
            borderColor: detailsBorder,
            label: "Details",
            onChanged: (value) {
              details = value;
            },
            inputType: TextInputType.multiline,
          ),
          SizedBox(height: 30),
          MainButton(
            text: 'Submit',
            onPressed: () => {
              // TODO: send request to the database
              setState(() {
                reportTitle == ''
                    ? reportTitleBorder = Colors.red
                    : reportTitleBorder = fieldBorderColor;

                details == ''
                    ? detailsBorder = Colors.red
                    : detailsBorder = fieldBorderColor;

                if (reportTitle == "" || details == "") {
                  submissionResponse =
                      "Please fill the fields with correct data";
                } else {
                  // print submitted
                  Navigator.maybePop(context);
                }
              })
            },
          ),
        ],
      ),
    );
  }
}
