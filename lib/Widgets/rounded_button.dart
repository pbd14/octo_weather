import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/constants.dart';

class RoundedButton extends StatefulWidget {
  final String text;

  final IconData iconData;

  final bool pressed;
  final Function()? press;
  final Color selectedColor;

  final double borderRadius, width, height;
  final EdgeInsets padding, margin;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    required this.selectedColor,
    required this.iconData,
    this.borderRadius = 30,
    this.width = 150,
    this.height = 55,
    this.padding = const EdgeInsets.all(15),
    this.margin = const EdgeInsets.all(0),
    this.pressed = false,
  }) : super(key: key);

  @override
  State<RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: widget.height,
      width: widget.width,
      // padding: const EdgeInsets.all(20),
      child: CupertinoButton(
        borderRadius: BorderRadius.circular(30.0),
        padding: const EdgeInsets.all(10),
        color: widget.pressed ? widget.selectedColor : whiteColor,
        onPressed: widget.press,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              // margin: EdgeInsets.all(100.0),
              decoration: BoxDecoration(
                color: widget.pressed ? whiteColor : widget.selectedColor,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(5),
              child: Center(
                child: Icon(
                  widget.iconData,
                  color: widget.pressed ? widget.selectedColor : whiteColor,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.text,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              textAlign: TextAlign.start,
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: widget.pressed ? whiteColor : darkDarkColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
