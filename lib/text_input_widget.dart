import 'package:flutter/material.dart';
// import 'package:intl/intl.dart' as intl;

class TextInputWidget extends StatefulWidget {
  final String? hintText;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? height;
  final String? topLabel;
  final bool obscureText;
  final bool inLineLabel;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final Key? kKey;
  final TextEditingController? controller;
  final String? initialValue;
  final String? suffixText;
  final String? prefixText;
  final InputDecoration? decoration;
  final double? widgetMargin;
  final TextInputAction? textInputAction;
  final TextDirection? textDirection;
  final TextCapitalization? textCapitalization;
  final int? minLines;
  final int? maxLength;

  const TextInputWidget({
    this.hintText,
    this.widgetMargin,
    this.prefixIcon,
    this.suffixIcon,
    this.height = 48.0,
    this.topLabel = "",
    this.suffixText,
    this.prefixText,
    this.obscureText = false,
    this.inLineLabel = true,
    @required this.onSaved,
    this.keyboardType,
    this.errorText,
    this.onChanged,
    this.validator,
    this.kKey,
    this.controller,
    this.initialValue,
    this.decoration,
    this.textInputAction,
    this.textDirection,
    this.textCapitalization,
    this.minLines,
    this.maxLength,
  }) : super(key: kKey);

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<TextInputWidget> {
  InputDecoration myInputWidgetDecoration(
      {hint,
      hintSize,
      label,
      bool isFocused = false,
      prefixIcon,
      suffixIcon,
      suffixText,
      prefixText,
      double? borderRadius,
      Color? borderColor}) {
    return InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        suffixText: suffixText,
        prefixText: prefixText,
        fillColor: Colors.white,
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        focusColor: Colors.purple,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? Colors.deepPurple,
            ),
            gapPadding: 12,
            borderRadius: BorderRadius.circular(borderRadius ?? 8)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(borderRadius ?? 8)),
        border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
              width: 0,
            ),
            borderRadius: BorderRadius.circular(borderRadius ?? 8)),
        labelText: label,
        hintText: hint,
        labelStyle: TextStyle(
          fontSize: 16,
          color: Colors.black.withOpacity(0.6),
        ));
  }

  TextDirection textDir = TextDirection.ltr;
  @override
  void initState() {
    if (widget.initialValue != null) {
      (widget.initialValue!.contains(RegExp(r'[ا-ی]')) &&
              !widget.initialValue!.contains('https://'))
          ? textDir = TextDirection.rtl
          : textDir = TextDirection.ltr;
    }
    super.initState();
  }

  final double _radius = 10;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: widget.widgetMargin ?? 0.0, vertical: 10),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_radius)),
        child: TextFormField(
          autocorrect: false,
          minLines: widget.minLines ?? 1,
          textCapitalization:
              widget.textCapitalization ?? TextCapitalization.sentences,
          enableSuggestions: false,
          textDirection: widget.textDirection ?? textDir,
          maxLines: null,
          textInputAction: widget.textInputAction ?? TextInputAction.newline,
          initialValue: widget.initialValue,
          controller: widget.controller,
          maxLength: widget.maxLength,
          key: widget.kKey,
          keyboardType: widget.keyboardType ?? TextInputType.multiline,
          onSaved: widget.onSaved,
          onChanged: (textValue) {
            if (textValue.contains(RegExp(r'[ا-ی]')) &&
                !textValue.contains('https://')) {
              textDir = TextDirection.rtl;
              setState(() {});
            } else {
              textDir = TextDirection.ltr;
              setState(() {});
            }
            if (widget.onChanged != null) {
              widget.onChanged!(textValue);
            }
          },
          validator: widget.validator,
          obscureText: widget.obscureText,
          decoration: myInputWidgetDecoration(
              // borderColor: Colors.transparent,
              borderRadius: _radius,
              hint: widget.hintText,
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon,
              suffixText: widget.suffixText,
              prefixText: widget.prefixText,
              label: widget.inLineLabel ? widget.topLabel : null),
          style: const TextStyle(
              fontSize: 14, color: Colors.black, fontFamily: "Roboto"),
        ),
      ),
    );
  }
}
