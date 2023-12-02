import 'package:flutter/material.dart';
import 'package:flutter_maps/Presentaion/Widgets/country_label_widget.dart';
import 'package:flutter_maps/Presentaion/Widgets/custom_text_form_field.dart';

class PhoneFormField extends StatelessWidget {
  const PhoneFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CountryLabelWidget(),
        const SizedBox(
          width: 16,
        ),
        CustomTextFormField()
      ],
    );
  }
}
