import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HalamanUniversitas extends StatefulWidget {
  const HalamanUniversitas({super.key});

  @override
  _HalamanUniversitasState createState() => _HalamanUniversitasState();
}

class _HalamanUniversitasState extends State<HalamanUniversitas> {
  List _universitas = [];
  bool _isLoading = true;

  // Mengambil data universitas dari API
  Future<void> _fetchUniversitas() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.get(
        Uri.parse('http://universities.hipolabs.com/search?country=Indonesia'),
      );

      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        setState(() {
          _universitas = data;
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchUniversitas();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _universitas.length,
      itemBuilder: (context, index) {
        var universitas = _universitas[index];
        return _KartuUniversitas(universitas: universitas);
      },
    );
  }
}

// Widget untuk menampilkan kartu universitas
class _KartuUniversitas extends StatelessWidget {
  final dynamic universitas;

  const _KartuUniversitas({Key? key, required this.universitas})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: ListTile(
        title: Text(
          universitas['name'] ?? 'Nama tidak tersedia',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(universitas['country']),
        trailing: const Icon(Icons.school),
        onTap: () => _tampilkanDetailUniversitas(context, universitas),
      ),
    );
  }

  // Menampilkan detail universitas dalam dialog
  void _tampilkanDetailUniversitas(BuildContext context, dynamic universitas) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
        title: Text(universitas['name']),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Negara: ${universitas['country']}'),
            const SizedBox(height: 10),
            const Text('Website:'),
            for (var url in universitas['web_pages'])
              Text(url, style: const TextStyle(color: Colors.blue)),
          ],
        ),
        actions: [
          TextButton(
            child: const Text('Tutup'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
