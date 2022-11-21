import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class ComboBoxFilter extends StatelessWidget {
  final List<String> listItems;
  final String? itemSelected;
  final Color? colorBox;
  final Color? colorBorder;
  final double? buttonHeight;
  final double? buttonWidth;
  final String? hint;
  final double? borderRadius;
  final Color? colorText;
  final bool? haveIcon;
  final void Function(String? item)? onChange;

  const ComboBoxFilter({
    super.key,
    required this.listItems,
    required this.itemSelected,
    this.colorBox,
    this.colorBorder,
    this.buttonHeight,
    this.buttonWidth,
    this.hint,
    this.borderRadius,
    this.onChange,
    this.colorText,
    this.haveIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Row(
            children: [
              if (haveIcon == true)
                Icon(
                  Icons.list,
                  size: 20,
                  color: Theme.of(context).hintColor,
                ),
              const SizedBox(
                width: 6,
              ),
              Expanded(
                child: Text(
                  hint ?? '',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: colorText ?? Theme.of(context).hintColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          iconOnClick: const Icon(Icons.arrow_drop_up_outlined),
          value: itemSelected,
          items: listItems
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ))
              .toList(),
          onChanged: ((value) {
            onChange?.call(value);
            // itemSelected = value;
          }),
          icon: const Icon(
            Icons.arrow_drop_down_sharp,
          ),
          buttonHeight: buttonHeight ?? 30,
          buttonWidth: buttonWidth ?? 150,
          buttonPadding: const EdgeInsets.symmetric(horizontal: 6),
          buttonDecoration: BoxDecoration(
            color: colorBox,
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
            border: colorBorder != null
                ? Border.all(color: colorBorder!, width: 1)
                : Border.all(color: Colors.transparent),
          ),
          dropdownMaxHeight: 200,
          scrollbarRadius: const Radius.circular(10),
        ),
      ),
    );
  }
}
