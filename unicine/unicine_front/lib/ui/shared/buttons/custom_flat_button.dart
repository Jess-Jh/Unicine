import 'package:flutter/material.dart';

class CustomFlatButton extends StatefulWidget {
  final String text;
  final Color color;
  final Function onPressed;
  final bool isActive;

  const CustomFlatButton({
    super.key,
    required this.text,
    this.color = Colors.lightBlueAccent,
    required this.onPressed,
    this.isActive = false,
  });

  @override
  State<CustomFlatButton> createState() => _CustomFlatButtonState();
}

class _CustomFlatButtonState extends State<CustomFlatButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      color: isHovered
          ? Colors.white.withOpacity(0.1)
          : widget.isActive
              ? Colors.white.withOpacity(0.1)
              : Colors.transparent,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.isActive ? null : () => widget.onPressed(),
          child: MouseRegion(
            onEnter: (_) => setState(() => isHovered = true),
            onExit: (_) => setState(() => isHovered = false),
            child: TextButton(
              style: TextButton.styleFrom(
                primary: widget.color,
              ),
              onPressed: () => widget.onPressed(),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(widget.text),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
