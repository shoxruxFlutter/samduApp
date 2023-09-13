import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samduapp/ui/widgets/yuklama_screen/yuklama_view_model.dart';

class YuklamaScreenWidget extends StatefulWidget {
  const YuklamaScreenWidget({super.key});

  @override
  State<YuklamaScreenWidget> createState() => _YuklamaScreenWidgetState();
}

class _YuklamaScreenWidgetState extends State<YuklamaScreenWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.microtask(
      () => context.read<YuklamaViewModel>().initAsync(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: const [
        Column(
          children: [
            _IshchiOquvReja(),
            _FanningNamunaviyOquvDastur(),
            _FanningSillabusi(),
          ],
        ),
      ]),
    );
  }
}

class _IshchiOquvReja extends StatelessWidget {
  const _IshchiOquvReja();

  @override
  Widget build(BuildContext context) {
    final model = context.watch<YuklamaViewModel>();

    final buttonState = context.select((YuklamaViewModel v) => v.stateYuklama)
        ? const Text('Yuklash', style: TextStyle(color: Colors.black))
        : const Icon(
            Icons.remove_circle_outline,
            color: Colors.red,
          );
    final funcState = model.stateYuklamaButton ? null : model.downloadYuklama;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "O'qituvchining o'quv yuklamasi",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey[800],
                  ),
                ),
                Container(height: 10),
                Text(
                  "Professor o'qitvuchilarning o'quv rejasi",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[700],
                  ),
                ),
                Row(
                  children: <Widget>[
                    const Spacer(),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.transparent,
                      ),
                      child: const Text(
                        "Ko'rish",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {},
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.transparent,
                      ),
                      onPressed: funcState,
                      child: buttonState,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(height: 5),
        ],
      ),
    );
  }
}

class _FanningNamunaviyOquvDastur extends StatelessWidget {
  const _FanningNamunaviyOquvDastur();

  @override
  Widget build(BuildContext context) {
    final model = context.watch<YuklamaViewModel>();
    final buttonState =
        context.select((YuklamaViewModel value) => value.stateNamunaviy)
            ? "O'chirish"
            : 'Yuklash';
    final funcState = model.stateNamunaviyButton
        ? model.pickNamunaviyFile
        : model.deleteNamunaviy;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Fanning namunaviy o'quv dasturi",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey[800],
                  ),
                ),
                Container(height: 10),
                Text(
                  "Professor o'qitvuchilarning Namunaviy o'quv dasturi",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[700],
                  ),
                ),
                Row(
                  children: <Widget>[
                    const Spacer(),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.transparent,
                      ),
                      child: const Text(
                        "Ko'rish",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {},
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.transparent,
                      ),
                      onPressed: funcState,
                      child: Text(
                        buttonState,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(height: 5),
        ],
      ),
    );
  }
}

class _FanningSillabusi extends StatelessWidget {
  const _FanningSillabusi();

  @override
  Widget build(BuildContext context) {
    final model = context.watch<YuklamaViewModel>();
    final buttonState =
        context.select((YuklamaViewModel value) => value.stateSillabus)
            ? "O'chirish"
            : 'Yuklash';
    final funcState = model.stateSillabusButton
        ? model.pickSillabusFile
        : model.deleteSillabus;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Fanning sillabusi",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey[800],
                  ),
                ),
                Container(height: 10),
                Text(
                  "Professor o'qitvuchilarning Sillabusi",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[700],
                  ),
                ),
                Row(
                  children: <Widget>[
                    const Spacer(),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.transparent,
                      ),
                      child: const Text(
                        "Ko'rish",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {},
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.transparent,
                      ),
                      onPressed: funcState,
                      child: Text(
                        buttonState,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(height: 5),
        ],
      ),
    );
  }
}
