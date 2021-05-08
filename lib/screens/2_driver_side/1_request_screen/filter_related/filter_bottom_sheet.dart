import 'package:flutter/material.dart';
import 'package:we_do/temp/constant.dart';
import '../../../../style/app_theme.dart';

class FilterBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
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
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 16),
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                label("Category"),
                Container(
                  height: 67,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      categoryItem(
                          label: "Fast Food",
                          icon: Icons.fastfood,
                          active: false),
                      categoryItem(
                          label: "Fast Food",
                          icon: Icons.fastfood,
                          active: true),
                      categoryItem(
                          label: "Fast Food",
                          icon: Icons.fastfood,
                          active: false),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                label("Arrival Time"),
                Container(
                  height: 67,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      arrivalTimeItem(label: "10:00pm - 10:30pm"),
                      arrivalTimeItem(label: "10:30pm - 11:00pm"),
                      arrivalTimeItem(label: "11:00pm - 11:30pm"),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                label("Location"),
                Container(
                  height: 67,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      locationItem(label: "KFUPM MALL"),
                      locationItem(label: "Aldoha"),
                      locationItem(label: "Dharan Mall"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
                  child: Container(
                    height: 54,
                    decoration: BoxDecoration(
                      color: Color(0xFF7DAD40),
                      boxShadow: [kBoxShadow],
                      borderRadius: BorderRadius.all(
                        Radius.circular(14),
                      ),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Apply Filters",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding label(String label) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 6),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Padding categoryItem({String label, IconData icon, bool active = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 4),
      child: Container(
        width: 124,
        decoration: BoxDecoration(
          color: active ? mainOrange : Colors.white,
          boxShadow: [kBoxShadow],
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(icon), SizedBox(width: 6), Text(label)],
        ),
      ),
    );
  }

  Padding arrivalTimeItem({String label, bool active = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 4),
      child: Container(
        width: 124,
        decoration: BoxDecoration(
          color: active ? mainOrange : Colors.white,
          boxShadow: [kBoxShadow],
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Center(
            child: Text(
          label,
          style: TextStyle(fontSize: 13),
        )),
      ),
    );
  }

  Padding locationItem({String label, bool active = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 4),
      child: Container(
        width: 124,
        decoration: BoxDecoration(
          color: active ? mainOrange : Colors.white,
          boxShadow: [kBoxShadow],
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(fontSize: 13),
          ),
        ),
      ),
    );
  }
}
