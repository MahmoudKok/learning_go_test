import 'package:hive_ce/hive.dart';

import '../configs/hive_configs/hive_type_ids.dart';

part 'user_auth.g.dart';

@HiveType(typeId: HiveTypeIds.userAuth)
enum UserAuth {
  @HiveField(0)
  unauthorized,
  @HiveField(1)
  authorized,
}
