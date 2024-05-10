job "site" {

    datacenters = ["dc1"] # Where should the job run?

    constraint {
        attribute = "${attr.kernel.name}"
        value = "linux"
    }

    constraint {
        attribute = "${node.unique.name}"
        operator = "=="
        value = "main"
    }

    update { # Rolling updates
        stagger = "10s" # Stagger updates every 10 seconds
        max_parallel = 1 # Update a single task at a time
        min_healthy_time = "10s"
    }

    group "site-group" { # Tasks in a group are scheduled on the same machine
        count = 1 # Control the number of instances of this group. Default: 1


        restart { # What if the job fails
            attempts = 10 # The number of attempts to run the job within the specified interval.
            delay = "25s" # A delay between a task failing and a restart occurring.
            interval = "5m" # When a task has restarted "attempts" times within the interval, 
            mode = "delay" # "delay" mode delays restart till next interval. "fail" mode does not restart task
        }

        network {
            port "http" {
                to = 80
                static = 8080
            }
        }

        task "site-task" {
            driver = "docker"

            config {
                image = "site:$IMAGE_VERSION"
                ports = ["http", ]
            }


            service {
                name = "${TASKGROUP}-http"
                tags = [
                    "external_service",
                    "http",
                ]
                port = "http"
            }

            resources {
                cpu = 100 # Mhz
                memory = 100 # MB
            }
        }
    }
}