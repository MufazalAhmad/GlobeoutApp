import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:globout/features/settings/data/source/firebase/settings_firebase_datasource.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../../../domain/usecases/create_report.dart';

@LazySingleton(as: SettingsFirebaseDataSource)
class SettingsFirebaseDataSourceImpl implements SettingsFirebaseDataSource {
  final Logger _logger;

  SettingsFirebaseDataSourceImpl({
    required Logger logger,
  }) : _logger = logger;

  @override
  Future<CreateReportUsecaseOutput> createReport(
      CreateReportUsecaseInput input) async {
    final reportsCollection = FirebaseFirestore.instance.collection('reports');

    try {
      await reportsCollection.add({
        'userId': input.userId,
        'description': input.description,
        'timestamp': DateTime.now().toString(),
      });

      _logger.i("Report submitted successfully");
    } catch (e) {
      _logger.e("Error while submitting report: $e");
    }

    return CreateReportUsecaseOutput();
  }
}
