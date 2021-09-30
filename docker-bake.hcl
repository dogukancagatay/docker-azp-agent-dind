variable "IMAGE_NAME" {
    default = "dcagatay/azp-agent-dind"
}

variable "AGENT_VERSION" {
    default = "2.187.2"
}

group "default" {
    targets = [ "version" ]
}

target "latest" {
    context = "."
    platforms = [ "linux/amd64" ]
//     platforms = [ "linux/amd64", "linux/arm/v7", "linux/arm64/v8" ]
    cache-from = [
        "docker.io/${IMAGE_NAME}:latest"
    ]
    dockerfile = "Dockerfile"
    args = {
        AGENT_VERSION = AGENT_VERSION
    }
    tags = [
        "docker.io/${IMAGE_NAME}:latest"
    ]
}

target "version" {
    inherits = ["latest"]
    args = {
        AGENT_VERSION = AGENT_VERSION
    }
    tags = [
        "docker.io/${IMAGE_NAME}:${AGENT_VERSION}"
    ]
}
