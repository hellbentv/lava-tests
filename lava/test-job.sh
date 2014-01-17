target=$1
numtests=$2

device_type=dummy-host

cat > testjob.json <<EOL
{
    "actions": [
        {
            "command": "dummy_deploy",
            "parameters": {
                "target_type": "ubuntu"
            }
        },
        {
            "command": "lava_test_shell",
            "parameters": {
                "testdef_repos": [
                    {
                        "git-repo": "https://github.com/hellbentv/lava-tests.git",
                        "testdef": "simple.yaml"
                    }
                ]
            }
        },
        {
            "command": "submit_results",
            "parameters": {
                "server": "http://ubuntu/RPC2/",
                "stream": "/anonymous/sandbox/"
            }
        }
    ],
    "jobname": "dummy test",
    "logging_level": "DEBUG",
    "timeout": 900
}
EOL

for i in $(seq 1 $numtests); do
  /srv/lava/instances/testrig/bin/lava dispatch --target $target testjob.json 
done
