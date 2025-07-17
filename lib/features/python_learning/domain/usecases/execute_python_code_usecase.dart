import 'package:python_ffi/python_ffi.dart';

class PythonExecutionResult {
  final String output;
  final String error;
  PythonExecutionResult({required this.output, required this.error});
}

class ExecutePythonCodeUseCase {
  Future<PythonExecutionResult> call(String code) async {
    try {
      final builtins = PythonFfi.instance.importModule('builtins');
      builtins.call('exec', <Object?>[code]);
      final out = PythonFfi.instance.stdout.toString();
      final err = PythonFfi.instance.stderr.toString();
      return PythonExecutionResult(output: out, error: err);
    } catch (e) {
      return PythonExecutionResult(output: '', error: e.toString());
    }
  }
}
