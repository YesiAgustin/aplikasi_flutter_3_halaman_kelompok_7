import 'package:flutter/material.dart';

class HalamanProfile extends StatelessWidget {
  const HalamanProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final anggota = [
      {
        'nama': 'Yesi Agustin',
        'ttl': 'Bogor, 14 Agustus 2003',
        'alamat': 'Desa Bantar Jati, Kab. Bogor',
        'foto': 'assets/images/anggota1.png',
      },
      {
        'nama': 'Daiva Baskoro Upangga',
        'ttl': 'Bekasi, 29 Agustus 2004',
        'alamat': 'Taman Wisma Asri, Bekasi',
        'foto': 'assets/images/anggota2.png',
      },
      {
        'nama': 'Angelina Simbolon',
        'ttl': 'Jakarta, 16 Juni, 2004',
        'alamat': 'Jalan Menteng Atas Barat, Jakarta Selatan',
        'foto': 'assets/images/anggota3.png',
      },
    ];

    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children:
        anggota.map((anggota) {
          return Card(
            margin: EdgeInsets.only(bottom: 20),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      anggota['foto']!,
                      width: 100,
                      height: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nama:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(anggota['nama']!),
                        SizedBox(height: 8),
                        Text(
                          'Tempat, Tanggal Lahir:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(anggota['ttl']!),
                        SizedBox(height: 8),
                        Text(
                          'Alamat:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(anggota['alamat']!),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
