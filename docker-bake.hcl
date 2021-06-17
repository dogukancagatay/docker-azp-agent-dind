variable "IMAGE_NAME" {
    default = "dcagatay/azp-agent-dind"
}

group "default" {
    targets = [ "latest", "2.187.1" ]
    // targets = [ "latest", "2.187.1", "2.175.2" ]
}

target "latest" {
    context = "."
    platforms = [ "linux/amd64" ]
//     platforms = [ "linux/amd64", "linux/arm/v7", "linux/arm64/v8" ]
    dockerfile = "Dockerfile"
    args = {
        AGENT_VERSION = "2.187.1"
    }
    tags = [
        "docker.io/${IMAGE_NAME}:latest"
    ]
}

target "2.187.1" {
    inherits = ["latest"]
    args = {
        AGENT_VERSION = "2.187.1"
    }
    tags = [
        "docker.io/${IMAGE_NAME}:2.187.1"
    ]
}

target "2.175.2" {
    inherits = ["latest"]
    args = {
        AGENT_VERSION = "2.175.2"
    }
    tags = [
        "docker.io/${IMAGE_NAME}:2.175.2"
    ]
}
