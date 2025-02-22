{ lib
, olefile
, buildPythonPackage
, fetchFromGitHub
, poetry-core
, cryptography
, pytestCheckHook
, pythonOlder
, setuptools
}:

buildPythonPackage rec {
  pname = "msoffcrypto-tool";
  version = "4.12.0";
  format = "pyproject";

  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "nolze";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-EBEwldh2Ct/4oxnAF1hWeW/uRrVsCYEi0cJaZubofFk=";
  };

  nativeBuildInputs = [
    poetry-core
  ];

  propagatedBuildInputs = [
    cryptography
    olefile
    setuptools
  ];

  checkInputs = [
    pytestCheckHook
  ];

  disabledTests = [
    # Test fails with AssertionError
    "test_cli"
  ];

  pythonImportsCheck = [
    "msoffcrypto"
  ];

  meta = with lib; {
    description = "Python tool and library for decrypting MS Office files with passwords or other keys";
    homepage = "https://github.com/nolze/msoffcrypto-tool";
    license = with licenses; [ mit ];
    maintainers = with maintainers; [ fab ];
  };
}
