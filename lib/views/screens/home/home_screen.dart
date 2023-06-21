import 'package:currency_converter/controllers/currency_controller.dart';
import 'package:currency_converter/views/screens/home/widgets/currency_widget.dart';
import 'package:currency_converter/views/screens/home/widgets/custom_button.dart';
import 'package:currency_converter/views/screens/home/widgets/custom_text_field.dart';
import 'package:currency_converter/views/screens/home/widgets/future_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final controller = Get.put(CurrencyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Currency Convertor"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Amount Row
              Row(
                children: [
                  Text(
                    "Amount",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.merge(const TextStyle(fontSize: 20)),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Form(
                        key: controller.formKey,
                        child: CustomTextFormField(
                          onTap: () {
                            controller.isConvert.value = false;
                            controller.isPressed.value = false;
                          },
                          onChanged: (val) {
                            controller.isPressed.value = false;
                          },
                          onSaved: (val) {
                            controller.amount.value = int.parse(val!);
                          },
                          validator: (val) {
                            return (val!.isEmpty)
                                ? "Please Enter Amount"
                                : (val.isNum == false)
                                    ? "Enter Numeric Value"
                                    : null;
                          },
                          hintText: "Enter Amount",
                          controller: controller.amountController,
                        )),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              // Select Currency
              Row(
                children: [
                  currencySelectButton(
                    controller: controller,
                    isFrom: true,
                    context: context,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      Text(
                        "",
                        style: Theme.of(context).textTheme.titleMedium?.merge(
                              const TextStyle(fontSize: 20),
                            ),
                      ),
                      Icon(
                        Icons.compare_arrows,
                        size: 35,
                        color: Theme.of(context).primaryColor.withOpacity(0.9),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  currencySelectButton(
                    controller: controller,
                    isFrom: false,
                    context: context,
                  ),
                ],
              ),
              // Future Builder
              Obx(
                () => (controller.isPressed.value)
                    ? futureBuilder(context, controller)
                    : Container(),
              ),
              const SizedBox(height: 20),
              // Convert Button
              CustomButton(
                txtBtn: 'Convert',
                onPressed: () async {
                  if (controller.formKey.currentState!.validate()) {
                    controller.formKey.currentState!.save();
                    controller.isConvert.value = true;
                    controller.convertButtonOnTap();
                  }
                },
              ),

              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
