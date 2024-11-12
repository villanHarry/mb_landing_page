import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tadbir_landing_page/widgets/app_validators.dart';

class CustomInputField extends StatefulWidget {
  CustomInputField(
      {Key? key,
      this.prefixIcon,
      required this.hint,
      this.onTap,
      this.focusNode,
      this.width,
      this.prefixText,
      this.borderRadius,
      this.onChanged,
      this.suffixIcon,
      this.maxLines,
      this.keyboardType,
      this.inputFormatters,
      this.style,
      this.enable,
      this.readOnly,
      this.textInputAction,
      this.borderSide,
      this.validator,
      this.maxCharacters = 0,
      this.constraints,
      this.onEditingComplete,
      this.onFieldSubmitted,
      this.prefixIconConstraints,
      this.suffixIconConstraints,
      this.bgColor,
      this.hintStyle,
      this.contentPadding,
      TextEditingController? controller})
      : controller = controller ?? TextEditingController(),
        super(key: key);

  final double? width;
  final FocusNode? focusNode;
  final int? maxCharacters;
  final bool? enable;
  final TextInputAction? textInputAction;
  final bool? readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int? maxLines;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final String hint;
  final String? prefixText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? bgColor;
  final String? Function(String?)? validator;
  final BorderRadius? borderRadius;
  final BorderSide? borderSide;
  final void Function()? onTap;
  final BoxConstraints? constraints;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;
  final EdgeInsetsGeometry? contentPadding;

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return TextFormField(
      enabled: widget.enable,
      onTap: widget.onTap,
      key: widget.key,
      autofocus: true,
      focusNode: widget.focusNode,
      maxLength: widget.maxCharacters == 0 ? null : widget.maxCharacters,
      textInputAction: widget.textInputAction,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      readOnly: widget.readOnly ?? false,
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.keyboardType,
      maxLines: widget.maxLines == 0 ? null : widget.maxLines ?? 1,
      controller: widget.controller,
      onChanged: (value) {
        setState(() {});
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
      style: widget.style ?? textTheme.bodyMedium,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        constraints: widget.constraints,
        counterText: "",
        errorMaxLines: 2,
        errorStyle: const TextStyle(
          color: Colors.red,
          fontSize: 12.5,
          fontWeight: FontWeight.w400,
        ),
        hintText: widget.hint,
        contentPadding: widget.contentPadding ??
            const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        hintStyle: widget.hintStyle ??
            textTheme.bodyMedium?.copyWith(color: Colors.grey),
        prefixText: widget.prefixText,
        suffixIcon: widget.suffixIcon,
        suffixIconConstraints: widget.suffixIconConstraints,
        prefixIcon: widget.prefixIcon,
        prefixIconConstraints:
            widget.prefixIconConstraints ?? const BoxConstraints(minWidth: 51),
        filled: true,
        fillColor: widget.bgColor ?? Colors.black,
        focusColor: Colors.grey.shade200,
        errorBorder: widget.borderSide == null
            ? null
            : OutlineInputBorder(
                borderSide:
                    widget.borderSide ?? const BorderSide(color: Colors.red),
                borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
              ),
        enabledBorder: widget.borderSide == null
            ? null
            : OutlineInputBorder(
                borderSide: widget.borderSide ??
                    const BorderSide(color: Color(0xff57BA00)),
                borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
              ),
        focusedBorder: widget.borderSide == null
            ? null
            : OutlineInputBorder(
                borderSide: widget.borderSide ??
                    const BorderSide(color: Color(0xff57BA00)),
                borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
              ),
        disabledBorder: widget.borderSide == null
            ? null
            : OutlineInputBorder(
                borderSide: widget.borderSide ??
                    const BorderSide(color: Color(0xff57BA00)),
                borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
              ),
        focusedErrorBorder: widget.borderSide == null
            ? null
            : OutlineInputBorder(
                borderSide: widget.borderSide ??
                    const BorderSide(color: Color(0xff57BA00)),
                borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
              ),
        border: OutlineInputBorder(
          borderSide:
              widget.borderSide ?? const BorderSide(color: Color(0xff57BA00)),
          borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
        ),
      ),
      validator: widget.validator ?? (val) => val?.validateEmpty(''),
    );
  }
}
