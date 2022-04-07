#!groovy

stage('Trigger Build') {
        build job: 'Build-Tag-Push-Deploy-DB-QA', wait: true, parameters: [
            [$class: 'StringParameterValue', name: 'DB_PROJECT', value: 'de-database']
        ]
}
