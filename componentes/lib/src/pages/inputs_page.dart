import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {
  const InputsPage({Key? key}) : super(key: key);

  @override
  State<InputsPage> createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {
  String _nombre = '';
  String _email = '';
  String _date = '';

  final List<String> _poderes = [
    'Volar',
    'Rayos X',
    ' Super Aliento',
    'Super Fuerza'
  ];

  String _selectedOption = 'Volar';

  TextEditingController _inputDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        children: [
          _createInput(),
          const Divider(),
          _createEmail(),
          const Divider(),
          _createPassword(),
          const Divider(),
          _createDatePicker(context),
          const Divider(),
          _createDropdown(),
          const Divider(),
          _createPerson(),
        ],
      ),
    );
  }

  Widget _createInput() {
    return TextField(
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        counter: Text('Cantidad de letras ${_nombre.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Nombre de la persona',
        suffixIcon: const Icon(Icons.coffee),
        icon: const Icon(Icons.person),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onChanged: (value) {
        setState(() {
          _nombre = value;
        });
      },
    );
  }

  Widget _createPerson() {
    return ListTile(
      title: Text('El nombre es: $_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text('Poder: $_selectedOption'),
    );
  }

  Widget _createEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.none,
      decoration: InputDecoration(
        hintText: 'e-mail',
        labelText: 'Correo electrónico',
        suffixIcon: const Icon(Icons.alternate_email),
        icon: const Icon(Icons.email),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _createPassword() {
    return TextField(
      obscureText: true,
      textCapitalization: TextCapitalization.none,
      decoration: InputDecoration(
        hintText: 'Password',
        labelText: 'Contraseña',
        suffixIcon: const Icon(Icons.health_and_safety_sharp),
        icon: const Icon(Icons.lock),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onChanged: (value) {},
    );
  }

  Widget _createDatePicker(context) {
    return TextField(
        controller: _inputDateController,
        enableInteractiveSelection: false,
        decoration: InputDecoration(
          hintText: 'Fecha de nacimiento',
          labelText: 'Fecha de nacimiento',
          suffixIcon: const Icon(Icons.perm_contact_calendar),
          icon: const Icon(Icons.calendar_today),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        onChanged: (value) {},
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
          _selectDate(context);
        });
  }

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2023),
      locale: const Locale('es', 'ES'),
    );

    if (picked != null) {
      setState(() {
        _date = '${picked.day}/${picked.month}/${picked.year}';
        _inputDateController.text = _date;
      });
    }
  }

  List<DropdownMenuItem<String>> getDropdownOptions() {
    List<DropdownMenuItem<String>> list = [];
    for (var element in _poderes) {
      list.add(DropdownMenuItem(
        child: Text(element),
        value: element,
      ));
    }

    return list;
  }

  _createDropdown() {
    /*  return DropdownButton(
      isExpanded: true,
      items: getDropdownOptions(),
      value: _optionSelected,
      onChanged: (opt) {
        setState(() {
          _optionSelected = opt.toString();
        });
      },
    ); */
    return DropdownButtonFormField(
      items: getDropdownOptions(),
      value: _selectedOption,
      decoration: InputDecoration(icon: Icon(Icons.abc)),
      onChanged: (opt) {
        setState(() {
          _selectedOption = opt.toString();
        });
      },
    );
  }
}
