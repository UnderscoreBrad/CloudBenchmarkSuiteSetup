#!/bin/bash

declare -a repoLinks=(
"https://github.com/UnderscoreBrad/SingleFunctionIntegration"
"https://github.com/UnderscoreBrad/IntegrationMultiThreadTester"
)

declare -a repoNames=(
"SingleFunctionIntegration"
"IntegrationMultiThreadTester"
)

cd ..
cd ..

echo "== == DOWNLOADING REPOS FROM GITHUB == =="
for x in ${repoLinks[@]}; do
	echo "== == INSTALL REQUIREMENT: ${x} == =="
	git clone ${x} || echo "install failed: ${x}!\n Press Enter to Continue." read ans
done

echo "== == ADJUSTING REPO FOLDER PERMISSIONS == =="
for x in ${repoNames[@]}; do
	echo "FOLDER: ${x}"
	chmod 777 -R ${x}
done

cd "CloudBenchmarkSuiteSetup/setup"
ls
