import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_show/components/bottom_sheet_helper.dart';
import 'package:shopping_show/components/maka_app_bar.dart';
import 'package:shopping_show/components/maka_button.dart';
import 'package:shopping_show/components/maka_carrossel.dart';
import 'package:shopping_show/components/maka_images.dart';
import 'package:shopping_show/components/maka_page_state_widget.dart';
import 'package:shopping_show/components/maka_scaffold.dart';
import 'package:shopping_show/data/controller/product_controller.dart';
import 'package:shopping_show/data/models/maka_response.dart';
import 'package:shopping_show/utils/maka_app_strings.dart';
import 'package:shopping_show/utils/maka_colors.dart';

class MakaHomeScreen extends StatefulWidget {
  const MakaHomeScreen({Key? key}) : super(key: key);

  @override
  _MakaHomeScreenState createState() => _MakaHomeScreenState();
}

class _MakaHomeScreenState extends State<MakaHomeScreen>
    implements ProductView {
  late ProductController productController;

  @override
  Widget build(BuildContext context) {
    productController = Provider.of<ProductController>(context, listen: true);
    productController.setProductView = this;

    return MakaScaffold(
      padding: EdgeInsets.zero,
      backgroundColor: scaffoldBackgroundColor,
      state: AppState(
          pageState: productController.pageState,
          onRetry: () => setState(() {
                productController.pageState = PageState.loaded;
              })),
      floatingActionButton: FloatingActionButton(
        key: const Key("add_product_fab"),
        onPressed: () => showAddProductBottomSheet(context),
        backgroundColor: primaryColor,
        child: const Icon(Icons.add),
      ),
      appBar: MakaAppBar(
        title: Row(
          children: [
            Text(
              home,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ],
        ),
      ),
      builder: (context) => Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.22,
            width: MediaQuery.of(context).size.width,
            child: CarrosselWidget(
              dataImage: MakaImages.carrosselDataImage,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                )),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  crossAxisCount: 2,
                  childAspectRatio: 0.01,
                ),
                itemCount: productController.productResponse.length,
                itemBuilder: (context, i) {
                  var item = productController.productResponse[i];
                  return productListTile(
                    item,
                  );
                },
              ),
            ),
          )),
        ],
      ),
    );
  }

  Widget productListTile(MakaResponse productResponse) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            MakaImages.dummyImage,
            fit: BoxFit.fill,
          ),
          Text(
            productResponse.itemName!,
            style: Theme.of(context).textTheme.headline3!.copyWith(
                  color: Colors.black,
                ),
          ),
          Text(
            "${productResponse.quantitySold} item sold",
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
          ),
          Text(
            "Product Id: MAKALIVE${productResponse.itemID}",
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 35,
            child: MakaButton(
              title: buy,
              key: const Key("buy_button"),
              backgroundColor: primaryColor,
              textColor: Colors.white,
              callback: () => productController
                  .buyProduct(productResponse.itemID.toString()),
            ),
          )
        ],
      ),
    );
  }

  @override
  void onError(String error) {
    showStatusBottomSheet(context,
        message: error, success: false, key: const Key("status_error"));
  }

  @override
  void onSuccess(String message) {
    showStatusBottomSheet(context,
        message: message, key: const Key("status_success"));
  }
}
