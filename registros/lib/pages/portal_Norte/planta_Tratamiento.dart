import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/template/menus.dart';

class PlantaTratamientoPage extends StatefulWidget {
  const PlantaTratamientoPage({Key? key}) : super(key: key);

  @override
  State<PlantaTratamientoPage> createState() => _PlantaTratamientoPageState();
}

class _PlantaTratamientoPageState extends State<PlantaTratamientoPage> {
  // Controladores principales
  final TextEditingController _alimentaDesdeController =
      TextEditingController();
  final TextEditingController _piscinaController = TextEditingController();
  final TextEditingController _tanque1Controller = TextEditingController();
  final TextEditingController _tanque2Controller = TextEditingController();
  final TextEditingController _tanque5Controller = TextEditingController();
  final TextEditingController _torqueController = TextEditingController();
  final TextEditingController _alturaRastraController = TextEditingController();
  final TextEditingController _observacionesController =
      TextEditingController();

  // Variables para radio buttons
  String _reguladorAlcalinoSeleccionado = '';
  String _floculanteSeleccionado = '';

  // Controladores adicionales para validación
  final Map<String, TextEditingController> _controllers = {};

  @override
  void initState() {
    super.initState();
    // Inicializar controladores adicionales
    _initializeControllers();
  }

  void _initializeControllers() {
    // Alimentación
    _controllers['flujo'] = TextEditingController();
    _controllers['flujometFinalTurno'] = TextEditingController();
    _controllers['pH'] = TextEditingController();
    _controllers['tss'] = TextEditingController();
    _controllers['turbilez'] = TextEditingController();

    // Underflow
    _controllers['trenOperativo'] = TextEditingController();
    _controllers['porcentajeVelocidadBomba'] = TextEditingController();
    _controllers['recirculacion'] = TextEditingController();
    _controllers['descarga'] = TextEditingController();
    _controllers['solidoDescargar'] = TextEditingController();
    _controllers['tiempoDescargando'] = TextEditingController();
    _controllers['solidoFinTurno'] = TextEditingController();
    _controllers['fcv528'] = TextEditingController();

    // Análisis Tanque 4
    _controllers['tssTanque4'] = TextEditingController();
    _controllers['turblezTanque4'] = TextEditingController();

    // Descarga
    _controllers['alRio'] = TextEditingController();
    _controllers['acopioRS005'] = TextEditingController();
    _controllers['flujometDescarga'] = TextEditingController();
    _controllers['pHDescarga'] = TextEditingController();
    _controllers['tssDescarga'] = TextEditingController();
    _controllers['turblezDescarga'] = TextEditingController();

    // Regulador Alcalino
    _controllers['nivelSilo'] = TextEditingController();
    _controllers['transferenciaConsumo1'] = TextEditingController();
    _controllers['nivelTK'] = TextEditingController();
    _controllers['bombaOperativa1'] = TextEditingController();
    _controllers['flujo1'] = TextEditingController();
    _controllers['velocidad1'] = TextEditingController();
    _controllers['nivelTolva'] = TextEditingController();
    _controllers['transferenciaConsumo2'] = TextEditingController();
    _controllers['bombaOperativa2'] = TextEditingController();
    _controllers['flujo2'] = TextEditingController();
    _controllers['velocidad2'] = TextEditingController();
    _controllers['nivelIBC'] = TextEditingController();
    _controllers['transferenciaConsumo3'] = TextEditingController();

    // Floculante
    _controllers['bombaOperativaFloculante'] = TextEditingController();
    _controllers['flujoFloculante'] = TextEditingController();
    _controllers['velocidadFloculante'] = TextEditingController();

    // Ácido
    _controllers['bombaOperativaAcido'] = TextEditingController();
    _controllers['dosificacionTNK001'] = TextEditingController();
    _controllers['dosificacionTNK005'] = TextEditingController();
    _controllers['flujoAcido'] = TextEditingController();
    _controllers['velocidadAcido'] = TextEditingController();

    // Coagulante
    _controllers['feClTransferencia'] = TextEditingController();
    _controllers['feClFlujo'] = TextEditingController();
    _controllers['caClOTransferencia'] = TextEditingController();
    _controllers['caClOFlujo'] = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppMenuDrawer(selectedPage: "Planta de Tratamiento"),
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Text('Planta de Tratamiento'),
        leading: Builder(
          builder:
              (context) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Título principal
            _buildMainHeader(),
            const SizedBox(height: 16),

            // Página número
            _buildPageNumber(),
            const SizedBox(height: 16),

            // Tabla 1: Alimentación desde
            _buildAlimentacionTable(),
            const SizedBox(height: 16),

            // Tabla 2: Proceso (Tanques)
            _buildProcesoTable(),
            const SizedBox(height: 16),

            // Tabla 3: Clarificador
            _buildClarificadorTable(),
            const SizedBox(height: 16),

            // Tabla 4: Underflow
            _buildUnderflowTable(),
            const SizedBox(height: 16),

            // Tabla 5: Análisis Tanque 4
            _buildAnalisisTanque4Table(),
            const SizedBox(height: 16),

            // Tabla 6: Descarga
            _buildDescargaTable(),
            const SizedBox(height: 16),

            // Tabla 7: Reactivos - Regulador Alcalino
            _buildReguladorAlcalinoTable(),
            const SizedBox(height: 16),

            // Tabla 8: Reactivos - Floculante
            _buildFloculanteTable(),
            const SizedBox(height: 16),

            // Tabla 9: Reactivos - Ácido
            _buildAcidoTable(),
            const SizedBox(height: 16),

            // Tabla 10: Coagulante y Cloro
            _buildCoagulanteTable(),
            const SizedBox(height: 16),

            // Tabla 11: Observaciones
            _buildObservacionesTable(),
            const SizedBox(height: 24),

            // Botón centrado al final
            _buildSubmitButton(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildMainHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Text(
        'Planta Tratamiento de Agua',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildPageNumber() {
    return Container(
      width: 80,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Text(
        '3640',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildAlimentacionTable() {
    return Card(
      elevation: 2,
      child: Column(
        children: [
          _buildTableHeader('Alimentación desde'),
          _buildSpecialInputRow('Alimenta Desde', _alimentaDesdeController),
          _buildInputRowWithController('Flujo', _controllers['flujo']!, 'm³/h'),
          _buildInputRowWithController(
            'Flujómet. Final Turno',
            _controllers['flujometFinalTurno']!,
            'm³',
          ),
          _buildInputRowWithController('pH', _controllers['pH']!, ''),
          _buildInputRowWithController('TSS', _controllers['tss']!, 'mg/lit'),
          _buildInputRowWithController(
            'Turbilez',
            _controllers['turbilez']!,
            'FAU',
          ),
        ],
      ),
    );
  }

  Widget _buildProcesoTable() {
    return Card(
      elevation: 2,
      child: Column(
        children: [
          _buildTableHeader('PROCESO - pH en Tanques'),
          _buildEditableRow('Tanque 1', _tanque1Controller),
          _buildEditableRow('Tanque 2', _tanque2Controller),
          _buildStaticRow('Clarificador', 'Activo'),
          _buildEditableRow('Tanque 5', _tanque5Controller),
        ],
      ),
    );
  }

  Widget _buildClarificadorTable() {
    return Card(
      elevation: 2,
      child: Column(
        children: [
          _buildTableHeader('Clarificador'),
          _buildSpecialInputRow('Torque', _torqueController),
          _buildSpecialInputRow(
            'Altura rastra',
            _alturaRastraController,
            unit: '%',
          ),
        ],
      ),
    );
  }

  Widget _buildUnderflowTable() {
    return Card(
      elevation: 2,
      child: Column(
        children: [
          _buildTableHeader('Underflow'),
          _buildInputRowWithController(
            'Tren operativo',
            _controllers['trenOperativo']!,
            '',
          ),
          _buildInputRowWithController(
            'Porcentaje Velocidad Bomba',
            _controllers['porcentajeVelocidadBomba']!,
            '%',
          ),
          _buildInputRowWithController(
            'Recirculación',
            _controllers['recirculacion']!,
            'm³/h',
          ),
          _buildInputRowWithController(
            'Descarga',
            _controllers['descarga']!,
            'm³/h',
          ),
          _buildInputRowWithController(
            '% sólido al descargar',
            _controllers['solidoDescargar']!,
            '%',
          ),
          _buildInputRowWithController(
            'Tiempo descargando',
            _controllers['tiempoDescargando']!,
            'h',
          ),
          _buildInputRowWithController(
            '% sólido fin del turno',
            _controllers['solidoFinTurno']!,
            '%',
          ),
          _buildInputRowWithController(
            'FCV-528 (Abierto)',
            _controllers['fcv528']!,
            '%',
          ),
        ],
      ),
    );
  }

  Widget _buildAnalisisTanque4Table() {
    return Card(
      elevation: 2,
      child: Column(
        children: [
          _buildTableHeader('Análisis de agua Tanque 4'),
          _buildInputRowWithController(
            'TSS',
            _controllers['tssTanque4']!,
            'mg/lit',
          ),
          _buildInputRowWithController(
            'Turbilez',
            _controllers['turblezTanque4']!,
            'FAU',
          ),
        ],
      ),
    );
  }

  Widget _buildDescargaTable() {
    return Card(
      elevation: 2,
      child: Column(
        children: [
          _buildTableHeader('Descarga'),
          _buildInputRowWithController(
            'Al Río',
            _controllers['alRio']!,
            'm³/h',
          ),
          _buildInputRowWithController(
            'Acopio RS-005',
            _controllers['acopioRS005']!,
            'm³/h',
          ),
          _buildInputRowWithController(
            'Flujómet. Final Turno',
            _controllers['flujometDescarga']!,
            'm³',
          ),
          _buildInputRowWithController('pH', _controllers['pHDescarga']!, ''),
          _buildInputRowWithController(
            'TSS',
            _controllers['tssDescarga']!,
            'mg/lit',
          ),
          _buildInputRowWithController(
            'Turbilez',
            _controllers['turblezDescarga']!,
            'FAU',
          ),
        ],
      ),
    );
  }

  Widget _buildReguladorAlcalinoTable() {
    return Card(
      elevation: 2,
      child: Column(
        children: [
          _buildTableHeader('REGULADOR ALCALINO'),
          _buildRadioButtonRow(
            'Seleccionar tipo:',
            _reguladorAlcalinoSeleccionado,
            ['Ca(OH)₂ - Hidróxido de Ca', 'CaCO₃ - Mixture C.'],
            (value) => setState(() => _reguladorAlcalinoSeleccionado = value!),
          ),
          _buildInputRowWithController(
            'Nivel Silo',
            _controllers['nivelSilo']!,
            '%',
          ),
          _buildInputRowWithController(
            'Transferencia (Consumo)',
            _controllers['transferenciaConsumo1']!,
            'Kg',
          ),
          _buildInputRowWithController(
            'Nivel TK',
            _controllers['nivelTK']!,
            '%',
          ),
          _buildInputRowWithController(
            'Bomba operativa TAG',
            _controllers['bombaOperativa1']!,
            '',
          ),
          _buildInputRowWithController(
            'Flujo',
            _controllers['flujo1']!,
            'm³/h',
          ),
          _buildInputRowWithController(
            'Velocidad',
            _controllers['velocidad1']!,
            '%',
          ),
          _buildInputRowWithController(
            'Nivel Tolva',
            _controllers['nivelTolva']!,
            '%',
          ),
          _buildInputRowWithController(
            'Transferencia (Consumo)',
            _controllers['transferenciaConsumo2']!,
            'Kg',
          ),
          _buildInputRowWithController(
            'Bomba operativa TAG',
            _controllers['bombaOperativa2']!,
            '',
          ),
          _buildInputRowWithController(
            'Flujo',
            _controllers['flujo2']!,
            'lit/h',
          ),
          _buildInputRowWithController(
            'Velocidad',
            _controllers['velocidad2']!,
            '%',
          ),
          _buildInputRowWithController(
            'Nivel IBC',
            _controllers['nivelIBC']!,
            '%',
          ),
          _buildInputRowWithController(
            'Transferencia (Consumo)',
            _controllers['transferenciaConsumo3']!,
            'Kg',
          ),
        ],
      ),
    );
  }

  Widget _buildFloculanteTable() {
    return Card(
      elevation: 2,
      child: Column(
        children: [
          _buildTableHeader('FLOCULANTE\nPolímeros'),
          _buildRadioButtonRow(
            'Seleccionar tipo:',
            _floculanteSeleccionado,
            ['Aniónico', 'Catiónico'],
            (value) => setState(() => _floculanteSeleccionado = value!),
          ),
          _buildInputRowWithController(
            'Bomba operativa TAG',
            _controllers['bombaOperativaFloculante']!,
            '',
          ),
          _buildInputRowWithController(
            'Flujo',
            _controllers['flujoFloculante']!,
            'lit/h',
          ),
          _buildInputRowWithController(
            'Velocidad',
            _controllers['velocidadFloculante']!,
            '%',
          ),
        ],
      ),
    );
  }

  Widget _buildAcidoTable() {
    return Card(
      elevation: 2,
      child: Column(
        children: [
          _buildTableHeader('ÁCIDO'),
          _buildInputRowWithController(
            'Bomba operativa TAG',
            _controllers['bombaOperativaAcido']!,
            '',
          ),
          _buildInputRowWithController(
            'Dosificación TNK-001',
            _controllers['dosificacionTNK001']!,
            '',
          ),
          _buildInputRowWithController(
            'Dosificación TNK-005',
            _controllers['dosificacionTNK005']!,
            '',
          ),
          _buildInputRowWithController(
            'Flujo',
            _controllers['flujoAcido']!,
            'lit/h',
          ),
          _buildInputRowWithController(
            'Velocidad',
            _controllers['velocidadAcido']!,
            '%',
          ),
        ],
      ),
    );
  }

  Widget _buildCoagulanteTable() {
    return Card(
      elevation: 2,
      child: Column(
        children: [
          _buildTableHeader('Coagulante y Cloro'),
          _buildDoubleInputRowWithController(
            'FeCl₃',
            'Transferencia (Consumo)',
            'Kg',
            _controllers['feClTransferencia']!,
            'Flujo',
            'lit/min',
            _controllers['feClFlujo']!,
          ),
          _buildDoubleInputRowWithController(
            'Ca(ClO)₂',
            'Transferencia (Consumo)',
            'Kg',
            _controllers['caClOTransferencia']!,
            'Flujo',
            'lit/min',
            _controllers['caClOFlujo']!,
          ),
        ],
      ),
    );
  }

  Widget _buildObservacionesTable() {
    return Card(
      elevation: 2,
      child: Column(
        children: [
          _buildTableHeader('Observaciones'),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _observacionesController,
              maxLines: 4,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Escriba sus observaciones aquí...',
                contentPadding: EdgeInsets.all(12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (_validarCampos()) {
            _guardarDatos();
          } else {
            _mostrarErrorValidacion();
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[700],
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: const Text(
          'GUARDAR DATOS',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // Métodos auxiliares para construir elementos
  Widget _buildTableHeader(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildInputRow(String label, String unit) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 1,
            child: TextField(
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
                isDense: true,
              ),
            ),
          ),
          if (unit.isNotEmpty) ...[
            const SizedBox(width: 8),
            SizedBox(
              width: 50,
              child: Text(
                unit,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInputRowWithController(
    String label,
    TextEditingController controller,
    String unit,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 1,
            child: TextField(
              controller: controller,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
                isDense: true,
              ),
            ),
          ),
          if (unit.isNotEmpty) ...[
            const SizedBox(width: 8),
            SizedBox(
              width: 50,
              child: Text(
                unit,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSpecialInputRow(
    String label,
    TextEditingController controller, {
    String unit = '',
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 1,
            child: TextField(
              controller: controller,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
                isDense: true,
              ),
            ),
          ),
          if (unit.isNotEmpty) ...[
            const SizedBox(width: 8),
            SizedBox(
              width: 50,
              child: Text(
                unit,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildEditableRow(String label, TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            width: 80,
            child: TextField(
              controller: controller,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
                isDense: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStaticRow(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            width: 80,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.yellow[200],
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              value,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRadioButtonRow(
    String label,
    String selectedValue,
    List<String> options,
    Function(String?) onChanged,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          ...options.map(
            (option) => RadioListTile<String>(
              title: Text(option, style: const TextStyle(fontSize: 12)),
              value: option,
              groupValue: selectedValue,
              onChanged: onChanged,
              dense: true,
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDoubleInputRowWithController(
    String chemical,
    String label1,
    String unit1,
    TextEditingController controller1,
    String label2,
    String unit2,
    TextEditingController controller2,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            chemical,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(label1, style: const TextStyle(fontSize: 12)),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controller1,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 12),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 4,
                              ),
                              isDense: true,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(unit1, style: const TextStyle(fontSize: 10)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(label2, style: const TextStyle(fontSize: 12)),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controller2,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 12),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 4,
                              ),
                              isDense: true,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(unit2, style: const TextStyle(fontSize: 10)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  bool _validarCampos() {
    // Validar campos obligatorios
    List<String> camposObligatorios = [
      'Alimenta Desde',
      'Tanque 1',
      'Tanque 2',
      'Tanque 5',
      'Torque',
      'Altura rastra',
      'Regulador Alcalino',
      'Floculante',
    ];

    // Verificar controladores principales
    if (_alimentaDesdeController.text.trim().isEmpty) {
      return false;
    }

    if (_tanque1Controller.text.trim().isEmpty) {
      return false;
    }

    if (_tanque2Controller.text.trim().isEmpty) {
      return false;
    }

    if (_tanque5Controller.text.trim().isEmpty) {
      return false;
    }

    if (_torqueController.text.trim().isEmpty) {
      return false;
    }

    if (_alturaRastraController.text.trim().isEmpty) {
      return false;
    }

    // Verificar selección de radio buttons
    if (_reguladorAlcalinoSeleccionado.isEmpty) {
      return false;
    }

    if (_floculanteSeleccionado.isEmpty) {
      return false;
    }

    // Verificar algunos campos críticos adicionales
    List<String> camposCriticos = [
      'flujo',
      'pH',
      'tss',
      'trenOperativo',
      'alRio',
      'bombaOperativaFloculante',
    ];

    for (String campo in camposCriticos) {
      if (_controllers[campo]?.text.trim().isEmpty ?? true) {
        return false;
      }
    }

    return true;
  }

  void _mostrarErrorValidacion() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Campos Incompletos'),
          content: const Text(
            'Por favor, complete todos los campos obligatorios antes de guardar:\n\n'
            '• Alimenta Desde\n'
            '• pH en Tanques (1, 2, 5)\n'
            '• Torque y Altura rastra\n'
            '• Selección de Regulador Alcalino\n'
            '• Selección de Floculante\n'
            '• Campos críticos del proceso',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _guardarDatos() {
    // Aquí puedes implementar la lógica para guardar los datos
    // Por ejemplo, validar campos, enviar a una API, guardar en base de datos local, etc.

    // Ejemplo de cómo acceder a los datos:
    Map<String, dynamic> datosFormulario = {
      'alimentaDesde': _alimentaDesdeController.text,
      'tanque1': _tanque1Controller.text,
      'tanque2': _tanque2Controller.text,
      'tanque5': _tanque5Controller.text,
      'torque': _torqueController.text,
      'alturaRastra': _alturaRastraController.text,
      'reguladorAlcalino': _reguladorAlcalinoSeleccionado,
      'floculante': _floculanteSeleccionado,
      'observaciones': _observacionesController.text,
      // Agregar todos los demás campos según sea necesario
    };

    // Agregar datos de todos los controladores
    _controllers.forEach((key, controller) {
      datosFormulario[key] = controller.text;
    });

    // Aquí puedes procesar los datos (enviar a API, guardar en BD, etc.)
    print('Datos a guardar: $datosFormulario');

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Datos Guardados'),
          content: const Text('Los datos se han guardado exitosamente.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _alimentaDesdeController.dispose();
    _piscinaController.dispose();
    _tanque1Controller.dispose();
    _tanque2Controller.dispose();
    _tanque5Controller.dispose();
    _torqueController.dispose();
    _alturaRastraController.dispose();
    _observacionesController.dispose();

    // Limpiar todos los controladores adicionales
    _controllers.forEach((key, controller) {
      controller.dispose();
    });

    super.dispose();
  }
}
