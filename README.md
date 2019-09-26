
Installation
------------

    $ docker build . -t test0 
    
Operation
---------

    $ make clean
    $ docker run -v $(pwd)/:/workdir test0
