"""Role testing files using testinfra."""


def test_remove_file(host):
    """Validate uninstall of /tmp/task_1.txt file."""
    f = host.file("/tmp/task_1.txt")

    assert not f.exists
