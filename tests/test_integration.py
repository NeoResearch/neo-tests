import pytest
import docker

@pytest.fixture
def privnet():
    # <summary>
    # runs before every test, sets up a blank network ready for test
    # </summary>

    # load image
    client = docker.from_env()
    images = client.images.list(name='neo-privnet:published')
    if not len(images) == 1:
        assert False
    # run container
    container = client.containers.run(image=images[0], name='testcontainer', detach=True)

    return container

def test_True():
    assert True

def test_Running_Container(privnet):
    client = docker.from_env()
    runningContainers = client.containers.list()    
    assert len(runningContainers) == 1

