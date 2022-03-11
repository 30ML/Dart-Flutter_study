import 'package:create_a_shimmer_loading_effect/shimmer/shimmer.dart';
import 'package:flutter/material.dart';

const _shimmerGradient = LinearGradient(
  colors: [
    Color(0xFFEBEBF4),
    Color(0xFFF4F4F4),
    Color(0xFFEBEBF4),
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);

class ShimmerLoading extends StatefulWidget {
  const ShimmerLoading({
    Key? key,
    required this.isLoading,
    required this.child,
  }) : super(key: key);

  final bool isLoading;
  final Widget child;

  @override
  State<ShimmerLoading> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading> {
  @override
  Widget build(BuildContext context) {
    // return !widget.isLoading
    //     ? widget.child
    //     : ShaderMask(
    //         blendMode: BlendMode.srcATop,
    //         shaderCallback: (bounds) => _shimmerGradient.createShader(bounds),
    //         child: widget.child,
    //       );
    if (!widget.isLoading) {
      return widget.child;
    }

    // Collect ancestor shimmer information
    final shimmer = Shimmer.of(context)!;
    if (!shimmer.isSized) {
      return const SizedBox();
    }
    final shimmerSize = shimmer.size;
    final gradient = shimmer.gradient;
    final offsetWithinShimmer = shimmer.getDescendantOffset(
      descendent: context.findRenderObject() as RenderBox,
    );

    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) {
        return gradient.createShader(
          Rect.fromLTWH(
            -offsetWithinShimmer.dx,
            -offsetWithinShimmer.dy,
            shimmerSize.width,
            shimmerSize.height,
          ),
        );
      },
      child: widget.child,
    );
  }
}

class _ExampleUiLoadingAnimationState extends StatefulWidget {
  const _ExampleUiLoadingAnimationState({Key? key}) : super(key: key);

  @override
  State<_ExampleUiLoadingAnimationState> createState() =>
      __ExampleUiLoadingAnimationStateState();
}

class __ExampleUiLoadingAnimationStateState
    extends State<_ExampleUiLoadingAnimationState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Shimmer(
        linearGradient: _shimmerGradient,
        child: ListView(),
      ),
    );
  }
}
