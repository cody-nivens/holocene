node {

    checkout scm

    env.DOCKER_API_VERSION="1.23"
    
    sh "git rev-parse --short HEAD > commit-id"

    tag = "${env.BUILD_ID}"
    appName = "holocene"
    appNS = "default"
    testNS = "app-test"
    registryHost = "127.0.0.1:30400"
    imageName = "${registryHost}/${appName}:${tag}"
    imageNameTest = "${registryHost}/${appName}_test:latest"
    env.BUILDIMG=imageName

    stage("Build"){
    
        sh "docker build -t ${imageName} -f ./Dockerfile ./"
        sh "docker push ${imageName}"
        sh "docker build -t ${imageNameTest} -f ./Dockerfile.test ./"
        sh "docker push ${imageNameTest}"
    }
    stage("Test"){
        sh "kubectl delete --ignore-not-found=true --namespace ${testNS} -f k8s/${appName}_tests_job.yaml"
        sh "sed 's#${registryHost}/${appName}:latest#'${BUILDIMG}'#' k8s/${appName}_tests_job.yaml | kubectl apply --namespace ${testNS} -f -"
        sh "until kubectl get pod \$(kubectl get pods --namespace ${testNS} -l 'job-name=${appName}-tests' -o jsonpath='{.items[0].metadata.name}') --namespace ${testNS} -o jsonpath='{.status.conditions[?(@.type==\"Ready\")].status}' | grep True ; do sleep 15; done"
        sh "kubectl --namespace ${testNS} logs --pod-running-timeout=2m -f pod/\$(kubectl get pods --namespace ${testNS} -l 'job-name=${appName}-tests' -o jsonpath='{.items[0].metadata.name}')"
    }
    stage("Deploy"){

        sh "kubectl delete --ignore-not-found=true --namespace ${appNS} -f k8s/${appName}_setup_job.yaml"
        sh "sed 's#${registryHost}/${appName}:latest#'${BUILDIMG}'#' k8s/${appName}_setup_job.yaml | kubectl apply --namespace ${appNS} -f -"
        sh "sleep 15"
        sh "until kubectl get pod \$(kubectl get pods --namespace ${appNS} -l 'job-name=${appName}-setup' -o jsonpath='{.items[0].metadata.name}') --namespace ${appNS} -o jsonpath='{.status.conditions[?(@.type==\"Ready\")].status}' | grep True ; do sleep 15; done"
        sh "kubectl logs -n ${appNS} --pod-running-timeout=2m -f pod/\$(kubectl get -n ${appNS} pods -l 'job-name=${appName}-setup' -o jsonpath='{.items[0].metadata.name}')"
        sh "kubectl apply --namespace ${appNS} -f k8s/${appName}_service.yaml"
        sh "sed 's#${registryHost}/${appName}:latest#'${BUILDIMG}'#' k8s/${appName}_deployment.yaml | kubectl apply --namespace ${appNS} -f -"
        sh "kubectl rollout status --namespace ${appNS} deployment/${appName}"
        sh "sleep 15"
        sh "kubectl set image deployment/${appName} --namespace ${appNS} ${appName}=${imageName}"
    }
}
