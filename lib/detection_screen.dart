import 'dart:io';

import 'package:edge_detection/edge_detection.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DetectionScreen extends StatefulWidget {
  const DetectionScreen({super.key});

  @override
  State<DetectionScreen> createState() => _DetectionScreenState();
}

class _DetectionScreenState extends State<DetectionScreen> {
  List<String> _documents = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: MaterialButton(
          color: Colors.red,
          child: const Icon(Icons.add),
          onPressed: () async {
            bool isCameraGranted = await Permission.camera.request().isGranted;
            if (!isCameraGranted) {
              isCameraGranted =
                  await Permission.camera.request() == PermissionStatus.granted;
            }

            if (!isCameraGranted) {
              // Have not permission to camera
              return;
            }
            final Directory appDocumentsDir =
                await getApplicationDocumentsDirectory();
            EdgeDetection.detectEdge("${appDocumentsDir.path}/image.png")
                .then((value) {
              _documents.add("${appDocumentsDir.path}/image.png");
              setState(() {});
            });
          },
        ),
      ),
    );
  }
}
