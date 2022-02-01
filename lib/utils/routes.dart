import 'package:career_app/view/earning_deduction_view.dart';
import 'package:career_app/view/loan_simulator_view.dart';
import 'package:career_app/view/perfil_view.dart';
import 'package:career_app/view/settings_view.dart';
import 'package:career_app/view/tax_view.dart';
import 'package:career_app/view/wage_mapping_view.dart';

class Routes {
  static const String perfil = PersfilScreen.profileRoute;
  static const String wageMapping = WageMappingScreen.wageMappingRoute;
  static const String earningDeduction =
      EarningAndDeductionScreen.earningDeductionRoute;
  static const String tax = TaxScreen.taxRoute;
  static const String loanSimulator = LoanSimulatorScreen.loanSimulatorRoute;
  static const String settings = SettingsScreen.settingsRoute;
}
