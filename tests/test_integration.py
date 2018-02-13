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

    # delete existing container(s) if present to tidy up
    containers = client.containers.list(all=True, filters={'name':'neo-integration-test'})
    for c in containers[:]:
        c.stop()
        c.remove()

    # run container    
    container = client.containers.run(image=images[0], name='neo-integration-test', detach=True)

    return container

def test_True():
    assert True

def test_Running_Container(privnet):
    client = docker.from_env()
    runningContainers = client.containers.list()    
    assert len(runningContainers) == 1

def test_
