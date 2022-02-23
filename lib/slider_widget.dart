import 'package:flutter/material.dart';

import 'components/custom_slider_thumc_circle.dart';
import 'components/custom_tick_mark_shape.dart';
import 'components/custom_track_shape.dart';

class SliderWidget extends StatefulWidget {
  final double sliderHeight;
  final int min;
  final int max;
  final bool fullWidth;
  final List<Color>? colors;

  const SliderWidget({
    Key? key,
    this.sliderHeight = 48,
    this.max = 10,
    this.min = 0,
    this.fullWidth = false,
    this.colors,
  }) : super(key: key);

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double _value = 0;

  @override
  Widget build(BuildContext context) {
    double paddingFactor = .3;

    if (widget.fullWidth) paddingFactor = .3;

    return Container(
      width: widget.fullWidth ? double.infinity : (widget.sliderHeight) * 5.5,
      // height: (widget.sliderHeight),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular((widget.sliderHeight * .3)),
        ),
        gradient: LinearGradient(
          colors: widget.colors ??
              [
                const Color(0x607D67),
                const Color(0xFF0072ff),
              ],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 1.00),
          stops: const [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          widget.sliderHeight * paddingFactor,
          10,
          widget.sliderHeight * paddingFactor,
          10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  '${widget.min}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: widget.sliderHeight * .3,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                Text(
                  '${widget.max}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: widget.sliderHeight * .3,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
              // color: Colors.black,
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.teal.withOpacity(.7),
                  inactiveTrackColor: Colors.white.withOpacity(.5),
                  thumbShape: CustomSliderThumbCircle(
                    thumbRadius: widget.sliderHeight * .4,
                    thumbHeight: 30,
                    min: widget.min,
                    max: widget.max,
                  ),
                  tickMarkShape: const CustomTickMarkShape(),
                  thumbColor: Colors.white,
                  //extended color
                  overlayColor: Colors.teal.withOpacity(0.4),
                  //custom design
                  trackShape: CustomTrackShape(),
                  //dividers color
                  activeTickMarkColor: Colors.amber,
                  inactiveTickMarkColor: Colors.grey,
                  trackHeight: 2.0,
                ),
                child: Slider(
                  divisions: widget.max,
                  value: _value,
                  onChanged: (value) {
                    setState(
                      () {
                        _value = value;
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
