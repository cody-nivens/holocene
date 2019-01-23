# Holocene

Holocene is an application which assoicates writing with events in history.  It started as a project to move a book written in XML and dblatex
to an interactive data editor with code for creating timeline facades as well and grid tables of events.
As a book editor, footnotes, citations, glossary and bibliography are available.  When printed as a PDF, the events are listed with the 
section or chapter that they are associated with as well as a timeline using TimelineJS.

## Getting started

This is a standard Rails project.
```sh
git clone https://github.com/cody-nivens/holocene.git
cd holocene
bundle install
rake db:create && rake db:migrate && rake db:seed
rails s
```
There is one user - palo@alto.com.  His password is 123456789.

### Prerequisites

This project requires the installation of wkhtmltopdf binary.  [wkhtmltopdf](https://wkhtmltopdf.org/)
This project assumes an external MySQL server for its database functions.
This project assumes that a storage claim has been setup the use of ActiveStorage.

### Installing

The seed data is collected from my book started in XML and dblatex.  All comments on any event or interpretation of events is mine unless otherwise noted
in the seed data.  While quite large, the seeds.rb file loads bibliography information, a glossary which is incomplete and a set of XML files for each chapter
in the book and two collections of events for clutural items and Earth related items such as volcanos, comet/meteorite impacts and global climate activity such as Bond events.

## Deployment

The Jenkinsfile creates two images using Dockerfile.  One image is for testing and has the testing environment.  These images are used with
a set of Kubernetes yaml files to create a test job which runs the Rails tests using rake db:test; a setup job which creates a database, does
the database table migrations and adds data using rake db:seed.
These yaml files are set up to run under [Kubernetes](https://github.com/cody-nivens/kube-ci-cd-update) as an example of development -> Repo -> Jenkins -> Kubernetes.

Each time the setup job is run, it will drop and recreate the db.  To change this, remove DISABLE\_DATABASE\_ENVIRONMENT\_CHECK=1 from k8s/holocene\_setup\_job.yaml.

Additionally, a user will be installed: palo@alto.com.  The password is '12345689'.

## Built with

The main components of this project are the 
* *timelineJS-rails* - creates a timeline with the contents of any of the event collections in a book.
* *datagrid* - displays information in a table format.  Allows for filtering in a complex manner, sorting on any column, the ability to format and manipulate the data in a column.
* *wicked\_pdf* - allows for the creation of a PDF document.  This code uses the wkhtmltopdf binary.  The Dockerfile uses build images to
create a total image with the wkhtmltopdf binary as well as a ruby image to allow the code to run and create PDFs.
* *jvectormap* - allows for the use of vector map to display the location of events.


## Acknowledgements

Changes to Dockerfile to get wkhtmltopdf working in a container required using [Docker multistage builds](https://docs.docker.com/develop/develop-images/multistage-build/).

The use of wkhtmltopdf as a build image to pull binaries from is outlined in [Dockerfile for Rails app in production and other lessons learned](
https://anonoz.github.io/tech/2018/05/01/rails-dockerfile.html)

Geneology tree css code: [https://stackoverflow.com/questions/49656477/creating-family-tree-using-html-css](https://stackoverflow.com/questions/49656477/creating-family-tree-using-html-css).

Datagrid code: [https://github.com/bogdan/datagrid.git](https://github.com/bogdan/datagrid.git)

TimelineJS code: [https://github.com/mukesh-zensar/timelineJS-rails.git](https://github.com/mukesh-zensar/timelineJS-rails.git)

Map code: [https://github.com/bjornd/jvectormap](https://github.com/bjornd/jvectormap)

<div>Icons made by <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" 		    title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" 		    title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
