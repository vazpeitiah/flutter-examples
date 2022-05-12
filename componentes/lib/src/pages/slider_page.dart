import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 60.0;
  bool _blocked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider'),
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _createSlider(),
            const SizedBox(height: 20),
            _createCheckbox(),
            const SizedBox(height: 20),
            _createSwitch(),
            const SizedBox(height: 40),
            _createImage(),
          ],
        ),
      ),
    );
  }

  _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      value: _sliderValue,
      min: 60.0,
      max: 300.0,
      onChanged: (_blocked == true)
          ? null
          : (value) {
              setState(() {
                _sliderValue = value;
              });
            },
    );
  }

  _createImage() {
    return Image(
      image: const NetworkImage(
          'https://somoskudasai.net/wp-content/uploads/2020/04/portada_kimetsu-no-yaiba-shinobu.jpg'),
      width: _sliderValue,
      fit: BoxFit.fill,
    );
  }

  _createCheckbox() {
    /* return Checkbox(
      value: _blocked,
      onChanged: (value) {
        setState(() {
          _blocked = value;
        });
      },
    ); */
    return CheckboxListTile(
      value: _blocked,
      title: const Text('Bloquear slider'),
      onChanged: (value) {
        setState(() {
          if (value != null) {
            _blocked = value;
          }
        });
      },
    );
  }

  _createSwitch() {
    return SwitchListTile(
      value: _blocked,
      title: const Text('Bloquear slider'),
      onChanged: (value) {
        setState(() {
          _blocked = value;
        });
      },
    );
  }
}
