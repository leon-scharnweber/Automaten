{define, 'Top', "../.."}.
{define, 'TestDir', "'Top'/test"}.
{define, 'SpecDir', "'TestDir'/spec"}.
{define, 'ConfigDir', "'TestDir'/config"}.
{define, 'DEA', "'TestDir'"}.
{define, 'SpecFile', "'SpecDir'/testSpecification.spec"}.


{logdir, "'Top'/test/logs"}.

{config, 'ConfigDir', ["config.cfg"]}.


{suites, 'DEA', all}.
{skip_cases, 'DEA', deaEngineTest_SUITE, [tf03, tf04, tf05, tf06, tf07], "Not Implemented"}.
