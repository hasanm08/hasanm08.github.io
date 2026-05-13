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
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 370),
      reverseDuration: const Duration(milliseconds: 1665), //370*4.5
      lowerBound: 0.0,
      upperBound: 5,
      value: 0.0,
    );
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isHovered = !isHovered;
          if (isHovered) {
            _controller.forward();
          } else {
            _controller.reverse();
          }
        });
      },
      onHover: (hovered) {
        setState(() {
          isHovered = hovered;
          if (isHovered) {
            _controller.forward();
          } else {
            _controller.reverse();
          }
        });
      },
      child: SizedBox(
        width: 300,
        height: 300,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              child: AnimatedOpacity(
                opacity: isHovered ? 0 : 1,
                duration: const Duration(milliseconds: 370),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 370),
                  transformAlignment: FractionalOffset.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.0001)
                    ..rotateX(_controller.value * -1),
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
            // AnimatedOpacity(
            //   opacity: isHovered ? 0 : 1,
            //   duration: const Duration(milliseconds: 370),
            //   child: const Center(
            //     child: RotatingCircle(
            //       size: 250,
            //       color: Colors.blue,
            //     ),
            //   ),
            // ),

            AnimatedPositioned(
              duration: const Duration(milliseconds: 370),
              bottom: isHovered ? 8 : 0,
              left: 0,
              right: 0,
              top: isHovered ? 8 : 0,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 370),
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
