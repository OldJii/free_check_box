import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:customcheckbox/costom_check_box.dart';

class Item extends StatefulWidget {
  String name;
  String address;

  bool isCheck = false;

  Item({Key? key, required this.name, required this.address}) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 3, top: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color(0xCC000000),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: SizedBox(
                          width: 70,
                          child: Text(
                            widget.address,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0x66000000),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                CostomCheckBox(
                  size: 25,
                  isChecked: widget.isCheck,
                  checkedColor: const Color(0xFF3940FF),
                  animationDuration: const Duration(milliseconds: 200),
                  widgetPadding: 0,
                  borderColor: widget.isCheck
                      ? const Color(0xFF3940FF)
                      : const Color(0x4D979797),
                  onTap: (_) {
                    onClick();
                  },
                )
              ],
            ),
          ),
          const Divider(
            height: 1,
            color: Color(0x80979797),
          ),
        ],
      ),
    );
  }

  onClick() {
    setState(() {
      widget.isCheck = !widget.isCheck;
    });
  }
}
