import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_show/utils/maka_colors.dart';

class MakaForm extends StatefulWidget {
  final String labelText;
  final bool enable;
  final EdgeInsetsGeometry padding;
  final Function(String)? onChange;
  final TextInputType? keyboardType;
  final String title;
  final List<TextInputFormatter>? inputFormatters;

  const MakaForm({
    Key? key,
    this.enable = true,
    required this.labelText,
    this.padding = const EdgeInsets.symmetric(
      vertical: 10,
    ),
    this.onChange,
    this.keyboardType,
    this.inputFormatters,
    required this.title,
  }) : super(key: key);

  @override
  _CXConversionState createState() => _CXConversionState();
}

class _CXConversionState extends State<MakaForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: SizedBox(
        height: 49,
        child: TextFormField(
          keyboardType: widget.keyboardType,
          inputFormatters: widget.inputFormatters,
          enabled: widget.enable,
          onChanged: widget.onChange,
          cursorColor: primaryColor,
          style: const TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.normal),
          decoration: InputDecoration(
              filled: true,
              labelText: widget.labelText,
              labelStyle: const TextStyle(color: Colors.grey),
              hintStyle: const TextStyle(color: Colors.grey),
              disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: formGrey)),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey))),
        ),
      ),
    );
  }
}
