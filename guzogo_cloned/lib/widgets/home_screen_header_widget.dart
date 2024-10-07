import 'package:flutter/cupertino.dart';

import '../data/constants/image_constants.dart';

class HomeScreenHeaderWidget extends StatelessWidget {
  const HomeScreenHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.only(right: 20),
          width: size.width * 0.62,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                ImageConstants.logo,
                height: size.height * 0.07,
              ),
              Container(
                height: size.width * 0.12,
                width: size.width * 0.12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                      color: const Color.fromRGBO(240, 240, 240, 1), width: 3),
                ),
                child: const Icon(
                  CupertinoIcons.bell_fill,
                  color: Color.fromRGBO(240, 240, 240, 1),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
