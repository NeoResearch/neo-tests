import pytest
import docker

@pytest.fixture
def setup():
    # <summary>
    # runs before every test, sets up a blank network ready for test
    # </summary>

    # load image
    client = docker.from_env()
    containers = client.containers.list(filters={'name':'neo-privnet'})    
    # loop through and stop if running
    # run a container from image 'neo-privnet:published' image

    return containers

def test_True():
    assert True

def test_Found_Container(setup):
    assert len(setup) == 1

