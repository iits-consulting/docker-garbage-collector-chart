## Usage
docker-garbage-collector helm chart for kubernetes
It is basically an advanced cronjob for cleanup of dangling volumes, images and exited containers


```shell
    export CHART_NAME=docker-garbage-collector
    export CHART_REPO_NAME=docker-garbage-collector-chart
    helm repo add $CHART_REPO_NAME https://iits-consulting.github.io/$CHART_REPO_NAME/
    helm search repo $CHART_NAME
    helm install $CHART_NAME $CHART_REPO_NAME/$CHART_NAME
```