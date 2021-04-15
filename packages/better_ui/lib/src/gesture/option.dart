library swipedetector;

///
///
///
class SwipeConfiguration {
  /// Vertical swipe configuration options
  double verticalSwipeMaxWidthThreshold = 50.0;
  double verticalSwipeMinDisplacement = 100.0;
  double verticalSwipeMinVelocity = 300.0;

  /// Horizontal swipe configuration options
  double horizontalSwipeMaxHeightThreshold = 50.0;
  double horizontalSwipeMinDisplacement = 100.0;
  double horizontalSwipeMinVelocity = 300.0;

  ///
  SwipeConfiguration({
    double verticalSwipeMaxWidthThreshold,
    double verticalSwipeMinDisplacement,
    double verticalSwipeMinVelocity,
    double horizontalSwipeMaxHeightThreshold,
    double horizontalSwipeMinDisplacement,
    double horizontalSwipeMinVelocity,
  }) {
    if (verticalSwipeMaxWidthThreshold != null) {
      this.verticalSwipeMaxWidthThreshold = verticalSwipeMaxWidthThreshold;
    }

    if (verticalSwipeMinDisplacement != null) {
      this.verticalSwipeMinDisplacement = verticalSwipeMinDisplacement;
    }

    if (verticalSwipeMinVelocity != null) {
      this.verticalSwipeMinVelocity = verticalSwipeMinVelocity;
    }

    if (horizontalSwipeMaxHeightThreshold != null) {
      this.horizontalSwipeMaxHeightThreshold = horizontalSwipeMaxHeightThreshold;
    }

    if (horizontalSwipeMinDisplacement != null) {
      this.horizontalSwipeMinDisplacement = horizontalSwipeMinDisplacement;
    }

    if (horizontalSwipeMinVelocity != null) {
      this.horizontalSwipeMinVelocity = horizontalSwipeMinVelocity;
    }
  }
}
