"""Role testing files using testinfra."""


def test_service(host):
    """assert service enabled and started"""
    squid = host.service('squid')
    assert squid.is_enabled
    assert squid.is_running

def test_port(host):
    """assert port is listening"""
    assert host.socket('tcp://0.0.0.0:3128').is_listening
