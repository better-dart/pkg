import 'package:better_ui/better_ui.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

mixin FormMixin {
  Widget searchForm({
    TextEditingController? controller,
    ValueChanged<String>? onSubmitted,
    Widget? prefixIcon,
    String? hintText,
    TextStyle? hintStyle,
    BorderRadius? borderRadius,
    BorderSide? borderSide,
    bool withInput = false,
  }) {
    var item = TextField(
      controller: controller,
      onSubmitted: onSubmitted ??
          (value) {
            print('input form: $value');
          },
      decoration: InputDecoration(
        prefixIcon: prefixIcon ?? Icon(Icons.search, size: 24),
        hintText: hintText ?? 'hint',
        hintStyle: hintStyle ?? TextStyle(color: Get.theme.primaryColor),
        border: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(5),
          borderSide: borderSide ?? BorderSide.none,
        ),
      ),
    );

    return withInput ? ui.wrap.inputView(child: item) : item;
  }

  Widget form({
    required key,
    required List<Widget> children,
    Widget? button,
    String? buttonText,
    VoidCallback? onTap,
    WillPopCallback? onWillPop,
    EdgeInsetsGeometry? padding,
  }) {
    final btn = button ??
        (buttonText != null
            ? ui.button.buildTextButton(
                titleText: buttonText,
                width: Get.width * 0.5,
                onTap: () {
                  if (!onFormStateSave(key: key)) {
                    return;
                  }

                  if (onTap != null) {
                    onTap();
                  }
                },
              )
            : null);

    children.addIf(
      btn != null,
      SafeArea(
        child: ui.wrap.rowFit(children: [btn ?? SizedBox()]),
        minimum: EdgeInsets.all(10),
      ),
    );

    return ui.wrap.inputView(
      child: Form(
        key: key,
        autovalidateMode: AutovalidateMode.always,
        onWillPop: onWillPop,
        child: ListView(
          children: children,
          padding: padding,
        ),
      ),
    );
  }

  Widget multiTextFormFieldBuilder({
    required String name,
    int minLines = 4,
    int maxLines = 5,
    String? initialValue,
    FormFieldValidator<String>? validators,
    ValueChanged<String?>? onChanged,
    FormFieldSetter<String>? onSaved,
    ValueChanged<String>? onSubmitted,
    VoidCallback? onEditingComplete,
    EdgeInsetsGeometry? padding,
    String? labelText,
    TextStyle? labelStyle,
    String? hintText,
    TextStyle? hintStyle,
    bool? alignLabelWithHint,
    ToolbarOptions? toolbarOptions,
    BorderRadius? borderRadius,
    Color? borderColor,
  }) {
    return textFormFieldBuilder(
      name: name,
      minLines: minLines,
      maxLines: maxLines,
      initialValue: initialValue,
      validators: validators,
      onChanged: onChanged,
      onSaved: onSaved,
      onSubmitted: onSubmitted,
      onEditingComplete: onEditingComplete,
      padding: padding,
      labelText: labelText ?? '',
      labelStyle: labelStyle,
      hintText: hintText,
      hintStyle: hintStyle,
      alignLabelWithHint: alignLabelWithHint,
      toolbarOptions: toolbarOptions,
      borderRadius: borderRadius,
      borderColor: borderColor,
    );
  }

  Widget textFormFieldBuilder({
    required String name,
    int? minLines,
    int? maxLines,
    String? initialValue,
    FormFieldValidator<String>? validators,
    ValueChanged<String?>? onChanged,
    FormFieldSetter<String>? onSaved,
    ValueChanged<String>? onSubmitted,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    EdgeInsetsGeometry? padding,
    String? labelText,
    TextStyle? labelStyle,
    String? hintText,
    TextStyle? hintStyle,
    bool? alignLabelWithHint,
    ToolbarOptions? toolbarOptions,
    BorderRadius? borderRadius,
    Color? borderColor,
    Brightness? keyboardAppearance,
  }) {
    return Padding(
      padding: padding ?? EdgeInsets.only(top: 10, bottom: 10),
      child: TextFormField(
        initialValue: initialValue,
        minLines: minLines ?? 1,
        maxLines: maxLines ?? 5,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        toolbarOptions: toolbarOptions,
        keyboardAppearance: keyboardAppearance ?? Brightness.light,
        onChanged: (value) {
          print('form field changed: value = $value');
          if (onChanged != null) {
            onChanged(value);
          }
        },
        onSaved: onSaved,
        onFieldSubmitted: onFieldSubmitted,
        onEditingComplete: onEditingComplete,
        decoration: InputDecoration(
          labelText: labelText ?? 'label',
          labelStyle: labelStyle ??
              TextStyle(
                fontSize: 12,
              ),
          alignLabelWithHint: alignLabelWithHint ?? true,
          hintText: hintText ?? 'hint',
          hintStyle: hintStyle ??
              TextStyle(
                color: Color(0xff8E8E8E),
                fontSize: 12,
              ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Get.theme.primaryColor,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Get.theme.unselectedWidgetColor,
              width: 0.3,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.redAccent,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          isDense: true,
        ),
        showCursor: true,
        cursorWidth: 3,
        validator: validators ??
            FormBuilderValidators.compose(
              [],
            ),
      ),
    );
  }

  bool onFormStateSave({required GlobalKey<FormState> key}) {
    final state = key.currentState!;

    if (!state.validate()) {
      ui.logErr('form state: validate failed');
      return false;
    }

    state.save();
    return true;
  }
}
