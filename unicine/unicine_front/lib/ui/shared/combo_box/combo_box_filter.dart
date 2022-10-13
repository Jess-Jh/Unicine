import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class ComboBoxFilter extends StatefulWidget {
  final List<String> listItems;
  String itemSelected;
  final Color? colorBox;
  final Color? colorBorder;
  final double? buttonHeight;
  ComboBoxFilter({
    super.key,
    required this.listItems,
    required this.itemSelected,
    this.colorBox,
    this.colorBorder,
    this.buttonHeight,
  });

  @override
  State<ComboBoxFilter> createState() => _ComboBoxFilterState();
}

class _ComboBoxFilterState extends State<ComboBoxFilter> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          value: widget.itemSelected,
          items: widget.listItems
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ))
              .toList(),
          onChanged: (String? value) {
            setState(() {
              widget.itemSelected = value!;
            });
          },
          icon: const Icon(
            Icons.arrow_drop_down_sharp,
          ),
          buttonHeight: widget.buttonHeight ?? 30,
          buttonWidth: 150,
          buttonPadding: const EdgeInsets.symmetric(horizontal: 6),
          buttonDecoration: BoxDecoration(
            color: widget.colorBox,
            borderRadius: BorderRadius.circular(10),
            border: widget.colorBorder != null
                ? Border.all(color: widget.colorBorder!, width: 2)
                : Border.all(color: Colors.transparent),
          ),
          dropdownMaxHeight: 200,
          scrollbarRadius: const Radius.circular(10),
        ),
      ),
    );
  }
}
