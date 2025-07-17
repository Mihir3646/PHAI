import 'dart:convert';

import 'package:python_ffi/python_ffi.dart';

class PythonExecutionResult {
  final String output;
  final String error;
  PythonExecutionResult({required this.output, required this.error});
}

class BuiltinsModule extends PythonModule {
  BuiltinsModule.from(super.moduleDelegate) : super.from();

  PythonFunction get _execFunc => getFunction('exec');

  void exec(String code) => _execFunc.call(<Object?>[code]);

  String get capturedOut => getAttribute<String>('__out');

  String get capturedErr => getAttribute<String>('__err');
}

class ExecutePythonCodeUseCase {
  Future<PythonExecutionResult> call(String code) async {
    try {
      final builtins = PythonFfi.instance.importModule(
        'builtins',
        BuiltinsModule.from,
      );

      final escaped = jsonEncode(code);

      final captureScript = '''
import io, contextlib, builtins
_stdout = io.StringIO()
_stderr = io.StringIO()
with contextlib.redirect_stdout(_stdout), contextlib.redirect_stderr(_stderr):
    exec($escaped)
builtins.__out = _stdout.getvalue()
builtins.__err = _stderr.getvalue()
''';

      builtins.exec(captureScript);

      return PythonExecutionResult(
        output: builtins.capturedOut,
        error: builtins.capturedErr,
      );
    } catch (e) {
      return PythonExecutionResult(output: '', error: e.toString());
    }
  }
}
