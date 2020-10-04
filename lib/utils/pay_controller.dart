import 'package:choob_khat/providers/pay_provider.dart';
import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_controls.dart';

class PayController extends FlareControls {
  String animationName;
  PayProvider _provider;

  set setProvider(PayProvider provider) => _provider = provider;

  @override
  void initialize(FlutterActorArtboard artboard) {
    super.initialize(artboard);
    playAnimation('idle');
  }

  void playAnimation(final String animationName) {
    this.animationName = animationName;
    play(animationName);
  }

  @override
  void onCompleted(String name) {
    if (name == 'to_loading')
      playAnimation('loading');
    else if (name == 'loading') {
      if (_provider.isEnded) {
        if (_provider.success)
          playAnimation('success');
        else
          playAnimation('to_idle');
      } else
        playAnimation('loading');
    } else if (name == 'success')
      playAnimation('to_idle');
    else if (name == 'to_idle')
      playAnimation('idle');
    else
      playAnimation('idle');
  }
}
