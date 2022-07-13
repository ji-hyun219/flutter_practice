import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SliderPage extends StatelessWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('캐러셀')),
      body: Column(
        children: <Widget>[
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 30,
                color: Colors.blue,
              ),
              Positioned(
                // top: 0,
                child: AbsorbPointer(
                  child: CarouselSlider.builder(
                      options: CarouselOptions(
                        height: 30.0,
                        autoPlay: true,
                        autoPlayAnimationDuration: const Duration(seconds: 1),
                        scrollDirection: Axis.vertical,
                      ),
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                          Builder(
                            builder: (BuildContext context) {
                              return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  decoration: const BoxDecoration(
                                    color: Colors.blue,
                                  ),
                                  child: Text(
                                    '1시간 전 {뒷번호 4자리}님이 10포인트 당첨되었습니다! $itemIndex',
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                    ),
                                  ));
                            },
                          )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
