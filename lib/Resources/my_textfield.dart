import 'package:dukkantek/Resources/validations.dart';
import 'package:flutter/material.dart';

enum MyTextFieldType {
  email,
  password,
  firstName,
  lastName,
  phone,
  confirmp,
  code,
  question
}

class MyTextField extends StatefulWidget {
  final MyTextFieldType? keyboardtype;
  final Function()? onEditCompleted;
  final Function(String?)? onchanged;
  final String? initialValue;
  final bool? isEditable;
  final TextAlign? textalign;
  final TextStyle? textstyle;
  const MyTextField(
      {required this.keyboardtype,
      this.initialValue,
      this.isEditable,
      this.onEditCompleted,
      this.onchanged,
      this.textalign,
      this.textstyle});
  @override
  _CustomTextfieldState createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<MyTextField> {
  late TextEditingController textfieldcontroller;
  bool obscureText = true;

  void _toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  void initState() {
    super.initState();
    textfieldcontroller =
        TextEditingController(text: widget.initialValue ?? '');
    textfieldcontroller.addListener(_printEmailValue);
  }

  _printEmailValue() {
    // widget.validator(textfieldcontroller.text);
  }

  @override
  void dispose() {
    super.dispose();
    textfieldcontroller.addListener(_printEmailValue);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextFormField(
            textAlign:
                widget.textalign != null ? widget.textalign! : TextAlign.left,
            style: widget.textstyle != null ? widget.textstyle! : TextStyle(),
            onEditingComplete: () {
              widget.onEditCompleted!();
            },
            controller: textfieldcontroller,
            enabled: widget.isEditable ?? true,
            obscureText: widget.keyboardtype == MyTextFieldType.password
                ? obscureText
                : widget.keyboardtype == MyTextFieldType.confirmp
                    ? obscureText
                    : false,
            keyboardType: widget.keyboardtype == MyTextFieldType.email
                ? TextInputType.emailAddress
                : widget.keyboardtype == MyTextFieldType.password
                    ? TextInputType.text
                    : widget.keyboardtype == MyTextFieldType.firstName
                        ? TextInputType.name
                        : widget.keyboardtype == MyTextFieldType.phone
                            ? TextInputType.number
                            : widget.keyboardtype == MyTextFieldType.confirmp
                                ? TextInputType.text
                                : widget.keyboardtype ==
                                        MyTextFieldType.question
                                    ? TextInputType.text
                                    : widget.keyboardtype ==
                                            MyTextFieldType.code
                                        ? TextInputType.number
                                        : TextInputType.text,
            validator: (value) {
              return insiderValidator(value, widget.keyboardtype!);
            },
            onChanged: (value) {
              widget.onchanged!(value);
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              fillColor: const Color.fromRGBO(224, 231, 255, 100),
              filled: true,
              labelText: placeholder(),
              labelStyle: const TextStyle(
                color: Colors.black,
                fontSize: 11,
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(211, 220, 255, 1)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(5.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(5.0),
              ),
              suffixIcon: widget.keyboardtype == MyTextFieldType.password
                  ? TextButton(
                      child: Icon(
                        obscureText
                            ? Icons.remove_red_eye_outlined
                            : Icons.visibility_off_outlined,
                        color: Colors.grey,
                        size: 18,
                      ),
                      onPressed: _toggle,
                    )
                  : widget.keyboardtype == MyTextFieldType.confirmp
                      ? TextButton(
                          child: Icon(
                            obscureText
                                ? Icons.remove_red_eye_outlined
                                : Icons.visibility_off_outlined,
                            color: Colors.grey,
                            size: 18,
                          ),
                          onPressed: _toggle,
                        )
                      : null,
            ),
          ),
        ));
  }

  String? insiderValidator(String? value, MyTextFieldType type) {
    textfieldcontroller.text = value!;
    switch (type) {
      case MyTextFieldType.email:
        return Validations.validateEmail(value);
      case MyTextFieldType.firstName:
        return Validations.validateFirstName(value);
      case MyTextFieldType.lastName:
        return Validations.validateLastName(value);
      case MyTextFieldType.phone:
        return Validations.validatePhone(value);
      case MyTextFieldType.password:
        return Validations.validatePassword(value);
      case MyTextFieldType.confirmp:
        return Validations.validatePassword(value);
      default:
        return null;
    }
  }

  String placeholder() {
    switch (widget.keyboardtype) {
      case MyTextFieldType.email:
        return 'Email ID';
      case MyTextFieldType.password:
        return 'Password';
      case MyTextFieldType.firstName:
        return 'First Name';
      case MyTextFieldType.lastName:
        return 'Last Name';
      case MyTextFieldType.phone:
        return 'Phone Number';
      case MyTextFieldType.confirmp:
        return 'Confirm Password';
      default:
        return '';
    }
  }
}
