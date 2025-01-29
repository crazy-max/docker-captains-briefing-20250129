variable "REPO" {
  description = "Image repository"
}

variable "TAG" {
  description = "Image tag"
  default = "02-composable-attributes"
}

group "default" {
    targets = ["build"]
}

target "build" {
    description = "Build and output as image"
    tags = ["${REPO}:${TAG}"]
    output = [{
        type = "image"
    }]
    attest = [
        {
            type = "provenance"
            mode = "max"
        },
        {
            type = "sbom"
        }
    ]
}

target "push" {
    description = "Build and push to registry"
    inherits = ["build"]
    output = [{
        type = "registry"
    }]
}

target "binary" {
    description = "Build and output binary to local folder"
    inherits = ["build"]
    target = "binary"
    output = [{
        type = "local"
        dest = "./bin"
    }]
}
