
import 'package:chewie/chewie.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:joy_app/l10n/generated/app_localizations.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerScreen({super.key, required this.videoUrl});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  late Future<void> _initializeVideoPlayerFuture;
  bool _isDownloading = false;
  final _dio = Dio();

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    _initializeVideoPlayerFuture = _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    await _videoPlayerController.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  void _showSnackbar(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Future<bool> _requestStoragePermission() async {
    final locale = AppLocalizations.of(context);
    var status = await Permission.storage.status;
    if (status.isGranted) {
      return true;
    }

    status = await Permission.storage.request();

    if (!mounted) return false;

    if (status.isPermanentlyDenied) {
      final openSettings = await showDialog<bool>(
        context: context,
        builder: (dialogContext) => AlertDialog(
          title: Text(locale.title_warning),
          content: Text(locale.permission_storage_denied_permanently),
          actions: <Widget>[
            TextButton(
              child: Text(locale.btn_cancel),
              onPressed: () => Navigator.of(dialogContext).pop(false),
            ),
            ElevatedButton(
              child: Text(locale.btn_open_app_settings),
              onPressed: () => Navigator.of(dialogContext).pop(true),
            ),
          ],
        ),
      );

      if (openSettings == true) {
        await openAppSettings();
        if (!mounted) return false;
        status = await Permission.storage.status;
      }
    } else if (status.isDenied) {
      _showSnackbar("Storage permission was denied. Cannot download video.");
    }
    return status.isGranted;
  }

  Future<void> _downloadVideo() async {
    if (_isDownloading) return;
    if (mounted) {
      setState(() {
        _isDownloading = true;
      });
    }

    try {
      final hasPermission = await _requestStoragePermission();
      if (!hasPermission) return;

      _showSnackbar("Downloading video...");

      // Get temporary directory to save the downloaded file
      final tempDir = await getTemporaryDirectory();
      final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      final tempPath = '${tempDir.path}/joy_app_video_$timestamp.mp4';

      // Download the video to the temporary file, which is more memory-efficient
      await _dio.download(
        widget.videoUrl,
        tempPath,
      );

      final result = await ImageGallerySaverPlus.saveFile(tempPath);
      if (result is Map && result['isSuccess'] == true) {
        _showSnackbar("Video saved to gallery.");
      } else {
        String errorMessage = "Failed to save video.";
        if (result is Map && result['errorMessage'] != null) {
          errorMessage += " Error: ${result['errorMessage']}";
        } else {
          errorMessage += " Details: $result";
        }
        throw Exception(errorMessage);
      }
    } catch (e) {
      _showSnackbar("Download failed: ${e.toString()}");
    } finally {
      if (mounted) {
        setState(() {
          _isDownloading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: _isDownloading
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                        strokeWidth: 2, color: Colors.white),
                  )
                : const Icon(Icons.download, color: Colors.white),
            onPressed: _isDownloading ? null : _downloadVideo,
          ),
          const SizedBox(width: 10), // Spacing for the right edge
        ],
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Error loading video: ${snapshot.error}',
                  style: const TextStyle(color: Colors.white),
                ),
              );
            }
            return Center(
              child: Chewie(
                controller: _chewieController,
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
