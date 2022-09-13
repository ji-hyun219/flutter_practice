import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/*
final ImagePicker _picker = ImagePicker();

// Pick an image
final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

// Capture a photo
final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

// Pick a video
final XFile? image = await _picker.pickVideo(source: ImageSource.gallery);

// Capture a video
final XFile? video = await _picker.pickVideo(source: ImageSource.camera);

// Pick multiple images
final List<XFile>? images = await _picker.pickMultiImage();
*/

class ImageUploadPage extends StatefulWidget {
  const ImageUploadPage({Key? key}) : super(key: key);

  @override
  State<ImageUploadPage> createState() => _ImageUploadPageState();
}

class _ImageUploadPageState extends State<ImageUploadPage> {
  final ImagePicker _picker = ImagePicker();
  List<XFile> _pickedImgs = [];

  Future<void> _pickImg() async {
    final List<XFile>? images = await _picker.pickMultiImage();
    if (images != null) {
      setState(() {
        _pickedImgs = images;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // 첫번째 container 에는 이미지 업로드 버튼을, 4번째 박스에는 업로드한 이미지가 4장 넘어갈 때 개수를 표시할 카운터를 child 로 전달한다.
    final List<Widget> boxContent = [
      IconButton(
          onPressed: () {
            _pickImg();
          },
          icon: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            child: const Icon(CupertinoIcons.camera),
          )),
      Container(),
      Container(),
      _pickedImgs.length <= 4
          ? Container()
          : FittedBox(
              child: Container(
              padding: const EdgeInsets.all(6),
              child: Text('+${(_pickedImgs.length - 4).toString()}'),
            ))
    ];

    return Scaffold(
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: GridView.count(
              padding: const EdgeInsets.all(2),
              crossAxisCount: 2, // 가로로 배치할 위젯의 개수
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              children: List.generate(
                  4,
                  // 이미지 미리보기
                  // 그리고 이미지가 선택되었을 때 프리뷰 기능을 하도록 모든 박스에 BoxDecoration 의 image 를 세팅해준다.
                  (index) => Container(
                        decoration: index > _pickedImgs.length - 1
                            ? BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(12),
                              )
                            : BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(12),
                                image:
                                    DecorationImage(fit: BoxFit.fill, image: FileImage(File(_pickedImgs[index].path)))),
                        child: Center(child: boxContent[index]),
                      )))),
    );
  }
}
