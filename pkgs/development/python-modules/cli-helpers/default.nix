{ lib, buildPythonPackage, fetchPypi, isPy27
, backports_csv
, configobj
, mock
, pytest
, tabulate
, terminaltables
, wcwidth
}:

buildPythonPackage rec {
  pname = "cli_helpers";
  version = "2.2.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "733f65d8c921e0cffa8f7ae4c8735bd7ecdffec383c5246f647ddd0fddb33448";
  };

  propagatedBuildInputs = [
    configobj
    terminaltables
    tabulate
    wcwidth
  ] ++ (lib.optionals isPy27 [ backports_csv ]);

  # namespace collision between backport.csv and backports.configparser
  doCheck = !isPy27;

  checkInputs = [ pytest mock ];

  checkPhase = ''
    py.test
  '';

  meta = with lib; {
    description = "Python helpers for common CLI tasks";
    longDescription = ''
      CLI Helpers is a Python package that makes it easy to perform common
      tasks when building command-line apps. It's a helper library for
      command-line interfaces.

      Libraries like Click and Python Prompt Toolkit are amazing tools that
      help you create quality apps. CLI Helpers complements these libraries by
      wrapping up common tasks in simple interfaces.

      CLI Helpers is not focused on your app's design pattern or framework --
      you can use it on its own or in combination with other libraries. It's
      lightweight and easy to extend.

      What's included in CLI Helpers?

      - Prettyprinting of tabular data with custom pre-processing
      - [in progress] config file reading/writing

      Read the documentation at http://cli-helpers.rtfd.io
    '';
    homepage = "https://cli-helpers.readthedocs.io/en/stable/";
    license = licenses.bsd3 ;
    maintainers = [ maintainers.kalbasit ];
  };
}
