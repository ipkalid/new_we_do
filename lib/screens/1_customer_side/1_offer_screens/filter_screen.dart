import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

import '../../../components/buttons/action_button.dart';
import '../../../style/app_color.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen();
  //final List<Category> categories;

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  // List<Category> _category;

  var filterData;

  @override
  void initState() {
    //_category = widget.categories;
    filterData = {
      'categoty': 'near',
      "location": "",
    };

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: Text(
          "Filter",
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Catagory",
                style: TextStyle(fontSize: 22),
              ),
            ),
            Center(
              child: GroupButton(
                selectedColor: AppColor.kOrange,
                isRadio: true,
                spacing: 10,
                onSelected: (index, isSelected) =>
                    filterData['categoty'] = _categoryTypeSelection(index),
                buttons: [
                  "None",
                  "Fasr Food",
                  "Coffee",
                  "Super Market",
                  "Pharmacy"
                ],
              ),
            ),
            // Divider(),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(
            //     "Time",
            //     style: TextStyle(fontSize: 22),
            //   ),
            // ),
            // Center(
            //   child: GroupButton(
            //     selectedColor: ColorTheme.kOrange,
            //     isRadio: true,
            //     spacing: 10,
            //     onSelected: (index, isSelected) =>
            //         filterData['sortBy'] = _sortBySelection(index),
            //     buttons: [
            //       "None",
            //       "10:00pm - 10:30pm",
            //       "10:30pm - 11:00pm",
            //       "11:00pm - 11:30pm",
            //       "11:30pm - 12:00pm"
            //     ],
            //   ),
            // ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Location",
                style: TextStyle(fontSize: 22),
              ),
            ),
            Center(
              child: GroupButton(
                selectedColor: AppColor.kOrange,
                isRadio: true,
                spacing: 10,
                onSelected: (index, isSelected) {
                  filterData['location'] = _locationTypeSelection(index);
                },
                buttons: ["None", "KFUPM MALL", "Alkhober"],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 32),
        child: ActionButton(
            label: "Apply",
            onPressed: () => Navigator.pop(context, filterData)),
      ),
    );
  }

  String _categoryTypeSelection(int index) {
    if (index == 1) {
      return "fast food";
    } else if (index == 2) {
      return "coffee";
    } else if (index == 3) {
      return "super market";
    } else if (index == 4) {
      return "pharmacy";
    }
    return "";
  }

  String _locationTypeSelection(int index) {
    if (index == 1) {
      return "kfupm mall";
    } else if (index == 2) {
      return "alkhober";
    }
    return "";

    // String _timeBySelection(int index) {
    //   print(index);
    //   if (index == 1) {
    //     return "new";
    //   } else if (index == 2) {
    //     return "az";
    //   } else if (index == 3) {
    //     return "za";
    //   }
    //   return "near";
    // }
  }
}
