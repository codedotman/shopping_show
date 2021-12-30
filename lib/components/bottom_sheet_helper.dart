import 'package:flutter/material.dart';
import 'package:shopping_show/components/maka_button.dart';
import 'package:shopping_show/components/maka_images.dart';
import 'package:shopping_show/features/product/add_product_form.dart';

_createExtensibleDialogWidget(
  Widget body,
  BuildContext context, {
  EdgeInsetsGeometry padding =
      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
}) {
  return SafeArea(
    child: Container(
      color: Colors.white,
      child: Padding(
        padding: padding,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                body,
                Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: const SizedBox()),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Future<void> showAddProductBottomSheet(
  BuildContext context,
) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return _createExtensibleDialogWidget(
        const AddProductForm(),
        context,
        padding: const EdgeInsets.all(20),
      );
    },
  );
}

Future<void> showStatusBottomSheet(BuildContext context,
    {required String message, bool success = true}) {
  return showModalBottomSheet(
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
      Radius.circular(15),
    )),
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              )),
          child: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: SizedBox(
                            height: MediaQuery.of(context).size.width * 0.4,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Image.asset(success
                                ? MakaImages.successDialog
                                : MakaImages.errorDialog))),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Center(
                          child: Text(
                        success ? "Successful!" : "Oops!",
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      )),
                    ),
                    Center(
                        child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    )),
                    const SizedBox(
                      height: 20,
                    ),
                    MakaButton(
                      title: "Dismiss",
                      callback: () => Navigator.pop(context),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: const SizedBox(
                        height: 15,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
