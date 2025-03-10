import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../../../app_widget/custom_container.dart';
import '../../../app_widget/dimands.dart';

class ImagePickerForWeb extends StatefulWidget {
  const ImagePickerForWeb({super.key});

  @override
  State<ImagePickerForWeb> createState() => _ImagePickerForWebState();
}
class _ImagePickerForWebState extends State<ImagePickerForWeb> {

  Uint8List? _imageBytes;

  Future<void> pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
      withData: true,
    );

    if (result?.files.single.bytes != null) {
      setState(() => _imageBytes = result!.files.single.bytes);
    } else {
      debugPrint(" कोई मान्य इमेज फ़ाइल नहीं चुनी गई।");
    }
  }


  @override
  Widget build(BuildContext context) {

    Demands demands = Demands(context);

    return  customContainer(
      bRadius: demands.screenHeight*0.01,
      containerColor: Colors.grey,
      height: demands.screenWidth>600?demands.screenWidth*0.4:demands.screenHeight*0.4,
      width: demands.screenWidth>600?demands.screenWidth*0.05:demands.screenWidth*0.18,
      hMargin: demands.screenWidth>600?demands.screenWidth*0.02:demands.screenWidth*0.05,
      onTap:pickImage,
      child:  _imageBytes != null
          ? ClipRRect( 
           borderRadius: BorderRadius.circular(demands.screenHeight*0.01),
          child: Image.memory(_imageBytes!, fit: BoxFit.cover))
          : const Icon(Icons.person, color: Colors.white),
    );
  }
}
