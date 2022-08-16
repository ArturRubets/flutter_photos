import 'package:flutter/material.dart';

class PhotoDetail extends StatelessWidget {
  final String url;

  const PhotoDetail({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.grey,
          image: DecorationImage(
            image: NetworkImage(url),
            fit: BoxFit.cover,
          ),
        ),
        child: const SizedBox.expand(),
      ),
    );
  }
}
