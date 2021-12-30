import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shopping_show/components/maka_button.dart';
import 'package:shopping_show/components/maka_forms.dart';
import 'package:shopping_show/components/maka_images.dart';
import 'package:shopping_show/data/controller/product_controller.dart';
import 'package:shopping_show/data/models/add_product_content.dart';
import 'package:shopping_show/utils/maka_app_strings.dart';
import 'package:shopping_show/utils/maka_colors.dart';

class AddProductForm extends StatefulWidget {
  const AddProductForm({Key? key}) : super(key: key);

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  late ProductController productController;
  int itemCount = 1;

  @override
  Widget build(BuildContext context) {
    productController = Provider.of<ProductController>(context, listen: true);

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                addMoreProduct,
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
              ),
              const Spacer(),
              InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset(MakaImages.closeIcon)),
            ],
          ),
          Text(
            addFormDesMsg,
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  height: 1.6,
                ),
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: ListView(
              children: List.generate(itemCount, (i) => _formList(i)),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                itemCount++;
                productController.addMoreProduct();
              });
            },
            child: Row(
              children: [
                const Icon(Icons.add),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  addMoreProduct,
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                      // color: colorTheme.selectedColor,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          // const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: MakaButton(
                    title: "Close",
                    backgroundColor: primaryColor,
                    textColor: Colors.white,
                    callback: () => {Navigator.pop(context)},
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: MakaButton(
                    title: "Next",
                    key: const Key("add_product_button"),
                    backgroundColor: primaryColor,
                    textColor: Colors.white,
                    enable: productController.validInput,
                    callback: () => {
                      Navigator.pop(context),
                      productController.addProduct()
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _formList(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Product: ${index + 1}",
          style: Theme.of(context).textTheme.headline4!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                height: 1.6,
              ),
        ),
        MakaForm(
          key: const Key("item_name_key"),
          title: "Item name",
          labelText: "Item name",
          onChange: (s) {
            productController.addProductContent[index].itemName = s;
            setState(() {});
          },
        ),
        MakaForm(
          key: const Key("item_quantity_key"),
          title: "Item quantity",
          labelText: "Item quantity",
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          onChange: (s) {
            if (s.isNotEmpty) {
              productController.addProductContent[index].quantitySold =
                  int.parse(s);
            } else {
              productController.addProductContent[index].quantitySold = null;
            }
            setState(() {});
          },
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    final productController =
        Provider.of<ProductController>(context, listen: false);
    productController.addProductContent = [AddProductContent()];
  }
}
