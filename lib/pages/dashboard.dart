import 'package:choob_khat/providers/pay_provider.dart';
import 'package:choob_khat/utils/pay_controller.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  final PayController controller = PayController();

  Widget _mainScaffold(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('چوب خط'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('should end'),
                      Switch.adaptive(
                        value: Provider.of<PayProvider>(context).isEnded,
                        onChanged:
                            Provider.of<PayProvider>(context).endedChange,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('should success'),
                      Switch.adaptive(
                        value: Provider.of<PayProvider>(context).success,
                        onChanged:
                            Provider.of<PayProvider>(context).successChange,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => controller.animationName == 'idle'
                  ? controller.playAnimation('to_loading')
                  : null,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .1,
                child: FlareActor(
                  'assets/flare/pay.flr',
                  controller: controller
                    ..setProvider = Provider.of<PayProvider>(context),
                ),
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PayProvider(),
      builder: (_, __) => Builder(builder: (context) => _mainScaffold(context)),
    );
  }
}
