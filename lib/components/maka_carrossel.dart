import 'package:flutter/material.dart';
import 'package:shopping_show/utils/maka_app_strings.dart';
import 'package:shopping_show/utils/maka_colors.dart';

class CarrosselWidget extends StatefulWidget {
  final List<String> dataImage;

  const CarrosselWidget({Key? key, required this.dataImage}) : super(key: key);

  @override
  _CarrosselWidgetState createState() => _CarrosselWidgetState();
}

class _CarrosselWidgetState extends State<CarrosselWidget> {
  int initialPage = 0;
  PageController controller = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (
      context,
    ) {
      return Stack(
        children: [
          PageView.builder(
            controller: controller,
            onPageChanged: (v) {
              setState(() {
                initialPage = v;
              });
            },
            itemCount: widget.dataImage.length,
            itemBuilder: (context, i) => Image.network(
              widget.dataImage[i],
              fit: BoxFit.fill,
              errorBuilder: (a, b, c) => Center(
                  child: Text(
                genericErrorMsg,
                style: Theme.of(context).textTheme.headline3!.copyWith(),
              )),
            ),
          ),
          widget.dataImage.length <= 1
              ? Container()
              : Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children:
                        List.generate(widget.dataImage.length, (index) => index)
                            .map((index) => InkWell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 250),
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 16.0),
                                      width: 10,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: index == initialPage
                                            ? Colors.grey
                                            : greyShade,
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                  ),
                )
        ],
      );
    });
  }
}
