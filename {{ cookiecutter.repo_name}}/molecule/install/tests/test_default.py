"""Role testing files using testinfra."""


def test_install_file(host):
    """Validate /tmp/task1.txt file."""
    f = host.file("/tmp/task_1.txt")

    assert f.exists
