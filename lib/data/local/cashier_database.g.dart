// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashier_database.dart';

// ignore_for_file: type=lint
class $AdminsTable extends Admins with TableInfo<$AdminsTable, AdminEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AdminsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _namaMeta = const VerificationMeta('nama');
  @override
  late final GeneratedColumn<String> nama =
      GeneratedColumn<String>('nama', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
            minTextLength: 3,
          ),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password =
      GeneratedColumn<String>('password', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
            minTextLength: 8,
          ),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, nama, email, password];
  @override
  String get aliasedName => _alias ?? 'admins';
  @override
  String get actualTableName => 'admins';
  @override
  VerificationContext validateIntegrity(Insertable<AdminEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nama')) {
      context.handle(
          _namaMeta, nama.isAcceptableOrUnknown(data['nama']!, _namaMeta));
    } else if (isInserting) {
      context.missing(_namaMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AdminEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AdminEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      nama: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nama'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
    );
  }

  @override
  $AdminsTable createAlias(String alias) {
    return $AdminsTable(attachedDatabase, alias);
  }
}

class AdminEntity extends DataClass implements Insertable<AdminEntity> {
  final int id;
  final String nama;
  final String email;
  final String password;
  const AdminEntity(
      {required this.id,
      required this.nama,
      required this.email,
      required this.password});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nama'] = Variable<String>(nama);
    map['email'] = Variable<String>(email);
    map['password'] = Variable<String>(password);
    return map;
  }

  AdminsCompanion toCompanion(bool nullToAbsent) {
    return AdminsCompanion(
      id: Value(id),
      nama: Value(nama),
      email: Value(email),
      password: Value(password),
    );
  }

  factory AdminEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AdminEntity(
      id: serializer.fromJson<int>(json['id']),
      nama: serializer.fromJson<String>(json['nama']),
      email: serializer.fromJson<String>(json['email']),
      password: serializer.fromJson<String>(json['password']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nama': serializer.toJson<String>(nama),
      'email': serializer.toJson<String>(email),
      'password': serializer.toJson<String>(password),
    };
  }

  AdminEntity copyWith(
          {int? id, String? nama, String? email, String? password}) =>
      AdminEntity(
        id: id ?? this.id,
        nama: nama ?? this.nama,
        email: email ?? this.email,
        password: password ?? this.password,
      );
  @override
  String toString() {
    return (StringBuffer('AdminEntity(')
          ..write('id: $id, ')
          ..write('nama: $nama, ')
          ..write('email: $email, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nama, email, password);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AdminEntity &&
          other.id == this.id &&
          other.nama == this.nama &&
          other.email == this.email &&
          other.password == this.password);
}

class AdminsCompanion extends UpdateCompanion<AdminEntity> {
  final Value<int> id;
  final Value<String> nama;
  final Value<String> email;
  final Value<String> password;
  const AdminsCompanion({
    this.id = const Value.absent(),
    this.nama = const Value.absent(),
    this.email = const Value.absent(),
    this.password = const Value.absent(),
  });
  AdminsCompanion.insert({
    this.id = const Value.absent(),
    required String nama,
    required String email,
    required String password,
  })  : nama = Value(nama),
        email = Value(email),
        password = Value(password);
  static Insertable<AdminEntity> custom({
    Expression<int>? id,
    Expression<String>? nama,
    Expression<String>? email,
    Expression<String>? password,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nama != null) 'nama': nama,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
    });
  }

  AdminsCompanion copyWith(
      {Value<int>? id,
      Value<String>? nama,
      Value<String>? email,
      Value<String>? password}) {
    return AdminsCompanion(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nama.present) {
      map['nama'] = Variable<String>(nama.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AdminsCompanion(')
          ..write('id: $id, ')
          ..write('nama: $nama, ')
          ..write('email: $email, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }
}

class $MenusTable extends Menus with TableInfo<$MenusTable, MenuEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MenusTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idAdminMeta =
      const VerificationMeta('idAdmin');
  @override
  late final GeneratedColumn<int> idAdmin = GeneratedColumn<int>(
      'id_admin', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _namaMeta = const VerificationMeta('nama');
  @override
  late final GeneratedColumn<String> nama =
      GeneratedColumn<String>('nama', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
            minTextLength: 3,
          ),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _hargaMeta = const VerificationMeta('harga');
  @override
  late final GeneratedColumn<double> harga = GeneratedColumn<double>(
      'harga', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _stockMeta = const VerificationMeta('stock');
  @override
  late final GeneratedColumn<int> stock = GeneratedColumn<int>(
      'stock', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, idAdmin, nama, description, harga, stock];
  @override
  String get aliasedName => _alias ?? 'menus';
  @override
  String get actualTableName => 'menus';
  @override
  VerificationContext validateIntegrity(Insertable<MenuEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_admin')) {
      context.handle(_idAdminMeta,
          idAdmin.isAcceptableOrUnknown(data['id_admin']!, _idAdminMeta));
    } else if (isInserting) {
      context.missing(_idAdminMeta);
    }
    if (data.containsKey('nama')) {
      context.handle(
          _namaMeta, nama.isAcceptableOrUnknown(data['nama']!, _namaMeta));
    } else if (isInserting) {
      context.missing(_namaMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('harga')) {
      context.handle(
          _hargaMeta, harga.isAcceptableOrUnknown(data['harga']!, _hargaMeta));
    } else if (isInserting) {
      context.missing(_hargaMeta);
    }
    if (data.containsKey('stock')) {
      context.handle(
          _stockMeta, stock.isAcceptableOrUnknown(data['stock']!, _stockMeta));
    } else if (isInserting) {
      context.missing(_stockMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MenuEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MenuEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      idAdmin: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_admin'])!,
      nama: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nama'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      harga: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}harga'])!,
      stock: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}stock'])!,
    );
  }

  @override
  $MenusTable createAlias(String alias) {
    return $MenusTable(attachedDatabase, alias);
  }
}

class MenuEntity extends DataClass implements Insertable<MenuEntity> {
  final int id;
  final int idAdmin;
  final String nama;
  final String? description;
  final double harga;
  final int stock;
  const MenuEntity(
      {required this.id,
      required this.idAdmin,
      required this.nama,
      this.description,
      required this.harga,
      required this.stock});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_admin'] = Variable<int>(idAdmin);
    map['nama'] = Variable<String>(nama);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['harga'] = Variable<double>(harga);
    map['stock'] = Variable<int>(stock);
    return map;
  }

  MenusCompanion toCompanion(bool nullToAbsent) {
    return MenusCompanion(
      id: Value(id),
      idAdmin: Value(idAdmin),
      nama: Value(nama),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      harga: Value(harga),
      stock: Value(stock),
    );
  }

  factory MenuEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MenuEntity(
      id: serializer.fromJson<int>(json['id']),
      idAdmin: serializer.fromJson<int>(json['idAdmin']),
      nama: serializer.fromJson<String>(json['nama']),
      description: serializer.fromJson<String?>(json['description']),
      harga: serializer.fromJson<double>(json['harga']),
      stock: serializer.fromJson<int>(json['stock']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idAdmin': serializer.toJson<int>(idAdmin),
      'nama': serializer.toJson<String>(nama),
      'description': serializer.toJson<String?>(description),
      'harga': serializer.toJson<double>(harga),
      'stock': serializer.toJson<int>(stock),
    };
  }

  MenuEntity copyWith(
          {int? id,
          int? idAdmin,
          String? nama,
          Value<String?> description = const Value.absent(),
          double? harga,
          int? stock}) =>
      MenuEntity(
        id: id ?? this.id,
        idAdmin: idAdmin ?? this.idAdmin,
        nama: nama ?? this.nama,
        description: description.present ? description.value : this.description,
        harga: harga ?? this.harga,
        stock: stock ?? this.stock,
      );
  @override
  String toString() {
    return (StringBuffer('MenuEntity(')
          ..write('id: $id, ')
          ..write('idAdmin: $idAdmin, ')
          ..write('nama: $nama, ')
          ..write('description: $description, ')
          ..write('harga: $harga, ')
          ..write('stock: $stock')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, idAdmin, nama, description, harga, stock);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MenuEntity &&
          other.id == this.id &&
          other.idAdmin == this.idAdmin &&
          other.nama == this.nama &&
          other.description == this.description &&
          other.harga == this.harga &&
          other.stock == this.stock);
}

class MenusCompanion extends UpdateCompanion<MenuEntity> {
  final Value<int> id;
  final Value<int> idAdmin;
  final Value<String> nama;
  final Value<String?> description;
  final Value<double> harga;
  final Value<int> stock;
  const MenusCompanion({
    this.id = const Value.absent(),
    this.idAdmin = const Value.absent(),
    this.nama = const Value.absent(),
    this.description = const Value.absent(),
    this.harga = const Value.absent(),
    this.stock = const Value.absent(),
  });
  MenusCompanion.insert({
    this.id = const Value.absent(),
    required int idAdmin,
    required String nama,
    this.description = const Value.absent(),
    required double harga,
    required int stock,
  })  : idAdmin = Value(idAdmin),
        nama = Value(nama),
        harga = Value(harga),
        stock = Value(stock);
  static Insertable<MenuEntity> custom({
    Expression<int>? id,
    Expression<int>? idAdmin,
    Expression<String>? nama,
    Expression<String>? description,
    Expression<double>? harga,
    Expression<int>? stock,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idAdmin != null) 'id_admin': idAdmin,
      if (nama != null) 'nama': nama,
      if (description != null) 'description': description,
      if (harga != null) 'harga': harga,
      if (stock != null) 'stock': stock,
    });
  }

  MenusCompanion copyWith(
      {Value<int>? id,
      Value<int>? idAdmin,
      Value<String>? nama,
      Value<String?>? description,
      Value<double>? harga,
      Value<int>? stock}) {
    return MenusCompanion(
      id: id ?? this.id,
      idAdmin: idAdmin ?? this.idAdmin,
      nama: nama ?? this.nama,
      description: description ?? this.description,
      harga: harga ?? this.harga,
      stock: stock ?? this.stock,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idAdmin.present) {
      map['id_admin'] = Variable<int>(idAdmin.value);
    }
    if (nama.present) {
      map['nama'] = Variable<String>(nama.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (harga.present) {
      map['harga'] = Variable<double>(harga.value);
    }
    if (stock.present) {
      map['stock'] = Variable<int>(stock.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MenusCompanion(')
          ..write('id: $id, ')
          ..write('idAdmin: $idAdmin, ')
          ..write('nama: $nama, ')
          ..write('description: $description, ')
          ..write('harga: $harga, ')
          ..write('stock: $stock')
          ..write(')'))
        .toString();
  }
}

abstract class _$CashierDatabase extends GeneratedDatabase {
  _$CashierDatabase(QueryExecutor e) : super(e);
  late final $AdminsTable admins = $AdminsTable(this);
  late final $MenusTable menus = $MenusTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [admins, menus];
}
