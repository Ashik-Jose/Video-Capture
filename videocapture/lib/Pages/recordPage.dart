import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:videocapture/Pages/videoPreview.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({super.key});

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  late CameraController _cameraController;
  late List<CameraDescription> _cameras;
  bool isLoading = true;
  bool isRecording = false;
  bool isPaused = false;

  _initCamera() async {
    _cameras = await availableCameras();
    _cameraController = CameraController(_cameras[0], ResolutionPreset.max);
    await _cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {
        isLoading = false;
      });
    }).catchError((error) {
      print(error);
    });
  }

  _recordVideo() async {}

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container(
            color: Colors.grey[300],
            child: const Center(child: CircularProgressIndicator()),
          )
        : Center(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CameraPreview(_cameraController),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FloatingActionButton(
                        backgroundColor: Colors.red,
                        onPressed: () async {
                          if (isRecording) {
                            final file =
                                await _cameraController.stopVideoRecording();
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        VideoPreview(file: file.path)));
                          } else {
                            await _cameraController.prepareForVideoRecording();
                            await _cameraController.startVideoRecording();
                          }
                          setState(() {
                            isRecording = !isRecording;
                          });
                        },
                        child: Icon(isRecording
                            ? Icons.stop
                            : Icons.video_camera_back_rounded),
                      ),
                      FloatingActionButton(
                        backgroundColor: Colors.red,
                        onPressed: () async {
                          if (isRecording) {
                            if (!isPaused) {
                              await _cameraController.pauseVideoRecording();
                            } else {
                              await _cameraController.resumeVideoRecording();
                            }
                            setState(() {
                              isPaused = !isPaused;
                            });
                          }
                        },
                        child: Icon(!isPaused ? Icons.pause_circle : Icons.play_circle),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
