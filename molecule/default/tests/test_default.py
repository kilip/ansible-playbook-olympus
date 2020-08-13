"""Role testing files using testinfra."""

def test_hosts_file(host):
    """Validate /etc/hosts file."""
    f = host.file('/etc/hosts')

    assert f.exists
    assert f.user == 'root'
    assert f.group == 'root'

def test_cache_dir(host):
    """assert cache dir exists """
    assert host.file('/srv/cache/disk1').exists
    assert host.file('/srv/cache/disk2').exists


def test_package(host):
    pkg = host.package('squid')
    assert pkg.is_installed

def test_service(host):
    """assert service enabled and started"""
    squid = host.service('squid')
    assert squid.is_enabled
    assert squid.is_running

def test_port(host):
    """assert port is listening"""
    assert host.socket('tcp://0.0.0.0:3128').is_listening
