import 'package:exercicio/data/dog.dao.dart';
import 'package:exercicio/models/dog.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _dao =
      DogDao(); // classe que vai permitir fazer o crud no banco de dados
  final _nomeCtrl = TextEditingController();
  final _notasCtrl = TextEditingController();
  final _searchCtrl = TextEditingController();
  final _materiaCtrl = TextEditingController();

  Dog? _editing;
  // Variavel para verificar se o dog  esta sendo editado
  Future<List<Dog>>? _futureDogs;
  @override
  void initState() {
    super.initState();
    _reload();
  }

  void _reload() {
    setState(() {
      final q = _searchCtrl.text.trim(); // trim remove os espaços em branco
      _futureDogs = q.isEmpty ? _dao.getAll() : _dao.searchByName(q);
    });
  }

  // funçao para limpar o texteditcontroller

  void _clearForm() {
    _nomeCtrl.clear();
    _notasCtrl.clear();
    _materiaCtrl.clear();
    _editing = null;
  }

  // funçao para editar o dado salvo

  void _edit(Dog dog) {
    setState(() {
      _editing = dog;
      _nomeCtrl.text = dog.nome;
      _notasCtrl.text = dog.notas.toString();
      _materiaCtrl.text = dog.materia;
    });
  }

  // Função para salvar o aluno

  Future<void> _save() async {
    final nome = _nomeCtrl.text.trim();
    final notasStr = _notasCtrl.text.trim();
    final materia = _materiaCtrl.text.trim();

    if (nome.isEmpty || notasStr.isEmpty) {
      _snack('Preencha nome, matéria e notas');
      return;
    }

    final notas = int.tryParse(notasStr);
    if (notas == null) {
      _snack('Precisa ser um numero inteiro');
      return;
    }

    if (_editing == null) {
      await _dao.insert(Dog(nome: nome, materia: materia, notas: notas));
      _snack('Aluno cadastrado');
    } else {
      await _dao.update(
          _editing!.copyWith(nome: nome, materia: materia, notas: notas));
      _snack('Aluno atualizado');
    }
    _clearForm(); // limpa os texteditcontroller
    _reload();
  }

  Future<void> _delete(int id) async {
    await _dao.delete(id);
    _snack('Aluno removido');
    _reload();
  }

  void _cancelEdit() {
    _clearForm();
    _snack('Edição cancelada');
  }

  void _snack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  void dispose() {
    _nomeCtrl.dispose(); // libera o estado das variaveis
    _notasCtrl.dispose();
    _materiaCtrl.dispose();
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = _editing != null;
    return Scaffold(
      appBar: AppBar(
        title: Text('Alunos - sqflite'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: TextField(
              controller: _searchCtrl,
              decoration: InputDecoration(
                  labelText: 'Busca por nome',
                  hintText: 'Ex: Rocky',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _searchCtrl.clear();
                      _reload();
                    },
                    tooltip: 'Limpar busca',
                    icon: Icon(Icons.clear),
                  )),
              onChanged: (_) => _reload(),
            ),
          ),

          // Formulario para por o nome do aluno
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _nomeCtrl,
                  decoration: InputDecoration(
                    labelText: 'Nome do Aluno',
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.next,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                controller: _materiaCtrl,
                  decoration: InputDecoration(
                    labelText: 'Materia',
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.next,
                ),
              SizedBox(
                height: 12,
              ),
              TextField(
                controller: _notasCtrl,
                decoration: InputDecoration(
                  labelText: 'Notas',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: _save,
                      icon: Icon(isEditing ? Icons.save : Icons.add),
                      label:
                          Text(isEditing ? 'Salvar alterações' : 'Adicionar'),
                    ),
                  ),
                  if (isEditing) ...[
                    const SizedBox(width: 8),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: _cancelEdit,
                        icon: const Icon(Icons.close),
                        label: const Text('Cancelar'),
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),

          const Divider(height: 0),
          // ===== Lista =====
          Expanded(
            child: FutureBuilder<List<Dog>>(
              future: _futureDogs,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Erro: ${snapshot.error}'));
                }

                final dogs = snapshot.data ?? [];
                if (dogs.isEmpty) {
                  return const Center(child: Text('Nenhum aluno encontrado.'));
                }

                return ListView.builder(
                  itemCount: dogs.length,
                  itemBuilder: (context, index) {
                    final dog = dogs[index];
                    return ListTile(
                      title: Text(dog.nome),
                      subtitle: Text('Notas: ${dog.notas}'),
                      leading:
                          CircleAvatar(child: Text((dog.id ?? 0).toString())),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            tooltip: 'Editar',
                            icon: const Icon(Icons.edit),
                            onPressed: () => _edit(dog),
                          ),
                          IconButton(
                            tooltip: 'Excluir',
                            icon: const Icon(Icons.delete),
                            onPressed: () => _delete(dog.id!),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
