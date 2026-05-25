{define, 'Top', "../.."}.
{define, 'TestDir', "'Top'/test"}.
{define, 'SpecDir', "'TestDir'/spec"}.
{define, 'ConfigDir', "'TestDir'/config"}.
{define, 'DEA', "'TestDir'"}.
{define, 'SpecFile', "'SpecDir'/testSpecification.spec"}.


{logdir, "'Top'/test/logs"}.

{config, 'ConfigDir', ["deaDefinition.cfg"]}.


{suites, 'DEA', all}.
{skip_suites, 'DEA', deaValidateTest_SUITE, "Not Implemented"}.
