import 'package:flutter/material.dart';
import 'package:alquiler_autos/views/detalle.dart';
import 'package:alquiler_autos/views/menuDrawerPerfil.dart';

class MenuPrincipal extends StatelessWidget {
  final List<Map<String, dynamic>> autos;

  MenuPrincipal({super.key, required this.autos});

  final Color fondo = Color(0xFFAFDDFF);
  final Color encabezado = Color(0xFF60B5FF);
  final Color campos = Color(0xFFFFECDB);
  final Color boton = Color(0xFFFF9149);
  final Color texto = Color(0xFF222222);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fondo,
      drawer: MenuDrawerPerfil(),
      appBar: AppBar(
        title: const Text('Alquiler de vehiculos'),
        backgroundColor: encabezado,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              style: TextStyle(color: texto),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: encabezado),
                hintText: 'Buscar vehiculos...',
                hintStyle: TextStyle(color: texto.withOpacity(0.7)),
                filled: true,
                fillColor: campos,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
              readOnly: true,
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: autos.isEmpty
                  ? const Center(child: Text('No hay vehiculos para mostrar.'))
                  : ListView.builder(
                      itemCount: autos.length,
                      itemBuilder: (context, index) {
                        final auto = autos[index];

                        return ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              auto['imageUrl'].toString(),
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, StackTrace) {
                                return Image.network(
                                  'https://picsum.photos/330/200',
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          ),
                          title: Text(
                            '${auto['marca']} ${auto['modelo']}',
                            style: TextStyle(
                              color: texto,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text(
                            'año: ${auto['anio']} precio: \$${auto['precio']}',
                            style: TextStyle(color: texto.withOpacity(0.8)),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: encabezado,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetalleVehiculoScreen(
                                  imageUrl: auto['imageUrl'].toString(),
                                  marca: auto['marca'].toString(),
                                  modelo: auto['modelo'].toString(),
                                  anio: auto['anio'].toString(),
                                  disponibilidad: auto['disponibilidad']
                                      .toString(),
                                  precio: auto['precio'].toString(),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: boton,
        unselectedItemColor: texto.withOpacity(0.6),
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'Alquiler',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Usuario'),
        ],
      ),
    );
  }
}

/////
List<Map<String, dynamic>> autos = [
  {
    'imageUrl': 'https://picsum.photos/330/200',
    'marca': 'Toyota',
    'modelo': 'Corolla',
    'anio': 2022,
    'disponibilidad': 1,
    'precio': '\$99.99/dia',
  },
  {
    'imageUrl': 'https://picsum.photos/330/200',
    'marca': 'NIssan',
    'modelo': 'Sentra',
    'anio': 2021,
    'disponibilidad': 1,
    'precio': '\$89.99/dia',
  },
  {
    'imageUrl': 'https://picsum.photos/330/200',
    'marca': 'Ford',
    'modelo': 'Mustang',
    'anio': 2023,
    'disponibilidad': 0,
    'precio': '\$199.99/dia',
  },
  {
    'imageUrl': 'https://picsum.photos/330/200',
    'marca': 'Chevrolet',
    'modelo': 'Camaro',
    'anio': 2020,
    'disponibilidad': 1,
    'precio': '\$150.00/dia',
  },
  {
    'imageUrl': 'https://picsum.photos/330/200',
    'marca': 'Honda',
    'modelo': 'Civic',
    'anio': 2019,
    'disponibilidad': 1,
    'precio': '\$45.00/dia',
  },
  {
    'imageUrl': 'https://picsum.photos/330/200',
    'marca': 'Ford',
    'modelo': 'Focus',
    'anio': 2021,
    'disponibilidad': 1,
    'precio': '\$55.00/dia',
  },
  {
    'imageUrl': 'https://picsum.photos/330/200',
    'marca': 'Chevrolet',
    'modelo': 'Cruze',
    'anio': 2022,
    'disponibilidad': 1,
    'precio': '\$79.99/dia',
  },
  {
    'imageUrl': 'https://picsum.photos/330/200',
    'marca': 'Mazda',
    'modelo': 'CX-5',
    'anio': 2022,
    'disponibilidad': 1,
    'precio': '\$92.99/dia',
  },
  {
    'imageUrl': 'https://picsum.photos/330/200',
    'marca': 'Ford',
    'modelo': 'Explorer',
    'anio': 2021,
    'disponibilidad': 0,
    'precio': '\$110.99/dia',
  },
  {
    'imageUrl': 'https://picsum.photos/330/200',
    'marca': 'Kia',
    'modelo': 'Sportage',
    'anio': 2023,
    'disponibilidad': 1,
    'precio': '\$89.99/dia',
  },
  {
    'imageUrl': 'https://picsum.photos/330/200',
    'marca': 'Hyundai',
    'modelo': 'Tucson',
    'anio': 2022,
    'disponibilidad': 1,
    'precio': '\$87.99/dia',
  },
  {
    'imageUrl': 'https://picsum.photos/330/200',
    'marca': 'Volkswagen',
    'modelo': 'Jetta',
    'anio': 2022,
    'disponibilidad': 1,
    'precio': '\$78.99/dia',
  },
  {
    'imageUrl': 'https://picsum.photos/330/200',
    'marca': 'Renault',
    'modelo': 'Duster',
    'anio': 2023,
    'disponibilidad': 1,
    'precio': '\$76.99/dia',
  },
  {
    'imageUrl': 'https://picsum.photos/330/200',
    'marca': 'BMW',
    'modelo': 'Serie 3',
    'anio': 2022,
    'disponibilidad': 1,
    'precio': '\$145.99/dia',
  },
  {
    'imageUrl': 'https://picsum.photos/330/200',
    'marca': 'Mercedes-Benz',
    'modelo': 'Clase C',
    'anio': 2023,
    'disponibilidad': 0,
    'precio': '\$159.99/dia',
  },
  {
    'imageUrl': 'https://picsum.photos/330/200',
    'marca': 'Audi',
    'modelo': 'A4',
    'anio': 2021,
    'disponibilidad': 1,
    'precio': '\$139.99/dia',
  },
  {
    'imageUrl': 'https://picsum.photos/330/200',
    'marca': 'Jeep',
    'modelo': 'Compass',
    'anio': 2022,
    'disponibilidad': 1,
    'precio': '\$99.99/dia',
  },
  {
    'imageUrl': 'https://picsum.photos/330/200',
    'marca': 'Suzuki',
    'modelo': 'Vitara',
    'anio': 2023,
    'disponibilidad': 1,
    'precio': '\$81.99/dia',
  },
  {
    'imageUrl': 'https://picsum.photos/330/200',
    'marca': 'Subaru',
    'modelo': 'Forester',
    'anio': 2022,
    'disponibilidad': 0,
    'precio': '\$96.99/dia',
  },
];
