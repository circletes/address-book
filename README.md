# DockerAddressBook

A Dockerized JavaScript and HTML based implementation of an address book.

-------------------------------
Dockerized Address Book Details
-------------------------------
The solution to this address book was designed and implemented by Evan Rubin.
The implementation was written in JavaScript and HTML.

The folder structure contains the source code, this README File, the docker file used to dockerize the application, a JSON file showing all the packages used and a folder containing all the required node modules.

The docker image of this application can be found at: https://hub.docker.com/r/evrubin/dockeraddressbook/  
To pull the docker image use the following command: docker pull evrubin/dockeraddressbook

------------
System Requirements
------------

In order to successfully run the application the following system requirements should be met:
* It is recommended that a Linux or Apple machine is used. Docker does not always work as expected on a Windows machine. However to run the application locally and not in a dockerized container a Windows machine will work fine.
* The following packages are required to be installed on the computer being used:
  * Gitbash
  * Node.js
  * Socket.io
  * Mocha
  * Chai
  * Chai-http

-----------------------
Running the application
------------------------

Once all the computer requirements have been met, one can run the application as instructed below:

In order to successfully run this application locally:
1. Clone the GitHub repository.
2. In your command line application of choice navigate to the cloned project folder.
3. Run the command "node app.js".
4. Open your web browser of choice and navigate to: "localhost:8080"

In order to successfully run this application from the dockerized image:
1. open your command line application of choice and pull the docker image from dockerhub: "docker pull evrubin/dockeraddressbook".
2. Run the dockerized image in a container using the following command: "docker run -p 49160:8080 -d evrubin/dockeraddressbook"
3. Open your web browser of choice and navigate to: "localhost:49160"
4. If any changes are required to be made to the source code, one can bash into the dockerized container and adjust accordingly.


----------------------------------
Explanation of the solution chosen
----------------------------------
The task given was to design a containerized JavaScript application resembling an address book. This address book should store basic information such as contact names, contact numbers and an email address.

The solution opted for was that of a simple web based JavaScript application in order to allow for a simple GUI to be implemented for the ease of use. This solution involved the use of sockets and a simple server to perform some data storage and manipulation. The server stores an array of contact objects which can be sorted, displayed in a human readable format and manipulated as requested by the user.

--------------------
Features implemented
--------------------

The features implemented include:
- The ability to see all contacts in the address book
- The ability to sort the viewing list by first name or surname
- The ability to add new contacts to your address book
- The ability to edit contacts in your address book
- The ability to delete single contacts from your address book
- The ability to delete all the contacts from your address book

-------------------------
Testing
-------------------------

Within the code base, various unit tests testing the servers ability to fetch and display relevant web pages are implemented. Tests testing the server's functionality i.e. testing the functions and data requests and returns are included as well.

Once all the computer requirements have been meet, one can run the tests as instructed below:

In order to successfully run the tests:
1. In your command line application of choice navigate to the project's source folder.
2. Run the command "npm test" and all the tests will be run automatically.
----------------
Assumptions made
----------------
* The data the user enters into the form for the addition of contacts has not been checked for errors. This assumption was made owing to the fact that if a person wishes they can name their contact whatever they wish and add in any data they require not constraining them to specific area codes, languages and other potential restrictions. The only form of error checking implemented here was to ensure the user did not add a completely blank contact to their address book, at least one field is required to be filled out.
