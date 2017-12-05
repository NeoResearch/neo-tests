import pytest
import docker

from subprocess import call

@pytest.fixture(scope="session", autouse=True)
def setup():
    # <summary>
    # runs before every test, sets up a blank network ready for test
    # </summary>

    # load image
    client = docker.from_env()
    containers = client.containers.list()
    # loop through and stop if running
    # run a container from image 'neo-privnet:published' image

def test_singleTx():
    assert True