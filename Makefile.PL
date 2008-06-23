use inc::Module::Install;
name 'Acme-PerlVMGolf';
all_from 'lib/Acme/PerlVMGolf.pm';

requires 'XSLoader';

tests 't/*.t t/*/*.t t/*/*/*.t t/*/*/*/*.t';
test_requires 'Test::More';
test_requires 'YAML';
author_tests('xt');
use_test_base;
auto_include;
WriteAll;
