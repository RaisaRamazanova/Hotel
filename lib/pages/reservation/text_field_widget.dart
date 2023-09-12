import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/colors.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:email_validator/email_validator.dart';

enum TextViewType {
  email,
  phone,
  date,
  number,
  text
}

class CustomTextField extends StatefulWidget {
  String hintText;
  TextViewType type;

  CustomTextField({ required this.hintText, this.type = TextViewType.text, super.key});

  @override
  State<CustomTextField> createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  Color containerColor = AppColors.bgColor;
  int isValid = 0;
  bool isLoggedIn = false;
  final _formKey = GlobalKey<FormState>();

  var phoneMask = MaskTextInputFormatter(
      mask: '+7 (###) ###-##-##',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );

  var dateMask = MaskTextInputFormatter(
      mask: '##.##.####',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );

  var numberMask = MaskTextInputFormatter(
      mask: '#### ######',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 325.w,
        height: 60.h,
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.all(Radius.circular(15.w)),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10.h, bottom: 0.h),
              width: 300.w,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      inputFormatters: getMask(widget.type),
                      keyboardType: getKeyboardType(widget.type),
                      decoration: InputDecoration(
                        hintText:
                        widget.type == TextViewType.phone ? '+7 (***) ***-**-**' : '',
                        border: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent
                            )
                        ),
                        labelText: widget.hintText,
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent
                            )
                        ),
                        disabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent
                            )
                        ),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent
                            )
                        ),
                      ),
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 15.sp
                      ),
                      onChanged: (val) {
                        if (widget.type == TextViewType.email) {
                          validateEmail(val);
                        }
                        if (widget.type == TextViewType.phone) {
                          validatePhone(val);
                        }
                        if (widget.type == TextViewType.date) {
                          validateDate(val);
                        }
                        if (widget.type == TextViewType.text) {
                          validateText(val);
                        }
                        if (widget.type == TextViewType.number) {
                          validateNumber(val);
                        }
                      },
                    ),
                  ],
                ),
              )
            )
          ],
        )
    );
  }

  void validateEmail(String val) {
    if(val.isEmpty){
      setState(() {
        isValid = 0;
        containerColor = AppColors.bgColor;
      });
    } else if(!EmailValidator.validate(val, true)){
      setState(() {
        isValid = 0;
        containerColor = AppColors.red.withOpacity(0.15);
      });
    } else{
      setState(() {
        isValid = 1;
        containerColor = AppColors.bgColor;
      });
    }
  }

  void validatePhone(String val) {
    if (val.isEmpty) {
      setState(() {
        isValid = 0;
        containerColor = AppColors.bgColor;
      });
    } else if (val.length == 18) {
      setState(() {
        containerColor = AppColors.bgColor;
        isValid = 1;
      });
    } else {
      setState(() {
        isValid = 0;
        containerColor = AppColors.red.withOpacity(0.15);
      });
    }
  }

  void validateNumber(String val) {
    if (val.isEmpty) {
      setState(() {
        isValid = 0;
        containerColor = AppColors.bgColor;
      });
    } else if (val.length == 11) {
      setState(() {
        containerColor = AppColors.bgColor;
        isValid = 1;
      });
    } else {
      setState(() {
        isValid = 0;
        containerColor = AppColors.red.withOpacity(0.15);
      });
    }
  }

  void validateDate(String val) {
    if (val.isEmpty) {
      setState(() {
        isValid = 0;
        containerColor = AppColors.bgColor;
      });
    } else if (val.length == 10) {
      setState(() {
        containerColor = AppColors.bgColor;
        isValid = 1;
      });
    } else {
      setState(() {
        isValid = 0;
        containerColor = AppColors.red.withOpacity(0.15);
      });
    }
  }

  void validateText(String val) {
    if (val.isEmpty) {
      setState(() {
        isValid = 0;
      });
    } else  {
      setState(() {
        isValid = 1;
      });
    }
  }

  List<MaskTextInputFormatter> getMask(TextViewType type) {
    if (type == TextViewType.phone) {
      return [phoneMask];
    } else if (type == TextViewType.date) {
      return [dateMask];
    } else if (type == TextViewType.number) {
      return [numberMask];
    } else {
      return [];
    }
  }

    TextInputType getKeyboardType(TextViewType type) {
      if (type == TextViewType.phone || type == TextViewType.date || type == TextViewType.number) {
        return TextInputType.phone;
      } else if (type == TextViewType.email) {
        return TextInputType.emailAddress;
      } else {
        return TextInputType.text;
      }
  }
}
