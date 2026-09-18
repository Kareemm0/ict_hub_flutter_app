import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ict_hub_flutter/core/local_storage/base_local_storage.dart';
import 'package:ict_hub_flutter/core/network/api/api_consumer.dart';
import 'package:ict_hub_flutter/core/network/api/endpoints.dart';
import 'package:ict_hub_flutter/data/data_source/abstarct/product_deatils_data_source.dart';
import 'package:ict_hub_flutter/data/data_source/impl/product_details_data_source_impl.dart';
import 'package:ict_hub_flutter/data/external/dio/dio_consumer.dart';
import 'package:ict_hub_flutter/data/external/dio/interceptor.dart';
import 'package:ict_hub_flutter/data/external/local_storage/shared_pref_impl.dart';
import 'package:ict_hub_flutter/data/repos/product_details_repo_impl.dart';
import 'package:ict_hub_flutter/domain/repos/product_details_repo.dart';
import 'package:ict_hub_flutter/presentation/cubit/products/product_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future initDependencies() async {
  await InjectionHelper.injectExternal();
  InjectionHelper.injectDatasources();
  InjectionHelper.injectRepos();
  InjectionHelper.injectBlocs();
}

abstract class InjectionHelper {
  static Future<void> injectExternal() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    getIt.registerFactory<BaseLocalStorage>(
      () => SharedPrefsLocalStorageImpl(preferences: sharedPreferences),
    );
    getIt.registerSingleton<Dio>(Dio());
    getIt.registerSingleton<AppInterceptors>(
      AppInterceptors(sharedPrefs: getIt()),
    );

    getIt.registerSingleton<ApiConsumer>(
      DioConsumer(
        baseUrl: Endpoints.baseUrl,
        client: getIt(),
        interceptors: [getIt<AppInterceptors>()],
      ),
    );
  }

  static void injectDatasources() {
    getIt.registerSingleton<ProductDeatilsDataSource>(
      ProductDetailsDataSourceImpl(dio: getIt<ApiConsumer>()),
    );
  }

  static void injectRepos() {
    getIt.registerSingleton<ProductDetailsRepo>(
      ProductDetailsRepoImpl(dataSource: getIt<ProductDeatilsDataSource>()),
    );
  }

  static void injectBlocs() {
    getIt.registerFactory<ProductCubit>(() {
      return ProductCubit(repo: getIt<ProductDetailsRepo>());
    });
  }
}
