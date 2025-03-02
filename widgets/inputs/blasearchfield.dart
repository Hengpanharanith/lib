import 'package:flutter/material.dart';
import '../../theme/theme.dart';

class BlaSearchField extends StatefulWidget {
  final String initialText;
  final String hint;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;
  
  const BlaSearchField({
    Key? key,
    this.initialText = '',
    this.hint = 'Search',
    this.onChanged,
    this.onClear,
  }) : super(key: key);

  @override
  State<BlaSearchField> createState() => _BlaSearchFieldState();
}

class _BlaSearchFieldState extends State<BlaSearchField> {
  late TextEditingController _controller;
  
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialText);
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: BlaColors.white,
        borderRadius: BorderRadius.circular(BlaSpacings.radius),
        border: Border.all(
          color: BlaColors.neutralLight,
          width: 1,
        ),
      ),
      child: TextField(
        controller: _controller,
        style: BlaTextStyles.bodyMedium.copyWith(
          color: BlaColors.textNormal, // Text color based on theme
        ),
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: BlaTextStyles.bodyMedium.copyWith(
            color: BlaColors.white, // Hint text color
          ),
          prefixIcon: Icon(
            Icons.search,
            color: BlaColors.white, // Icon color based on theme
          ),
          suffixIcon: _controller.text.isNotEmpty
              ? IconButton(
                  icon: Icon(
                    Icons.close,
                    color: BlaColors.white, // Icon color for close button
                  ),
                  onPressed: () {
                    _controller.clear();
                    if (widget.onClear != null) {
                      widget.onClear!();
                    }
                    if (widget.onChanged != null) {
                      widget.onChanged!('');
                    }
                  },
                )
              : null,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            vertical: BlaSpacings.s,
            horizontal: BlaSpacings.m,
          ),
        ),
        onChanged: (value) {
          setState(() {});
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
        },
      ),
    );
  }
}
