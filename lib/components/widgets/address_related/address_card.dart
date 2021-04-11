import 'package:flutter/material.dart';
import 'package:we_do/components/widgets/address_related/address_screen.dart';
import 'package:we_do/model/address_model.dart';

// ignore: must_be_immutable
class AddressCard extends StatefulWidget {
  AddressCard({
    @required this.address,
    this.onTap,
    this.toScreen = true,
  });
  final Address address;
  //final void Function(Address) onTap;
  final ValueChanged<Address> onTap;
  final bool toScreen;

  @override
  _AddressCardState createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (widget.toScreen)
          ? () => _goToAddressScreen(context)
          : () => widget.onTap(widget.address),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 22),
        height: 77,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.address.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Bulding: ${widget.address.buildingNo} Room: ${widget.address.room}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                  )
                ],
              ),
              if (widget.toScreen) Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
      ),
    );
  }

  void _goToAddressScreen(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddressScreen(
          address: widget.address,
        ),
      ),
    );
    setState(() {});
  }
}
