"""Role testing files using testinfra."""


def test_package(host):
    """Validate package."""
    assert host.package('influxdb').is_installed

def test_service(host):
	"""Validate service"""
	influx = host.service('influxdb')

	assert influx.is_enabled
	assert influx.is_running


def test_config(host):
	influxd = host.run('influxd config')

	assert influxd.rc == 0
	assert influxd.stdout.find('/srv/influxdb/data') != -1
