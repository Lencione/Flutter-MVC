import 'package:flutter/material.dart';
import 'package:navigation/controllers/posts_controller.dart';
import 'package:navigation/widgets/custom_button_widget.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final PostsController _controller = PostsController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ValueListenableBuilder(
                valueListenable: _controller.valorAleatorio,
                builder: (_, value, __) => Text(
                  'O texto é $value',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              AnimatedBuilder(
                animation: Listenable.merge(
                    [_controller.posts, _controller.inLoading]),
                builder: (_, __) => _controller.inLoading.value
                    ? const CircularProgressIndicator()
                    : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _controller.posts.value.length,
                        itemBuilder: (_, index) => ListTile(
                          title: Text(_controller.posts.value[index].title),
                        ),
                      ),
              ),
              const SizedBox(height: 10),
              CustomButtonWidget(
                disable: false,
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed('/second', arguments: 'teste');
                },
                title: 'Ir para a segunda página',
              ),
              CustomButtonWidget(
                disable: false,
                onPressed: () => _controller.random(),
                title: 'Randomizar',
              ),
              CustomButtonWidget(
                disable: false,
                onPressed: () => _controller.callApi(),
                title: 'Chamar API',
              ),
              CustomButtonWidget(
                disable: false,
                onPressed: () => _controller.resetApiArray(),
                title: 'Reset',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
