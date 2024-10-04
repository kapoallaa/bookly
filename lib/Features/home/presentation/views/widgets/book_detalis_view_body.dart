import 'package:bookly/Features/home/presentation/views/widgets/custom_book_detalis_app_bar.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class BookDetalisViewBody extends StatelessWidget {
  const BookDetalisViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const CustomBookDetaAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .18),
            child: const CustomBookImage(),
          )
        ],
      ),
    );
  }
}
