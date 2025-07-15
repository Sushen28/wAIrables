import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  CameraController? controller;
  late List<CameraDescription> cameras;

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  Future<void> initCamera() async {
    cameras = await availableCameras();
    controller = CameraController(cameras[0], ResolutionPreset.medium);
    await controller!.initialize();
    setState(() {});
  }

  Future<void> captureImage() async {
    if (!controller!.value.isInitialized) return;
    final image = await controller!.takePicture();
    print('📸 Captured: ${image.path}');
    // We'll send this to GPT next
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller!.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      body: Stack(
        children: [
          CameraPreview(controller!),
          Positioned(
            bottom: 40,
            left: MediaQuery.of(context).size.width / 2 - 40,
            child: FloatingActionButton(
              onPressed: captureImage,
              child: const Icon(Icons.camera_alt),
            ),
          )
        ],
      ),
    );
  }
}
