import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar Page'),
        actions: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fareajugones.sport.es%2Fwp-content%2Fuploads%2F2020%2F12%2Fimagen-2020-12-09-143245-1080x609.jpg'),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: const CircleAvatar(
              child: Text('VAH'),
              backgroundColor: Colors.purple,
            ),
          )
        ],
      ),
      body: const Center(
        child: FadeInImage(
          image: NetworkImage(
              'https://i1.wp.com/www.bitme.gg/wp-content/uploads/2020/12/Chainsaw-Man-publicara-su-episodio-final-muy-pronto.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
        ),
      ),
    );
  }
}
