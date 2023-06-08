import 'package:action_figure_app_ui/consts.dart';
import 'package:action_figure_app_ui/models/action_figure_model.dart';
import 'package:flutter/material.dart';

class FigureItem extends StatelessWidget {
  final ActionFigureModel figure;
  const FigureItem({
    super.key,
    required this.figure,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: 300,
          height: 440,
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    color: black.withOpacity(0.25)),
                const BoxShadow(offset: Offset(5, 0), color: white),
                const BoxShadow(offset: Offset(-5, 0), color: white),
              ]),
        ),
        Container(
          width: 300,
          padding: const EdgeInsets.only(left: 20, right: 25, bottom: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/${figure.image}',
                width: 300 - 45,
                height: 330,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 210,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${figure.caracter} | ${figure.title}',
                          maxLines: 1,
                          style: poppins.copyWith(
                              fontSize: 20,
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
                                  '${figure.rate}',
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
              const SizedBox(height: 5),
              Text(
                'US ${figure.price}',
                style: poppins.copyWith(
                    color: green, fontSize: 24, fontWeight: FontWeight.bold),
              )
            ],
          ),
        )
      ],
    );
  }
}
