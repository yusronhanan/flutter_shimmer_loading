import 'package:flutter/material.dart';
import 'package:shimmer_loading/constant.dart';
import 'package:shimmer_loading/shimmer_loading.dart';
import 'package:shimmer_loading/slider_example.dart';

import 'card_list_item.dart';
import 'circle_list_item.dart';
import 'shimmer_class.dart';

class LoadingWithCustomShimmer extends StatefulWidget {
  const LoadingWithCustomShimmer({Key? key}) : super(key: key);

  @override
  State<LoadingWithCustomShimmer> createState() =>
      _LoadingWithCustomShimmerState();
}

class _LoadingWithCustomShimmerState extends State<LoadingWithCustomShimmer> {
  bool _isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ShimmerClass(
      linearGradient: ShimmerGradient.shimmerGradient,
      child: ListView(children: [
        _buildCardSlider(_isLoading),
        _buildCardSlider(!_isLoading),
        const SizedBox(
          height: 10,
        ),
        _buildText(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            50,
            _isLoading),
        _buildText(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            50,
            !_isLoading),
        _buildText(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            20,
            _isLoading),
        _buildText(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            20,
            !_isLoading),
        const SizedBox(
          height: 10,
        ),
        _buildTopRowItem(_isLoading),
        _buildTopRowItem(!_isLoading),
        const SizedBox(
          height: 10,
        ),
        _buildLastItem(_isLoading),
        _buildLastItem(!_isLoading),
        const SizedBox(
          height: 10,
        ),
        _buildListItem(_isLoading),
        _buildListItem(!_isLoading),
      ]),
    ));
  }

  Widget _buildCardSlider(bool isLoading) {
    return ShimmerLoading(
        isLoading: isLoading,
        child: CardSlider(
            textTitle: "Card Slider",
            itemList: const [
              'https://flutter'
                  '.dev/docs/cookbook/img-files/effects/split-check/Food1.jpg',
              'https://flutter'
                  '.dev/docs/cookbook/img-files/effects/split-check/Food1.jpg',
              'https://flutter'
                  '.dev/docs/cookbook/img-files/effects/split-check/Food1.jpg',
              'https://flutter'
                  '.dev/docs/cookbook/img-files/effects/split-check/Food1.jpg',
              'https://flutter'
                  '.dev/docs/cookbook/img-files/effects/split-check/Food1.jpg',
              'https://flutter'
                  '.dev/docs/cookbook/img-files/effects/split-check/Food1.jpg',
              'https://flutter'
                  '.dev/docs/cookbook/img-files/effects/split-check/Food1.jpg',
              'https://flutter'
                  '.dev/docs/cookbook/img-files/effects/split-check/Food1.jpg'
            ],
            onTapCallback: (key) => print(key)));
  }

  Widget _buildTopRowItem(bool isLoading) {
    return ShimmerLoading(
      isLoading: isLoading,
      child: const CircleListItem(),
    );
  }

  Widget _buildListItem(bool isLoading) {
    return ShimmerLoading(
      isLoading: isLoading,
      child: CardListItem(
        isLoading: isLoading,
      ),
    );
  }

  Widget _buildLastItem(bool isLoading) {
    return ShimmerLoading(
      isLoading: isLoading,
      child: Container(
        decoration: BoxDecoration(color: Colors.blue),
        height: 50,
        width: 70,
      ),
    );
  }

  Widget _buildText(String text, double fontSize, bool isLoading) {
    return ShimmerLoading(
      isLoading: isLoading,
      child: isLoading
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: fontSize / 2,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: 250,
                  height: fontSize / 2,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ],
            )
          : Text(
              text,
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold),
            ),
    );
  }
}
