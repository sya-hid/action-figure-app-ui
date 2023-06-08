import 'package:action_figure_app_ui/consts.dart';
import 'package:action_figure_app_ui/models/action_figure_model.dart';
import 'package:action_figure_app_ui/widgets/app_bar_button.dart';
import 'package:flutter/material.dart';
import 'package:action_figure_app_ui/widgets/custom_clip.dart';

class DetailPage extends StatefulWidget {
  final ActionFigureModel figure;
  const DetailPage({super.key, required this.figure});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  TapDownDetails? tapDownDetails;
  TransformationController? transformationController;
  bool zoomed = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    transformationController = TransformationController();
    transformationController!.value = Matrix4.identity()..scale(0.8);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    transformationController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ActionFigureModel figure = widget.figure;
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          leadingWidth: 75,
          toolbarHeight: 80,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Row(
            children: [
              const SizedBox(width: 30),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const AppBarButton(
                  icon: Icons.arrow_back,
                ),
              ),
            ],
          ),
          actions: [
            Row(
              children: [
                const SizedBox(width: 10),
                Stack(
                  children: [
                    const AppBarButton(icon: Icons.shopping_cart_outlined),
                    Positioned(
                      right: 5,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                            color: Colors.red, shape: BoxShape.circle),
                        child: Text(
                          '3',
                          style: poppins.copyWith(color: white, fontSize: 10),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 30),
              ],
            )
          ],
        ),
        extendBodyBehindAppBar: true,
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              SizedBox(
                width: size.width,
                height: size.height * 0.7,
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        double scale = 0.8;
                        final value = Matrix4.identity()..scale(scale);
                        transformationController!.value = value;
                        setState(() {
                          zoomed = false;
                        });
                      },
                      onDoubleTap: () {
                        double scale = 2;
                        final x =
                            -tapDownDetails!.localPosition.dx * (scale - 1);
                        final y =
                            -tapDownDetails!.localPosition.dy * (scale - 1);
                        final value = Matrix4.identity()
                          ..translate(x, y)
                          ..scale(scale);
                        transformationController!.value = value;
                        setState(() {
                          zoomed = true;
                        });
                      },
                      onDoubleTapDown: (details) => tapDownDetails = details,
                      child: InteractiveViewer(
                        transformationController: transformationController,
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                          'assets/${widget.figure.image}',
                          width: size.width,
                          height: size.height * 0.7,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 90,
                      child: SizedBox(
                        width: size.width,
                        height: 45,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              bottom: 15,
                              child: Opacity(
                                opacity: zoomed ? 0 : 1,
                                child: ClipPath(
                                  clipper: CustomCip(),
                                  child: Container(
                                    width: size.width,
                                    height: 45,
                                    color: green,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Opacity(
                                opacity: zoomed ? 0.6 : 1,
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                      color: green, shape: BoxShape.circle),
                                  child: const Icon(
                                    Icons.code_sharp,
                                    color: white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: size.width,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30))),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            // width: 210,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${figure.caracter} | ${figure.title}',
                                  maxLines: 1,
                                  style: poppins.copyWith(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: black),
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star_rate_rounded,
                                          color: Colors.amber,
                                          size: 16,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          '${figure.rate} | ${figure.reviews} Reviews',
                                          style: poppins.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: black.withOpacity(0.6)),
                                        )
                                      ],
                                    ),
                                    const SizedBox(width: 10),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.shopping_cart_outlined,
                                          color: black.withOpacity(0.6),
                                          size: 16,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          '${figure.sold} Sold',
                                          style: poppins.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: black.withOpacity(0.6)),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.5),
                              color: bgColor,
                            ),
                            child: const Icon(
                              Icons.favorite_rounded,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 35),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Spesification',
                            style: poppins.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Icon(
                            Icons.keyboard_arrow_up_rounded,
                            color: black.withOpacity(0.6),
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                  text: TextSpan(
                                      style: poppins.copyWith(
                                          fontWeight: FontWeight.bold),
                                      children: [
                                    const TextSpan(text: 'Size : '),
                                    TextSpan(text: figure.spesification.size),
                                  ])),
                              RichText(
                                  text: TextSpan(
                                      style: poppins.copyWith(
                                          fontWeight: FontWeight.bold),
                                      children: [
                                    const TextSpan(text: 'Material : '),
                                    TextSpan(
                                        text: figure.spesification.material),
                                  ])),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                  text: TextSpan(
                                      style: poppins.copyWith(
                                          fontWeight: FontWeight.bold),
                                      children: [
                                    const TextSpan(text: 'Type : '),
                                    TextSpan(text: figure.spesification.type),
                                  ])),
                              RichText(
                                  text: TextSpan(
                                      style: poppins.copyWith(
                                          fontWeight: FontWeight.bold),
                                      children: [
                                    const TextSpan(text: 'Condition : '),
                                    TextSpan(
                                        text: figure.spesification.condition),
                                  ])),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Price',
                                  style: poppins.copyWith(fontSize: 16)),
                              Text('US \$${figure.price}',
                                  style: poppins.copyWith(
                                      fontSize: 28,
                                      color: green,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Container(
                              height: 70,
                              width: size.width * 0.5,
                              decoration: BoxDecoration(
                                  color: green,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.shopping_cart_outlined,
                                    color: white,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Add Cart',
                                    style: poppins.copyWith(
                                        color: white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
