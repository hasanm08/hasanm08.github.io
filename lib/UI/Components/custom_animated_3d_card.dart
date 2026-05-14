import 'package:flutter/material.dart';

class CustomAnimated3DCard extends StatefulWidget {
  final String characterImage;
  final String coverImage;
  final double? size;

  const CustomAnimated3DCard({
    super.key,
    required this.characterImage,
    required this.coverImage,
    this.size,
  });

  @override
  CustomAnimated3DCardState createState() => CustomAnimated3DCardState();
}

class CustomAnimated3DCardState extends State<CustomAnimated3DCard>
    with SingleTickerProviderStateMixin {
  bool isHovered = false;
  late AnimationController _controller;
  late Animation<double> _tilt;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 480),
      reverseDuration: const Duration(milliseconds: 400),
      lowerBound: 0.0,
      upperBound: 1.0,
    );
    _tilt = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutQuint,
      reverseCurve: Curves.easeInQuart,
    );
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _setHover(bool hovered) {
    setState(() {
      isHovered = hovered;
      if (isHovered) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const motionMs = 420;
    final tiltAmount = _tilt.value * 5;

    return InkWell(
      onTap: () => _setHover(!isHovered),
      onHover: _setHover,
      child: SizedBox(
        width: 300,
        height: 300,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              child: AnimatedOpacity(
                opacity: isHovered ? 0 : 1,
                duration: const Duration(milliseconds: motionMs),
                curve: Curves.easeOutQuint,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: motionMs),
                  curve: Curves.easeOutQuint,
                  transformAlignment: FractionalOffset.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.0001)
                    ..rotateX(-tiltAmount),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(widget.coverImage),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: motionMs),
              curve: Curves.easeOutQuint,
              bottom: isHovered ? 8 : 0,
              left: 0,
              right: 0,
              top: isHovered ? 8 : 0,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: motionMs),
                curve: Curves.easeOutQuint,
                opacity: isHovered ? 1 : 0,
                child: Image.asset(
                  widget.characterImage,
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
