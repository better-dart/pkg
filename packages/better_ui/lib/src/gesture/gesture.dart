library swipedetector;

import 'package:flutter/material.dart';

import 'option.dart';

///
/// 滑动手势监听:
///   - https://github.com/TEDConsulting/swipedetector
///
class SwipeDetector extends StatelessWidget {
  ///
  final Widget child;

  ///
  final Function() onSwipeUp;

  ///
  final Function() onSwipeDown;

  ///
  final Function() onSwipeLeft;

  ///
  final Function() onSwipeRight;

  ///
  final SwipeConfiguration swipeConfiguration;

  // ignore: public_member_api_docs
  SwipeDetector({
    @required this.child,
    this.onSwipeUp,
    this.onSwipeDown,
    this.onSwipeLeft,
    this.onSwipeRight,
    SwipeConfiguration swipeConfiguration,
  }) : this.swipeConfiguration = swipeConfiguration == null ? SwipeConfiguration() : swipeConfiguration;

  @override
  Widget build(BuildContext context) {
    //Vertical drag details
    DragStartDetails startVerticalDragDetails;
    DragUpdateDetails updateVerticalDragDetails;

    //Horizontal drag details
    DragStartDetails startHorizontalDragDetails;
    DragUpdateDetails updateHorizontalDragDetails;

    return GestureDetector(
      child: child,
      onVerticalDragStart: (dragDetails) {
        startVerticalDragDetails = dragDetails;
      },
      onVerticalDragUpdate: (dragDetails) {
        updateVerticalDragDetails = dragDetails;
      },
      onVerticalDragEnd: (endDetails) {
        double dx = updateVerticalDragDetails.globalPosition.dx - startVerticalDragDetails.globalPosition.dx;
        double dy = updateVerticalDragDetails.globalPosition.dy - startVerticalDragDetails.globalPosition.dy;
        double velocity = endDetails.primaryVelocity;

        //Convert values to be positive
        if (dx < 0) dx = -dx;
        if (dy < 0) dy = -dy;
        double positiveVelocity = velocity < 0 ? -velocity : velocity;

        if (dx > swipeConfiguration.verticalSwipeMaxWidthThreshold) return;
        if (dy < swipeConfiguration.verticalSwipeMinDisplacement) return;
        if (positiveVelocity < swipeConfiguration.verticalSwipeMinVelocity) return;

        if (velocity < 0) {
          //Swipe Up
          if (onSwipeUp != null) {
            onSwipeUp();
          }
        } else {
          //Swipe Down
          if (onSwipeDown != null) {
            onSwipeDown();
          }
        }
      },
      onHorizontalDragStart: (dragDetails) {
        startHorizontalDragDetails = dragDetails;
      },
      onHorizontalDragUpdate: (dragDetails) {
        updateHorizontalDragDetails = dragDetails;
      },
      onHorizontalDragEnd: (endDetails) {
        double dx = updateHorizontalDragDetails.globalPosition.dx - startHorizontalDragDetails.globalPosition.dx;
        double dy = updateHorizontalDragDetails.globalPosition.dy - startHorizontalDragDetails.globalPosition.dy;
        double velocity = endDetails.primaryVelocity;

        if (dx < 0) dx = -dx;
        if (dy < 0) dy = -dy;
        double positiveVelocity = velocity < 0 ? -velocity : velocity;

        if (dx < swipeConfiguration.horizontalSwipeMinDisplacement) return;
        if (dy > swipeConfiguration.horizontalSwipeMaxHeightThreshold) return;
        if (positiveVelocity < swipeConfiguration.horizontalSwipeMinVelocity) return;

        if (velocity < 0) {
          //Swipe Up
          if (onSwipeLeft != null) {
            onSwipeLeft();
          }
        } else {
          //Swipe Down
          if (onSwipeRight != null) {
            onSwipeRight();
          }
        }
      },
    );
  }
}
