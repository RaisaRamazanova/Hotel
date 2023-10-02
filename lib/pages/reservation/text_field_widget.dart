import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/colors.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:email_validator/email_validator.dart';
import 'package:hotel/helper/string_apis.dart';

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

  CustomTextField({ required this.hintText, this.type = TextViewType.text, Key? key}) : super(key: key);

  @override
  State<CustomTextField> createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  Color containerColor = AppColors.bgColor;
  bool isValid = false;
  bool isLoggedIn = false;

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
        height: 50.h,
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.all(Radius.circular(15.w)),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 300.w,
              child: Column(
                children: [
                  TextFormField(
                    inputFormatters: getMask(widget.type),
                    keyboardType: getKeyboardType(widget.type),
                    decoration: InputDecoration(
                      hintText:
                      widget.type == TextViewType.phone ? '+7 (***) ***-**-**' : '',
                      contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      border: InputBorder.none,
                      labelText: widget.hintText,
                      labelStyle: const TextStyle(color: Colors.black),
                      error: null,
                      errorText: null,
                      errorStyle: const TextStyle(height: 0, fontSize: 0.0, color: Colors.black),
                    ),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 10.sp
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
                    validator: (val) {
                      if (!isValid) {
                        return '';
                      }
                     },
                  ),
                ],
              )
            )
          ],
        )
    );
  }

  void validateEmail(String val) {
    if(val.isEmpty){
      setState(() {
        isValid = false;
        containerColor = AppColors.bgColor;
      });
    } else if(!EmailValidator.validate(val, true)){
      setState(() {
        isValid = false;
        containerColor = AppColors.red.withOpacity(0.15);
      });
    } else{
      setState(() {
        isValid = true;
        containerColor = AppColors.bgColor;
      });
    }
  }

  void validatePhone(String val) {
    if (val.isEmpty) {
      setState(() {
        isValid = false;
        containerColor = AppColors.bgColor;
      });
    }
    if (val.length == 18) {
      setState(() {
        isValid = true;
        containerColor = AppColors.bgColor;
      });
    } else {
      setState(() {
        isValid = false;
        containerColor = AppColors.red.withOpacity(0.15);
      });
    }
  }

  void validateNumber(String val) {
    if (val.isEmpty) {
      setState(() {
        isValid = false;
        containerColor = AppColors.bgColor;
      });
    } else if (val.length == 11) {
      setState(() {
        containerColor = AppColors.bgColor;
        isValid = true;
      });
    } else {
      setState(() {
        isValid = false;
        containerColor = AppColors.red.withOpacity(0.15);
      });
    }
  }

  void validateDate(String val) {
    if (val.isEmpty) {
      setState(() {
        isValid = false;
        containerColor = AppColors.bgColor;
      });
    } else if (val.length == 10) {
      setState(() {
        containerColor = AppColors.bgColor;
        isValid = true;
      });
    } else {
      setState(() {
        isValid = false;
        containerColor = AppColors.red.withOpacity(0.15);
      });
    }
  }

  void validateText(String val) {
    if (val.isEmpty) {
      setState(() {
        isValid = false;
      });
    } else  {
      setState(() {
        isValid = true;
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
