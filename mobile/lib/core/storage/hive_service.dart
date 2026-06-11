import 'dart:convert';
import 'package:hive_ce_flutter/hive_flutter.dart';
import '../constants/hive_constants.dart';

/// Generic Hive-backed cache. Each entity is stored as a JSON string
/// keyed by its id, inside one box per entity type. This avoids needing
/// per-model Hive type adapters while still giving fast offline reads.
class HiveService {
  static Future<void> init() async {
    await Hive.initFlutter();
    await Future.wait([
      Hive.openBox<String>(HiveBoxes.projects),
      Hive.openBox<String>(HiveBoxes.expenses),
      Hive.openBox<String>(HiveBoxes.reports),
      Hive.openBox<String>(HiveBoxes.pendingSync),
    ]);
  }

  Box<String> _box(String name) => Hive.box<String>(name);

  /// Replaces the entire contents of [boxName] with [items], keyed by [keyOf].
  Future<void> replaceAll(String boxName, List<Map<String, dynamic>> items, String Function(Map<String, dynamic>) keyOf) async {
    final box = _box(boxName);
    await box.clear();
    final entries = {for (final item in items) keyOf(item): jsonEncode(item)};
    await box.putAll(entries);
  }

  Future<void> put(String boxName, String key, Map<String, dynamic> value) async {
    await _box(boxName).put(key, jsonEncode(value));
  }

  Future<void> delete(String boxName, String key) async {
    await _box(boxName).delete(key);
  }

  List<Map<String, dynamic>> getAll(String boxName) {
    final box = _box(boxName);
    return box.values.map((raw) => jsonDecode(raw) as Map<String, dynamic>).toList();
  }

  Map<String, dynamic>? get(String boxName, String key) {
    final raw = _box(boxName).get(key);
    if (raw == null) return null;
    return jsonDecode(raw) as Map<String, dynamic>;
  }

  /// Queues a write operation (create/update/delete) to be synced when back online.
  Future<void> queuePendingSync({
    required String entityType,
    required String operation,
    required Map<String, dynamic> payload,
  }) async {
    final box = _box(HiveBoxes.pendingSync);
    final id = '${entityType}_${operation}_${DateTime.now().microsecondsSinceEpoch}';
    await box.put(id, jsonEncode({
      'entityType': entityType,
      'operation': operation,
      'payload': payload,
      'queuedAt': DateTime.now().toIso8601String(),
    }));
  }

  List<MapEntry<String, Map<String, dynamic>>> getPendingSyncItems() {
    final box = _box(HiveBoxes.pendingSync);
    return box.keys
        .map((key) => MapEntry(key as String, jsonDecode(box.get(key)!) as Map<String, dynamic>))
        .toList();
  }

  Future<void> removePendingSyncItem(String key) async {
    await _box(HiveBoxes.pendingSync).delete(key);
  }
}
