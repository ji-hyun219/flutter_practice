import 'package:image_picker/image_picker.dart';

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